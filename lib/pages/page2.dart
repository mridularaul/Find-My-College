import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:find_my_college/constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class outputScreen extends StatefulWidget {
  final String category;
  final double percentile;
  final List<String> city;
  final List<String> branch;

  const outputScreen({Key? key, required this.category, required this.percentile, required this.city, required this.branch}) : super(key: key);

  @override
  State<outputScreen> createState() => _OutputScreenState(category: category, percentile: percentile, city: city, branch: branch);
}

class _OutputScreenState extends State<outputScreen> {
  final String category;
  final double percentile;
  final List<String> city;
  final List<String> branch;


  _OutputScreenState({required this.category, required this.percentile, required this.city, required this.branch});

  final RxBool _isLoading = true.obs;
   List<String> filtercity = [];
   List<String> filterbranch = [];

  List<dynamic> collegeList = [];
  List<dynamic> colleges = [];
  Query databaseReference = FirebaseDatabase.instance.ref().child("college_db_with_predictions");

  Future<void> queryList(String category, List<String> cities, List<String> branches, List<dynamic> list) async {
    colleges = list.where((data) {
      if (data == null || data['Seat Type'] != category || data['Percentile'] >= percentile) {
        return false;
      }
      if (cities.isNotEmpty && !cities.contains(data['City'])) {
        return false;
      }
      if (branches.isNotEmpty && !branches.contains(data['Branch'])) {
        return false;
      }
      return true;
    }).toList();
    colleges.sort((a, b) => b['Percentile'].compareTo(a['Percentile']));
    collegeList.addAll(colleges);
  }

  void filterList(List<String> cities, List<String> branches, List<dynamic> list) {
    collegeList = list.where((data) {
      if (cities.isNotEmpty && !cities.contains(data['City'])) {
        return false;
      }
      if (branches.isNotEmpty && !branches.contains(data['Branch'])) {
        return false;
      }
      return true;
    }).toList();
    collegeList.sort((a, b) => b['Percentile'].compareTo(a['Percentile']));

  }

  @override
  void initState() {
    super.initState();
    databaseReference.get().then((DataSnapshot snapshot) {
      dynamic data = snapshot.value;
      queryList(category, city, branch, data);
      _isLoading.value = false;
    });
  }

  @override
  void dispose() {
    collegeList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "Recommended Colleges",
          style: kHeading.copyWith(fontSize: 25),
          textAlign: TextAlign.start,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Obx(
              () => !_isLoading.value
              ? (colleges.length != 0)
              ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: SizedBox(
                  height: 60,
                  child: Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (String cityName in city)
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FilterChip(
                              label: Text(cityName,style: kText.copyWith(fontSize: 12)),
                              onSelected: (bool selected) {
                                setState(() {
                                  if (selected) {
                                    filtercity.add(cityName);
                                  } else {
                                    filtercity.remove(cityName);
                                  }
                                  filterList(filtercity, filterbranch, colleges);
                                });
                                print(filtercity);
                              },
                              selected: filtercity.contains(cityName),
                            ),
                          ),
                        for (String branchName in branch)
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FilterChip(
                              label: Text(branchName,style: kText.copyWith(fontSize: 12),),
                              onSelected: (bool selected) {
                                setState(() {
                                  if (selected) {
                                    filterbranch.add(branchName);
                                  } else {
                                    filterbranch.remove(branchName);
                                  }
                                  filterList(filtercity, filterbranch, colleges);
                                });
                                print(filterbranch);
                              },
                              selected: filterbranch.contains(branchName),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: (collegeList.length <= 10) ? collegeList.length : 10,
                  itemBuilder: (BuildContext context, int i) {
                    return collegeCard(i, collegeList.elementAt(i)['College'], collegeList.elementAt(i)['Branch'], collegeList.elementAt(i)['City'], collegeList.elementAt(i)['Percentile']);
                  },
                ),
              ),
            ],
          )
              : Center(
            child: Text(
              "Oops! No colleges found\nGo back to modify your search",
              style: kText.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          )
              : TweenAnimationBuilder(
            tween: Tween(begin: 0, end: 0.5),
            duration: const Duration(milliseconds: 500),
            builder: (BuildContext context, Object? value, Widget? child) {
              return Positioned.fill(
                child: Container(
                  child: const Center(
                    child: CircularProgressIndicator(color: peach),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget collegeCard(int index, String name, String branch, String city, double cutoff) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
      child: boxWidget(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${index + 1}. $name", style: kboldText),
            Text(branch, style: kText.copyWith(fontSize: 12)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(city, style: kText.copyWith(fontSize: 12)),
                Text("Cut-off : ${cutoff.toStringAsFixed(6)}", style: kText.copyWith(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

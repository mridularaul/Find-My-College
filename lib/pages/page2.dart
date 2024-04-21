import 'package:flutter/material.dart';
import 'package:find_my_college/constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
class outputScreen extends StatefulWidget{
  final String category;
  final double percentile;
  final List<String> city;
  final List<String> branch;

  const outputScreen({super.key, required this.category, required this.percentile, required this.city, required this.branch});

  @override
  State<outputScreen> createState() => _outputScreenState(category: category,percentile: percentile,city: city,branch: branch);
}

class _outputScreenState extends State<outputScreen> {

  final String category;
  final double percentile;
  final List<String> city;
  final List<String> branch;
   _outputScreenState({required this.category, required this.percentile, required this.city, required this.branch});

  final RxBool _isLoading = true.obs;

  List<dynamic> collegeList = [];
  Query databaseReference = FirebaseDatabase.instance
      .ref()
      .child("college_db_with_predictions");

  Future<void> queryList(String category,List<String> cities, List<String> branches, List<dynamic> list) async {

    List<dynamic> filteredList = list.where((data) {
      if (data == null || data['Seat Type'] != category || data['Percentile'] >= percentile) {
        return false;
      }
      if (city.isNotEmpty && !cities.contains(data['City'])) {
        return false;
      }
      if (branch.isNotEmpty && !branches.contains(data['Branch'])) {
        return false;
      }
      return true;
    }).toList();

      collegeList.addAll(filteredList);

  }

  void initState() {
    super.initState();
    databaseReference.get().then((DataSnapshot snapshot){
      dynamic data = snapshot.value;
      queryList(category,city, branch, data);
      _isLoading.value = false;

     });

  }
  void dispose(){
    collegeList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(title: Text("My College List",style: kHeading.copyWith(fontSize: 30),textAlign: TextAlign.start,),backgroundColor: Colors.transparent,),
      body: SafeArea(
        child: Obx(
              () => !_isLoading.value
              ? (collegeList.length != 0)?
              ListView.builder(
                  itemCount: collegeList.length,
                  itemBuilder: (BuildContext context, int i){
                    return collegeCard(collegeList.elementAt(i)['College'], collegeList.elementAt(i)['Branch'], collegeList.elementAt(i)['City'], collegeList.elementAt(i)['Percentile']);
                  }
              )
                  :Center(
                child: Text("Oops! No colleges found\nGo back to modify your search",style: kText.copyWith(fontSize: 20),textAlign: TextAlign.center,),
              )
              : TweenAnimationBuilder(
            tween: Tween(begin: 0, end: 0.5),
            duration: const Duration(milliseconds: 500),
            builder: (BuildContext context, Object? value,
                Widget? child) {
              return Positioned.fill(
                child: Container(
                  child: const Center(
                      child: CircularProgressIndicator(color: peach,)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget collegeCard(String name,String branch,String city,double cutoff){
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
      child: boxWidget(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,style: kboldText,),
            Text(branch,style: kText.copyWith(fontSize: 12),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(city,style: kText.copyWith(fontSize: 12),),
                Text("Cut-off : ${cutoff.toStringAsFixed(6)}",style: kText.copyWith(fontSize: 12),),
              ],
            ),
          ],
        )
      ),
    );
  }
}


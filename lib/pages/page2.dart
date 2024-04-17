import 'package:flutter/material.dart';
import 'package:find_my_college/constants.dart';
class outputScreen extends StatefulWidget{
  @override
  State<outputScreen> createState() => _outputScreenState();
}

class _outputScreenState extends State<outputScreen> {
  List<Map> collegeList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(title: Text("My College List",style: kHeading.copyWith(fontSize: 30),textAlign: TextAlign.start,),backgroundColor: Colors.transparent,),
      body: SafeArea(
        child: Stack(
          children: [
            (collegeList.length != 0)?
            ListView.builder(
              itemCount: collegeList.length,
                itemBuilder: (BuildContext context, int i){
                  return collegeCard('name', 'branch', 'city');
                }
            )
            :SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget collegeCard(String name,String branch,String city){
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
      child: boxWidget(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,style: kboldText,),
            Text(branch,style: kText.copyWith(fontSize: 12),),
            Text(city,style: kText.copyWith(fontSize: 12),),
          ],
        )
      ),
    );
  }
}
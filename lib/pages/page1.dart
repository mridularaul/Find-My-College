import 'package:find_my_college/constants.dart';
import 'package:flutter/material.dart';
class inputScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome to\nFind My College", style: kHeading,),
              SizedBox(height: 15,),
              Text("We will recommend you the top engineering colleges in Maharashtra according to your percentile and preferences.",style: kText,),
              SizedBox(height: 15,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: lblue,
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),spreadRadius: 1,blurRadius: 5,offset: Offset(0,3),)],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("MHT-CET Percentile",style: kboldText,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 35,
                                  child: TextFormField(
                                    decoration: kTextFieldDecoration.copyWith(hintText: 'eg. 90.409319'),
                                    style: kText.copyWith(fontSize: 12),
                                    validator: (value){
                                      if(value is int){

                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
      
                    ],
                  ),
                ),
              )
      
            ],
          ),
        ) ,
      ),
    );
  }

}
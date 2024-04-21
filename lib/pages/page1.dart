import 'package:find_my_college/constants.dart';
import 'package:find_my_college/pages/page2.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/enum/app_enums.dart';
import 'package:multi_dropdown/models/chip_config.dart';
import 'package:multi_dropdown/models/value_item.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../data.dart';

class inputScreen extends StatelessWidget{

  final formkey = GlobalKey<FormState>();

  late double percentile;
  String category = "";
  List<String> city = [];
  List<String> branch = [];

  final MultiSelectController _categoryCont = MultiSelectController();
  final MultiSelectController _cityCont = MultiSelectController();
  final MultiSelectController _branchCont = MultiSelectController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body:Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome to\nFind My College", style: kHeading,),
                SizedBox(height: 15,),
                Text("We will recommend you the top engineering colleges in Maharashtra according to your percentile and preferences.",style: kText,),
                SizedBox(height: 15,),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      boxWidget(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("MHT-CET Percentile",style: kboldText,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                onChanged: (value)=> percentile = double.parse(value),
                                decoration: kTextFieldDecoration.copyWith(hintText: 'eg. 90.409319',
                                     contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                                    // isDense : true,
                                ),
                                style: kText.copyWith(fontSize: 12),
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                validator: (value){
                                  if(value == null || value.isEmpty || value == ','||value == '.'|| double.parse(value)>100.0 || double.parse(value)<0.0){
                                    return 'Please enter valid percentile';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      boxWidget(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Category",style: kboldText,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MultiSelectDropDown(
                                controller: _categoryCont,
                                onOptionSelected: (List<ValueItem> selectedOptions) {
                                  category = selectedOptions[0].toMap()['label'].toString();
                                },
                                onOptionRemoved: (int i,ValueItem selectedOptions){
                                  category ="";
                                },
                                options: categorylist,
                                selectionType: SelectionType.single,
                                searchEnabled: true,
                                searchBackgroundColor: Colors.white,
                                chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                                dropdownHeight: 250,
                                optionTextStyle: kText.copyWith(fontSize: 13),
                                selectedOptionIcon: const Icon(Icons.check_circle,color: Colors.black,),
                                fieldBackgroundColor: Colors.transparent,
                                borderColor: fontColor,
                                borderWidth: 1,
                                borderRadius: 2,
                                singleSelectItemStyle: kText.copyWith(fontSize: 12),
                                optionsBackgroundColor: Colors.transparent,
                                selectedOptionBackgroundColor: lpeach,
                                hintStyle: kText.copyWith(fontSize: 12,color: Colors.grey),
                                focusedBorderColor: peach,
                                focusedBorderWidth: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      boxWidget(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Preferred City (Optional)",style: kboldText,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MultiSelectDropDown(
                                controller: _cityCont,
                                onOptionSelected: (List<ValueItem> selectedOptions) {},
                                options: citylist,
                                selectionType: SelectionType.multi,
                                searchEnabled: true,
                                searchBackgroundColor: Colors.white,
                                chipConfig:  ChipConfig(
                                  wrapType: WrapType.wrap,
                                  backgroundColor: peach,
                                  labelStyle: kText.copyWith(fontSize: 12,color: Colors.white),
                                  radius: 7,
                                  runSpacing: 0
                                ),
                                dropdownHeight: 250,
                                optionTextStyle: kText.copyWith(fontSize: 13),
                                selectedOptionIcon: const Icon(Icons.check_circle,color: Colors.black,),
                                fieldBackgroundColor: Colors.transparent,
                                borderColor: fontColor,
                                borderWidth: 1,
                                borderRadius: 2,
                                singleSelectItemStyle: kText.copyWith(fontSize: 12),
                                optionsBackgroundColor: Colors.transparent,
                                selectedOptionBackgroundColor: lpeach,
                                hintStyle: kText.copyWith(fontSize: 12,color: Colors.grey),
                                focusedBorderColor: peach,
                                focusedBorderWidth: 1.5,

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text("Can Select Multiple",style: kText.copyWith(fontSize: 11),),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      boxWidget(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Preferred Branch (Optional)",style: kboldText,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MultiSelectDropDown(
                                controller: _branchCont,
                                onOptionSelected: (List<ValueItem> selectedOptions) {},
                                options: branchlist,
                                selectionType: SelectionType.multi,
                                searchEnabled: true,
                                searchBackgroundColor: Colors.white,
                                chipConfig:  ChipConfig(
                                    wrapType: WrapType.wrap,
                                    backgroundColor: peach,
                                    labelStyle: kText.copyWith(fontSize: 12,color: Colors.white),
                                    radius: 7,
                                    runSpacing: 0
                                ),
                                dropdownHeight: 250,
                                optionTextStyle: kText.copyWith(fontSize: 13),
                                selectedOptionIcon: const Icon(Icons.check_circle,color: Colors.black,),
                                fieldBackgroundColor: Colors.transparent,
                                borderColor: fontColor,
                                borderWidth: 1,
                                borderRadius: 2,
                                singleSelectItemStyle: kText.copyWith(fontSize: 12),
                                optionsBackgroundColor: Colors.transparent,
                                selectedOptionBackgroundColor: lpeach,
                                hintStyle: kText.copyWith(fontSize: 12,color: Colors.grey),
                                focusedBorderColor: peach,
                                focusedBorderWidth: 1.5,

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text("Can Select Multiple",style: kText.copyWith(fontSize: 11),),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      ElevatedButton(
                          onPressed: (){
                            city.clear();
                            branch.clear();

                            for (final cities in _cityCont.selectedOptions){
                              city.add(cities.toMap()['label'].toString());
                            }
                            for (final branches in _branchCont.selectedOptions){
                              branch.add(branches.toMap()['label'].toString());
                            }

                            if( _categoryCont.selectedOptions.isEmpty){
                              print("category not selected");
                              ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(
                                  content: Text('Select category!',style: kboldText.copyWith(color: Colors.white),),
                                  backgroundColor: peach,
                                   behavior: SnackBarBehavior.floating,
                                ),
                              );
                            }
                            else if(formkey.currentState!.validate()){
                              print(category);
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>outputScreen(category: category, percentile: percentile, city: city, branch: branch,)),
                              );
                            }

                          },
                          child: Text("Find My College",style: kboldText.copyWith(color: Colors.white),),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: fontColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                              elevation: 8,
                              shadowColor: Colors.grey
                          ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
        ) ,
      ),
    );
  }



}
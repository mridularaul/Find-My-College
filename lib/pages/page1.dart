import 'package:find_my_college/constants.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/enum/app_enums.dart';
import 'package:multi_dropdown/models/chip_config.dart';
import 'package:multi_dropdown/models/value_item.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class inputScreen extends StatelessWidget{
  final formkey = GlobalKey<FormState>();
  late double percentile;
  final MultiSelectController _categoryCont = MultiSelectController();

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
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        boxWidget(
                          lblue,
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("MHT-CET Percentile",style: kboldText,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    onChanged: (value)=>percentile = double.parse(value),
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
                        ),
                        SizedBox(height: 10,),
                        boxWidget(
                            lpink,
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Category",style: kboldText,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MultiSelectDropDown(
                                    controller: _categoryCont,
                                    onOptionSelected: (List<ValueItem> selectedOptions) {},
                                    options: const <ValueItem>[
                                      ValueItem(label: 'Option 1', value: '1'),
                                      ValueItem(label: 'Option 2', value: '2'),
                                      ValueItem(label: 'Option 3', value: '3'),
                                      ValueItem(label: 'Option 4', value: '4'),
                                      ValueItem(label: 'Option 5', value: '5'),
                                      ValueItem(label: 'Option 6', value: '6'),
                                    ],
                                    selectionType: SelectionType.single,
                                    chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                                    dropdownHeight: 250,
                                    optionTextStyle: kText.copyWith(fontSize: 13),
                                    selectedOptionIcon: const Icon(Icons.check_circle,color: Colors.black,),
                                    fieldBackgroundColor: Colors.transparent,
                                    borderColor: fontColor,
                                    borderWidth: 1,
                                    borderRadius: 2,
                                    singleSelectItemStyle: kText.copyWith(fontSize: 12),
                                    dropdownBackgroundColor: lpink,
                                    optionsBackgroundColor: Colors.transparent,
                                    selectedOptionBackgroundColor: darkPink,
                                    hintStyle: kText.copyWith(fontSize: 12,color: Colors.grey),
                                    focusedBorderColor: darkPink,
                                    focusedBorderWidth: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        ElevatedButton(
                            onPressed: (){
                              if(formkey.currentState!.validate()){
                                print("pressed enter");
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
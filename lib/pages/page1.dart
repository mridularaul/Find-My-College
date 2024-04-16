import 'package:find_my_college/constants.dart';
import 'package:find_my_college/pages/page2.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/enum/app_enums.dart';
import 'package:multi_dropdown/models/chip_config.dart';
import 'package:multi_dropdown/models/value_item.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class inputScreen extends StatelessWidget{
  final formkey = GlobalKey<FormState>();
  late double percentile;
  final MultiSelectController _categoryCont = MultiSelectController();
  final MultiSelectController _cityCont = MultiSelectController();
  final MultiSelectController _branchCont = MultiSelectController();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body:Expanded(
          child: Padding(
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
                        SizedBox(height: 15,),
                        boxWidget(
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
                                      ValueItem(label: 'TFWS', value: '1'),
                                      ValueItem(label: 'LOPENS', value: '2'),
                                      ValueItem(label: 'GOPENS', value: '3'),
                                      ValueItem(label: 'GNT3S', value: '4'),
                                      ValueItem(label: 'LNT2S', value: '5'),
                                      ValueItem(label: 'GNT2S', value: '6'),
                                      ValueItem(label: 'GOBCS', value: '7'),
                                      ValueItem(label: 'EWS', value: '8'),
                                      ValueItem(label: 'LOBCS', value: '9'),
                                      ValueItem(label: 'LNT1S', value: '10'),
                                      ValueItem(label: 'DEFOPENS', value: '11'),
                                      ValueItem(label: 'DEFROBCS', value: '12'),
                                      ValueItem(label: 'GOPENO', value: '13'),
                                      ValueItem(label: 'LOPENO', value: '14'),
                                      ValueItem(label: 'GOPENH', value: '15'),
                                      ValueItem(label: 'GNT2O', value: '16'),
                                      ValueItem(label: 'GOBCO', value: '17'),
                                      ValueItem(label: 'GNT1S', value: '18'),
                                      ValueItem(label: 'GVJS', value: '19'),
                                      ValueItem(label: 'DEFOBCS', value: '20'),
                                      ValueItem(label: 'ORPHAN', value: '21'),
                                      ValueItem(label: 'LOPENH', value: '22'),
                                      ValueItem(label: 'GNT3H', value: '23'),
                                      ValueItem(label: 'LNT3S', value: '24'),
                                      ValueItem(label: 'GOBCH', value: '25'),
                                      ValueItem(label: 'LNT1H', value: '26'),
                                      ValueItem(label: 'LSCS', value: '27'),
                                      ValueItem(label: 'LNT2H', value: '28'),
                                      ValueItem(label: 'LNT3H', value: '29'),
                                      ValueItem(label: 'GNT1H', value: '30'),
                                      ValueItem(label: 'LOBCO', value: '31'),
                                      ValueItem(label: 'GNT1O', value: '32'),
                                      ValueItem(label: 'LOBCH', value: '33'),
                                      ValueItem(label: 'AI', value: '34'),
                                      ValueItem(label: 'GSCS', value: '35'),
                                      ValueItem(label: 'LVJS', value: '36'),
                                      ValueItem(label: 'LVJH', value: '37'),
                                      ValueItem(label: 'GNT3O', value: '38'),
                                      ValueItem(label: 'PWDOPENS', value: '39'),
                                      ValueItem(label: 'GNT2H', value: '40'),
                                      ValueItem(label: 'LNT2O', value: '41'),
                                      ValueItem(label: 'GVJO', value: '42'),
                                      ValueItem(label: 'GSCO', value: '43'),
                                      ValueItem(label: 'LSCO', value: '44'),
                                      ValueItem(label: 'DEFRNT2S', value: '45'),
                                      ValueItem(label: 'MI', value: '46'),
                                      ValueItem(label: 'GSCH', value: '47'),
                                      ValueItem(label: 'PWDOBCS', value: '48'),
                                      ValueItem(label: 'MI-MH', value: '49'),
                                      ValueItem(label: 'GVJH', value: '50'),
                                      ValueItem(label: 'PWDOPE..', value: '51'),
                                      ValueItem(label: 'DEFOPCS', value: '52'),
                                      ValueItem(label: 'PWDSCS', value: '53'),
                                      ValueItem(label: 'GSTS', value: '54'),
                                      ValueItem(label: 'DEFRNT3S', value: '55'),
                                      ValueItem(label: 'PWDOPENH', value: '56'),
                                      ValueItem(label: 'LSTS', value: '57'),
                                      ValueItem(label: 'DEFRSCS', value: '58'),
                                      ValueItem(label: 'PWDROBCS', value: '59'),
                                      ValueItem(label: 'LSCH', value: '60'),
                                      ValueItem(label: 'PWDOBCH', value: '61')
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
                        ),
                        SizedBox(height: 15,),
                        boxWidget(
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Preferred City (Can Select Multiple)",style: kboldText,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MultiSelectDropDown(
                                    controller: _cityCont,
                                    onOptionSelected: (List<ValueItem> selectedOptions) {},
                                    options: const <ValueItem>[
                                      ValueItem(label: 'Mumbai', value: '1'),
                                      ValueItem(label: 'Pune', value: '2'),
                                      ValueItem(label: 'Sangli', value: '3'),
                                      ValueItem(label: 'Mumba', value: '4'),
                                      ValueItem(label: 'Nagpur', value: '5'),
                                      ValueItem(label: 'Aurangabad', value: '6'),
                                      ValueItem(label: 'Karad', value: '7'),
                                      ValueItem(label: 'Navi Mumbai', value: '8'),
                                      ValueItem(label: 'Nanded', value: '9'),
                                      ValueItem(label: 'Kolhapur', value: '10'),
                                      ValueItem(label: 'Amravati', value: '11'),
                                      ValueItem(label: 'Avasari Khurd', value: '12'),
                                      ValueItem(label: 'Andheri', value: '13'),
                                      ValueItem(label: 'Nashik', value: '14'),
                                      ValueItem(label: 'Shegaon', value: '15'),
                                      ValueItem(label: 'Ichalkaranji', value: '16'),
                                      ValueItem(label: 'Sangamner', value: '17'),
                                    ],
                                    selectionType: SelectionType.multi,
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
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        boxWidget(
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Preferred Branch (Can Select Multiple)",style: kboldText,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MultiSelectDropDown(
                                    controller: _branchCont,
                                    onOptionSelected: (List<ValueItem> selectedOptions) {},
                                    options: const <ValueItem>[
                                      ValueItem(label: 'Computer Engineering', value: '1'),
                                      ValueItem(label: 'Information Technology', value: '2'),
                                      ValueItem(label: 'Electronics and Telecommunication Engineering', value: '3'),
                                      ValueItem(label: 'Computer Science and Engineering (AI and ML)', value: '4'),
                                      ValueItem(label: 'Computer Science and Engineering (Data Science)', value: '5'),
                                      ValueItem(label: 'Computer Science and Engineering', value: '6'),
                                      ValueItem(label: 'Electrical Engineering', value: '7'),
                                      ValueItem(label: 'Chemical Engineering', value: '8'),
                                      ValueItem(label: 'Electronics Engineering', value: '9'),
                                      ValueItem(label: 'Instrumentation and Control Engineering', value: '10'),
                                      ValueItem(label: 'Mechanical Engineering', value: '11'),
                                      ValueItem(label: 'Artificial Intelligence (AI) and Data Science', value: '12'),
                                      ValueItem(label: 'Computer Science and Engineering (AI)', value: '13'),
                                      ValueItem(label: 'Polymer Engineering and Technology', value: '14'),
                                      ValueItem(label: 'Pharmaceuticals Chemistry and Technology', value: '15'),
                                      ValueItem(label: 'Computer Science and Engineering (Internet of Things and Cyber Security Including Block Chain Technology)', value: '16'),
                                      ValueItem(label: 'Civil Engineering', value: '17'),
                                      ValueItem(label: 'Food Engineering and Technology', value: '18'),
                                      ValueItem(label: 'Computer Science and Engineering(Data Science)', value: '19'),
                                      ValueItem(label: 'Artificial Intelligence and Data Science', value: '20'),
                                      ValueItem(label: 'Electronics and Telecommunication Engg', value: '21'),
                                      ValueItem(label: 'Computer Science and Engineering (Artificial Intelligence)', value: '22'),
                                      ValueItem(label: 'Computer Science and Engineering (Artificial Intelligence and Machine Learning)', value: '23'),
                                      ValueItem(label: 'Artificial Intelligence and Machine Learning', value: '24'),
                                      ValueItem(label: 'Computer Science and Engineering (Artificial Intelligence and Machine Learning)', value: '25'),
                                      ValueItem(label: 'Computer Engineering (Regional Language)', value: '26'),
                                      ValueItem(label: 'Manufacturing Science and Engineering', value: '27'),
                                      ValueItem(label: 'Oil,Oleochemicals and Surfactants Technology', value: '28'),
                                      ValueItem(label: 'Surface Coating Technology', value: '29'),
                                      ValueItem(label: 'Production Engineering[Sandwich]', value: '30'),
                                      ValueItem(label: 'Oil, Oleochemicals and Surfactants Technology', value: '31'),
                                      ValueItem(label: 'Computer Science and Business Systems', value: '32'),
                                      ValueItem(label: 'Metallurgy and Material Technology', value: '33'),
                                      ValueItem(label: 'Computer Science and Information Technology', value: '34'),
                                      ValueItem(label: 'Computer Science and Engineering(Cyber Security)', value: '35'),
                                    ],
                                    selectionType: SelectionType.multi,
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
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        ElevatedButton(
                            onPressed: (){
                              if(formkey.currentState!.validate()){
                                print("pressed enter");
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>outputScreen()),
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
          ),
        ) ,
      ),
    );
  }



}
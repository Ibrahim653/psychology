import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:psychology/utils/styles.dart';

import '../../../../controller/controllers/doctor_controller/doctor_main_controller.dart';
import '../../../../controller/controllers/patient_controller/patient_profile_controller.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/my_string.dart';
import '../../../../utils/size_config.dart';
import '../../../widgets/auth/auth_button.dart';
import '../../../widgets/auth/auth_text_from_field.dart';
import '../../../widgets/utils_widgets/height_size_box.dart';

class DoctorExperience extends StatelessWidget {
  DoctorExperience({Key? key}) : super(key: key);
  final formUpdateKey = GlobalKey<FormState>();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController industryController = TextEditingController();
  final mainController = MainDoctorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBackGroundColor,
      appBar: AppBar(
        backgroundColor: mainColor2,
        elevation: 0,
        title: Text("Complete Information"),
        centerTitle: true,
        toolbarHeight: 70,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            IconBroken.Arrow___Left_2,
            size: 35,
          ),
        ),
      ),
      body: GetBuilder(
        builder: (MainDoctorController mainController) {
          return Container(
            height: SizeConfig.screenHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  mainColor2,
                  mainColor4,
                  mainColor,
                  Color(0xffB4ECE3),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Form(
                  key: formUpdateKey,
                  child: Column(
                    children: [
                      HeightSizeBox(SizeConfig.defaultSize!),
                      Center(
                          child: Text(
                        "Experience",
                        style: TextStyle(
                          fontSize: SizeConfig.defaultSize!,
                          fontWeight: FontWeight.w500,
                          color: white,
                        ),
                      )),
                      HeightSizeBox(SizeConfig.defaultSize! * 3),
                      AuthTextFromField(
                        controller: experienceController,
                        obscureText: false,
                        validator: (value) {
                          if (value.length == 0) {
                            return 'Please enter experience';
                          } else if (value.toString().length <= 2 ||
                              !RegExp(validationName).hasMatch(value)) {
                            return "Enter valid text";
                          } else {
                            return null;
                          }
                        },
                        hintText: "Experience",
                        textInputType: TextInputType.text,
                        suffixIcon: Text(""),
                        prefixIcon: Icon(
                          Icons.account_circle_outlined,
                          color: white,
                        ),
                      ),
                      HeightSizeBox(SizeConfig.defaultSize!),
                      AuthTextFromField(
                        controller: industryController,
                        obscureText: false,
                        validator: (value) {
                          if (value.length == 0) {
                            return 'Please enter industry';
                          } else if (value.toString().length <= 2 ||
                              !RegExp(validationName).hasMatch(value)) {
                            return "Enter valid text";
                          } else {
                            return null;
                          }
                        },
                        hintText: "Industry",
                        textInputType: TextInputType.text,
                        suffixIcon: Text(""),
                        prefixIcon: Icon(
                          Icons.build_circle_outlined,
                          color: white,
                        ),
                      ),
                      HeightSizeBox(SizeConfig.defaultSize!),
                      HeightSizeBox(SizeConfig.defaultSize!),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1920),
                                lastDate: DateTime(2040),
                              ).then((value) {
                                mainController.changeSelectedStartTime(
                                    DateFormat('yyyy-MM-dd')
                                        .format(value!)
                                        .toString());
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                              // width: Get.width * .4,
                              // height: Get.height * .05,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.date_range,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Start Date",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        "${mainController.educationStartDate}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1920),
                                lastDate: DateTime(2040),
                              ).then((value) {
                                mainController.changeSelectedEndTime(
                                    DateFormat('yyyy-MM-dd')
                                        .format(value!)
                                        .toString());
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                              // width: Get.width * .4,
                              // height: Get.height * .05,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.date_range,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "End Date",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        "${mainController.educationEndDate}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      HeightSizeBox(SizeConfig.defaultSize! * 3),
                      AuthButton(
                          onPressed: () {
                            if (formUpdateKey.currentState!.validate()) {
                              mainController.addExperience(
                                experienceController.text,
                                industryController.text,
                                mainController.educationStartDate,
                                mainController.educationEndDate,
                              );
                            }
                          },
                          text:mainController.isLoading==false? Text("Save Changes",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)):SizedBox(
                              width: SizeConfig.defaultSize,
                              height: SizeConfig.defaultSize,
                              child: CircularProgressIndicator(
                                color: mainColor,
                              )),
                          width: SizeConfig.width! * .7)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

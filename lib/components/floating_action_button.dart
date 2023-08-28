import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:weight_graph_with_getx/Controller/page_controller.dart';

class FloatingButton extends StatelessWidget {
  @override
  //GetX Controllers
  final RecordController recordController = Get.find<RecordController>();
  final DateController dateController = Get.find<DateController>();
  final WeightController weightController = Get.find<WeightController>();
  //

  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    var date = dateController.date;

    // var selecetedValue = weightController.selectedWeight.value;
    double n = 15;
    return FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xff279F65),
        onPressed: () {
          Get.dialog(
            barrierDismissible: false,
            Dialog(
              child: Container(
                height: Get.height * 0.85,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                      Text(
                        "Choose your weight",
                        style: GoogleFonts.poppins(fontSize: 25),
                      ),
                      Card(
                        child: Stack(
                          children: [
                            Obx(
                              () => NumberPicker(
                                textStyle: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                selectedTextStyle: GoogleFonts.poppins(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                itemCount: 3,
                                itemHeight: 60,
                                axis: Axis.horizontal,
                                minValue: 40,
                                maxValue: 250,
                                value: weightController.selectedWeight.value,
                                onChanged: (value) {
                                  weightController.changeWeight(value);
                                },
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              right: 0,
                              child: Icon(Icons.arrow_drop_down),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Icon(Icons.arrow_drop_up),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: n,
                      ),
                      Text(
                        "Choose date",
                        style: GoogleFonts.poppins(fontSize: 25),
                      ),
                      GestureDetector(
                        onTap: () async {
                          date = await showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: date.subtract(Duration(days: 365)),
                                lastDate: date.add(Duration(days: 365)),
                              ) ??
                              date;
                          dateController.pickDate(date);
                        },
                        child: GetBuilder<DateController>(
                          builder: (_) => Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: Text(
                                DateFormat("EEE,MMM,d").format(date),
                                style: GoogleFonts.poppins(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: n,
                      ),
                      Text(
                        "Note",
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 15),
                        child: TextFormField(
                          minLines: 1,
                          controller: textEditingController,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            hintText: "Your text",
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: n,
                      ),
                      SizedBox(
                        width: Get.width * 0.7,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color(0xff099773),
                              Color(0xff43b692),
                            ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: () {
                              recordController.addRecords(
                                  date,
                                  weightController.selectedWeight.value,
                                  textEditingController.text);
                            },
                            child: Text(
                              "Confirm",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ));
  }
}

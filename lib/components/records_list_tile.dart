import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weight_graph_with_getx/Controller/page_controller.dart';
import 'package:weight_graph_with_getx/models/records_model.dart';

class RecordsListTile extends StatelessWidget {
  final Records records;
  RecordsListTile({Key? key, required this.records}) : super(key: key);
  final RecordController recordController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, left: 5, right: 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        shadowColor: Colors.white,
        color: Color(0xff82f4b1).withOpacity(0.6),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: ListTile(
            leading: Text(
              DateFormat('EEE,MMM d').format(records.date),
              style: GoogleFonts.poppins(),
            ),
            title: Center(
              child: Text(
                records.weight.toString(),
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    fontSize: 25),
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    recordController.deleteRecords(records);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

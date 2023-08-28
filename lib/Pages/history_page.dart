import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weight_graph_with_getx/Controller/page_controller.dart';
import 'package:weight_graph_with_getx/components/records_list_tile.dart';

import '../models/records_model.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final RecordController recordsController = Get.put(RecordController());
  @override
  Widget build(BuildContext context) {
    List<Records> records = recordsController.records;
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            "History",
            style: GoogleFonts.poppins(
              color: Colors.black54,
            ),
          ),
        ),
        body: records.isEmpty
            ? Center(
                child: Text(
                  "There is no record to show",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 34,
                  ),
                ),
              )
            : Center(
                child: ListView(
                  padding: EdgeInsets.only(bottom: 85),
                  physics: BouncingScrollPhysics(),
                  children:
                      records.map((e) => RecordsListTile(records: e)).toList(),
                ),
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphic/graphic.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../Controller/page_controller.dart';
import '../components/graph_widget.dart';
import '../models/records_model.dart';

class GraphPage extends StatelessWidget {
  final RecordController recordController = Get.find<RecordController>();

  @override
  Widget build(BuildContext context) {
    final _monthDayFormat = DateFormat('MM-dd');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Graph",
          style: GoogleFonts.poppins(
            color: Colors.black54,
          ),
        ),
      ),
      body: Column(
        children: [
          GraphWidget(
              recordController: recordController,
              monthDayFormat: _monthDayFormat),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:intl/intl.dart';

import '../Controller/page_controller.dart';
import '../models/records_model.dart';

class GraphWidget extends StatelessWidget {
  const GraphWidget({
    super.key,
    required this.recordController,
    required DateFormat monthDayFormat,
  }) : _monthDayFormat = monthDayFormat;

  final RecordController recordController;
  final DateFormat _monthDayFormat;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: Chart(
        data: recordController.records,
        variables: {
          'Date': Variable(
            accessor: (Records datum) => datum.date,
            scale: TimeScale(
              formatter: (time) => _monthDayFormat.format(time),
            ),
          ),
          'Weight': Variable(
            accessor: (Records datum) => datum.weight,
          ),
        },
        marks: [
          LineMark(
            shape: ShapeEncode(value: BasicLineShape(dash: [5, 2])),
            selected: {
              'touchMove': {1}
            },
          )
        ],
        coord: RectCoord(color: const Color(0xffdddddd)),
        axes: [
          Defaults.horizontalAxis,
          Defaults.verticalAxis,
        ],
        selections: {
          'touchMove': PointSelection(
            on: {
              GestureType.scaleUpdate,
              GestureType.tapDown,
              GestureType.longPressMoveUpdate
            },
            dim: Dim.x,
          ),
        },
        tooltip: TooltipGuide(
          followPointer: [false, true],
          align: Alignment.topLeft,
          offset: const Offset(-20, -20),
        ),
        crosshair: CrosshairGuide(followPointer: [false, true]),
      ),
    );
  }
}

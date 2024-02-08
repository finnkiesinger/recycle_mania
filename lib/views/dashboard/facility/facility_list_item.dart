import 'dart:math';

import 'package:flutter/material.dart';
import 'package:recycle_mania/views/dashboard/facility/progress_view.dart';
import '../../../models/facility/io_facility.dart';
import 'processing_view.dart';
import 'item_column.dart';
import 'pipeline_header.dart';
import 'processing_graph.dart';

class FacilityListItem extends StatefulWidget {
  final IOFacility facility;

  const FacilityListItem({
    super.key,
    required this.facility,
  });

  @override
  State<FacilityListItem> createState() => _FacilityListItemState();
}

class _FacilityListItemState extends State<FacilityListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            widget.facility.name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            SizedBox(width: 16),
            PipelineHeader(
              title: "Input",
              color: Colors.cyan,
            ),
            Spacer(),
            PipelineHeader(
              title: "Output",
              color: Colors.green,
            ),
            SizedBox(width: 16),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: max(widget.facility.input.length,
                    widget.facility.output.length) *
                processViewNodeHeight,
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80,
                      height: max(widget.facility.input.length,
                              widget.facility.output.length) *
                          processViewNodeHeight,
                    ),
                    ProcessingGraph(
                      input: widget.facility.input,
                      output: widget.facility.output,
                    ),
                    const SizedBox(width: 80),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ItemColumn(io: widget.facility.input),
                    const Spacer(),
                    ItemColumn(io: widget.facility.output),
                  ],
                ),
                Center(
                  child: ProgressView(
                    facility: widget.facility,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

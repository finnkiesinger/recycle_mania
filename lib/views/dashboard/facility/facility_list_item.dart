import 'dart:math';

import 'package:flutter/material.dart';
import '../../util/smooth_rectangle_border.dart';
import 'graph_facility_indicator.dart';
import 'progress_view.dart';
import '../../../models/facility/io_facility.dart';
import 'processing_view.dart';
import 'item_column.dart';
import 'processing_graph.dart';

class FacilityListItem extends StatefulWidget {
  final IOFacility facility;
  final bool animating;
  final bool hideTitle;
  final bool collapsed;

  const FacilityListItem({
    super.key,
    required this.facility,
    this.animating = true,
    this.hideTitle = false,
    this.collapsed = false,
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
        if (!widget.hideTitle)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 4,
              ),
              decoration: ShapeDecoration(
                shape: SmoothRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  smoothness: 1,
                ),
                color: Colors.white10,
              ),
              child: Text(
                widget.facility.name,
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        Padding(
          padding: !widget.collapsed
              ? const EdgeInsets.all(16.0)
              : const EdgeInsets.symmetric(horizontal: 16),
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
                      width: 94,
                      height: max(widget.facility.input.length,
                              widget.facility.output.length) *
                          processViewNodeHeight,
                    ),
                    ProcessingGraph(
                      input: widget.facility.input,
                      output: widget.facility.output,
                    ),
                    const SizedBox(width: 94),
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
                  child: widget.animating
                      ? ProgressView(
                          facility: widget.facility,
                        )
                      : GraphFacilityIndicator(
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

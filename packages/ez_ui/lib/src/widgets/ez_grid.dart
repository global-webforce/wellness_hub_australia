import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class EzGrid extends StatelessWidget {
  final int itemCount;
  final int column;
  final double spacing;
  final double? gridHeight;
  final bool shrinkWrap;
  final Axis scrollDirection;
  final bool fixed;
  final Widget Function(BuildContext, int) itemBuilder;

  const EzGrid({
    required this.itemBuilder,
    Key? key,
    this.itemCount = 0,
    this.spacing = 0,
    this.column = 1,
  })  : shrinkWrap = false,
        scrollDirection = Axis.vertical,
        gridHeight = null,
        fixed = false,
        super(key: key);

  const EzGrid.verticalFixed({
    required this.itemBuilder,
    Key? key,
    this.itemCount = 0,
    this.spacing = 0,
    this.column = 1,
  })  : shrinkWrap = true,
        scrollDirection = Axis.vertical,
        gridHeight = null,
        fixed = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return itemCount <= 0
        ? const Center(child: Text("No Items"))
        : AlignedGridView.count(
            shrinkWrap: fixed,
            primary: false,
            physics: fixed
                ? const NeverScrollableScrollPhysics()
                : const BouncingScrollPhysics(),
            crossAxisCount: column,
            mainAxisSpacing: spacing,
            crossAxisSpacing: spacing,
            itemCount: itemCount,
            itemBuilder: itemBuilder);
  }
}

import 'package:flutter/material.dart';

class EzHorizontalList extends StatefulWidget {
  ///Testing yow!!!

  final List<Widget> items;
  final double spacing;
  final double? listHeight;
  final double? itemWidth;

  final bool debug;

  const EzHorizontalList({
    Key? key,
    required this.items,
    this.spacing = 10,
    this.listHeight = 100,
    this.itemWidth = 50,
    this.debug = false,
  }) : super(key: key);

  @override
  State<EzHorizontalList> createState() => _EzHorizontalListState();
}

class _EzHorizontalListState extends State<EzHorizontalList> {
  List<Widget> _itemSized = [];
  @override
  void initState() {
    _itemSized = widget.items
        .map((e) => Container(
              padding: EdgeInsets.only(right: widget.spacing),
              height: widget.listHeight,
              width: widget.itemWidth,
              child: e,
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: widget.debug ? Colors.red : null,
        height: widget.listHeight,
        child: ListView(
          controller: ScrollController(),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: _itemSized,
        ));
  }
}

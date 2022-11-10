import 'package:flutter/material.dart';

class EzScaffoldBody extends StatelessWidget {
  final Function(BuildContext, BoxConstraints) builder;
  final bool debug;
  const EzScaffoldBody({
    Key? key,
    this.debug = false,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: constraints.maxWidth,
            minHeight: constraints.maxHeight,
          ),
          child: Container(
            color: debug ? Colors.red.withOpacity(0.6) : null,
            child: builder(context, constraints),
          ));
    });
  }
}

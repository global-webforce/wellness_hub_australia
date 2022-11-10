import 'package:wellness_hub_australia/app/shared/constants/dimensions.dart';
import 'package:flutter/material.dart';

class ScaffoldBodyWrapper extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final bool isBusy;
  final Widget busyIndicatorWidget;
  final bool isEmpty;
  final Widget emptyIndicatorWidget;
  final Widget Function(BuildContext, BoxConstraints) builder;
  final bool centered;
  final bool isFullWidth;
  final bool neverScroll;
  const ScaffoldBodyWrapper({
    Key? key,
    required this.onRefresh,
    this.isBusy = false,
    this.busyIndicatorWidget = const Center(
      child: CircularProgressIndicator(),
    ),
    this.isEmpty = false,
    this.emptyIndicatorWidget = const Text("Empty Result"),
    required this.builder,
    this.centered = false,
    this.isFullWidth = false,
    this.neverScroll = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return RefreshIndicator(
        strokeWidth: 3,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () => onRefresh(),
        child: isBusy
            ? busyIndicatorWidget
            : isEmpty
                ? CustomScrollView(
                    primary: false,
                    physics: neverScroll
                        ? const NeverScrollableScrollPhysics()
                        : const AlwaysScrollableScrollPhysics(),
                    slivers: [
                      SliverFillRemaining(
                        child: Center(child: emptyIndicatorWidget),
                      )
                    ],
                  )
                : centered
                    ? Center(
                        child: SingleChildScrollView(
                            primary: false,
                            physics: neverScroll
                                ? const NeverScrollableScrollPhysics()
                                : const AlwaysScrollableScrollPhysics(),
                            padding: Dimens.sliverPadding(constraints),
                            child: Center(
                              child: builder(context, constraints),
                            )),
                      )
                    : SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: SingleChildScrollView(
                            primary: false,
                            physics: neverScroll
                                ? const NeverScrollableScrollPhysics()
                                : const AlwaysScrollableScrollPhysics(),
                            padding: isFullWidth
                                ? const EdgeInsets.all(15)
                                : Dimens.sliverPadding(constraints),
                            child: builder(context, constraints)),
                      ),
      );
    });
  }
}

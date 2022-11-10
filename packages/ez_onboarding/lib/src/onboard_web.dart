import 'dart:async';

import 'package:ez_onboarding/src/onboard_item.dart';
import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:page_view_indicators/page_view_indicators.dart';

class OnboardWeb extends StatefulWidget {
  final Function onDone;
  final List<OnboardItem> pages;
  const OnboardWeb({Key? key, required this.pages, required this.onDone})
      : super(key: key);

  @override
  State<OnboardWeb> createState() => _OnboardWebState();
}

class _OnboardWebState extends State<OnboardWeb> {
  Timer? _timer;
  final LoopPageController _pageControllerWeb = LoopPageController(
    initialPage: 0,
  );

  final PageController _pageControllerApp = PageController(
    initialPage: 0,
  );

  static const _kAutoPlayInterval = Duration(seconds: 8);
  static const _kTransitionDuration = Duration(milliseconds: 350);
  static const _kCurve = Curves.ease;

  bool isLastPage = false;

  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();

    if (widget.pages.length - 1 == 0) {
      setState(() {
        isLastPage = true;
      });
    } else {
      setState(() {
        isLastPage = false;
      });
    }

    _timer = Timer.periodic(_kAutoPlayInterval, (Timer timer) {
      _pageControllerWeb.nextPage(
        duration: _kTransitionDuration,
        curve: _kCurve,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  _buildCircleIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CirclePageIndicator(
        selectedDotColor: Colors.white,
        dotColor: Colors.white.withOpacity(0.4),
        itemCount: widget.pages.length,
        currentPageNotifier: _currentPageNotifier,
      ),
    );
  }

  _prevButton() {
    return isLastPage
        ? TextButton(
            onPressed: () {
              _pageControllerWeb.previousPage(
                duration: _kTransitionDuration,
                curve: _kCurve,
              );
            },
            child: const Text(
              'BACK',
              style: TextStyle(color: Colors.white),
            ),
          )
        : TextButton(
            child: const Text(
              'SKIP',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              _pageControllerWeb.jumpToPage(widget.pages.length - 1);
            },
          );
  }

  _nextButton() {
    return TextButton(
      child: Text(
        isLastPage ? "DONE" : "NEXT",
        style: const TextStyle(color: Colors.white),
      ),
      onPressed: () {
        isLastPage
            ? widget.onDone()
            : _pageControllerWeb.nextPage(
                duration: _kTransitionDuration, curve: _kCurve);
      },
    );
  }

  _loopPageView() {
    return LoopPageView.builder(
      controller: _pageControllerWeb,
      itemCount: widget.pages.length,
      itemBuilder: (BuildContext context, int index) {
        return widget.pages[index % widget.pages.length];
      },
      onPageChanged: (index) {
        _currentPageNotifier.value = index;
        if (index == widget.pages.length - 1) {
          setState(() {
            isLastPage = true;
          });
        } else {
          setState(() {
            isLastPage = false;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) {
        setState(() {
          _timer?.cancel();
        });
      },
      onExit: (e) {
        setState(() {
          _timer = Timer.periodic(_kAutoPlayInterval, (Timer timer) {
            _pageControllerWeb.nextPage(
              duration: _kTransitionDuration,
              curve: _kCurve,
            );
          });
        });
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _loopPageView(),
            Container(
              padding: const EdgeInsets.all(15),
              color: Colors.black.withOpacity(0.4),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildCircleIndicator(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

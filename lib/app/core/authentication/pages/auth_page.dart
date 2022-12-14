import 'package:auto_route/auto_route.dart';
import 'package:wellness_hub_australia/app/app_view_model.dart';

import 'package:wellness_hub_australia/app/core/authentication/pages/onboarding_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  final PageController _pageViewController =
      PageController(initialPage: 1, keepPage: false);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppViewModel>.reactive(
        viewModelBuilder: () => AppViewModel(),
        onModelReady: (_) {},
        builder: (context, viewModel, child) {
          return Scaffold(
              body: AutoRouter(
                  key: const GlobalObjectKey('welcome-router'),
                  builder: (context, content) {
                    final kContent = KeyedSubtree(
                      key: const GlobalObjectKey('welcome-content-main'),
                      child: content,
                    );

                    return !kIsWeb
                        ? kContent
                        : ScreenTypeLayout.builder(
                            mobile: (BuildContext context) {
                              return PageView(
                                pageSnapping: true,
                                allowImplicitScrolling: true,
                                scrollDirection: Axis.horizontal,
                                controller: _pageViewController,
                                children: <Widget>[
                                  const Center(child: OnboardingPage()),
                                  kContent,
                                ],
                              );
                            },
                            desktop: (BuildContext context) {
                              return Row(
                                children: [
                                  const Expanded(child: OnboardingPage()),
                                  const VerticalDivider(
                                    width: 1,
                                  ),
                                  Expanded(child: kContent),
                                ],
                              );
                            },
                          );
                  }));
        });
  }
}

import 'package:ez_core/ez_core.dart';
import 'package:ez_onboarding/ez_onboarding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:stacked/stacked.dart';
import 'package:wellness_hub_australia/app/app_view_model.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<AppViewModel>(context);
    return OnboardApp(
      onDone: () => viewModel.onboard(),
      carouselMode: kIsWeb,
      pages: const [
        OnboardItem(
          title:
              "It’s these networks that enable us to feel connected and engaged.They enrich us and fulfill our lives.",
          subtitle:
              "The ability to communicate and develop meaningful relationships with family, friends, colleagues, and co-workers throughout our lives is vital to our wellbeing.",
          imagePath: "assets/images/onboard/img1.png",
          pageColor: Colors.white,
        ),
        OnboardItem(
          title: "Provides affordable program and activities",
          subtitle:
              "Physical and Mental health work together. Physical wellbeing is the ability to maintain a healthy quality of life that allows us to get the most out of our daily activities without physical stress.",
          imagePath: "assets/images/onboard/img2.png",
          pageColor: Colors.white,
        ),
        OnboardItem(
          title: "Increases social and community health.",
          subtitle:
              "Mental well-being is strongly supported by emotional skills like positivity, calmness, and mindfulness. Often, we need to build a variety of these skills to cope with the wide variety of situations we encounter in our daily lives.",
          imagePath: "assets/images/onboard/img3.png",
          pageColor: Colors.white,
        ),
        OnboardItem(
          title:
              "A happy and fulfilled life is far easier to achieve with the absence of financial stress.",
          subtitle:
              "Having financial goals, setting spending budgets and keeping tabs on what we spend our money on empowers us. We know how much we earn and how we should best spend it. ",
          imagePath: "assets/images/onboard/img4.png",
          pageColor: Colors.white,
        ),
      ],
    );
  }
}

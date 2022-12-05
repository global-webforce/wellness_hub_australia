// ignore_for_file: implementation_imports
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:wellness_hub_australia/app/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.dstATop),
            image: const AssetImage("assets/images/welcome_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: constraints.maxWidth,
                    minHeight: constraints.maxHeight - 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Welcome to",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        Image.asset(
                          "assets/images/logo_full.png",
                          width: 230,
                          color: Colors.white,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        EzButton.elevated(
                          rounded: true,
                          title: "LET'S GET STARTED",
                          onTap: () {
                            context.pushRoute(const LoginRoute());
                          },
                        ),
                        vSpaceMedium,
                        const Text(
                          "By clicking on \"Let's get Started\", you confirm that you have read and agree to our Terms & Conditions and Privacy Notice to use the services.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ));
        }),
      ),
    );
  }
}

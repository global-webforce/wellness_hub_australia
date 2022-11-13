import 'package:flutter/material.dart';

class OnboardItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final Color pageColor;
  const OnboardItem(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.imagePath,
      required this.pageColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: pageColor,
      ),
      child: Center(
        child: SizedBox(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width * 0.1) / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      imagePath,
                      width: 230,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
                const SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:wellness_hub_australia/features/authentication/address_extension.dart';
import 'package:wellness_hub_australia/models/service_provider.model.dart';
import 'package:flutter/material.dart';

class ServiceProviderProfileCard extends StatelessWidget {
  final ServiceProvider serviceProvider;
  final Function onTap;
  const ServiceProviderProfileCard(
      {Key? key, required this.serviceProvider, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget avatar(double width) {
      return EzAvatar(
          badge: serviceProvider.verified == 1
              ? Image.asset(
                  "images/verified.png",
                  fit: BoxFit.contain,
                )
              : null,
          radius: max((width * 0.2).roundToDouble() / 2, 20),
          firstName:
              "${serviceProvider.firstName} ${serviceProvider.lastName} ",
          imgUrl: "${serviceProvider.profilePic}");
    }

    Widget name() {
      return Text(
        "${serviceProvider.firstName} ${serviceProvider.lastName[0]}.",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      );
    }

    Widget services() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
        ),
        child: Text(
          serviceProvider.offeredServices.map((e) => e.title).join(", "),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white),
        ),
      );
    }

    Widget shortBio() {
      return Text(
        "${serviceProvider.shortBio}",
        style: const TextStyle(fontSize: 13, height: 1.3),
      );
    }

    Widget rating() {
      return serviceProvider.rating > 0
          ? Wrap(
              alignment: WrapAlignment.end,
              children: [
                EzText.cardTitle2(serviceProvider.rating.toStringAsFixed(1)),
                const Icon(Icons.star, color: Color.fromARGB(255, 255, 196, 0))
              ],
            )
          : const SizedBox.shrink();
    }

    Widget location() {
      return Wrap(
        alignment: WrapAlignment.end,
        children: [
          EzText.cardTitle2("${serviceProvider.address?.displaySafe()}"),
          Icon(Icons.location_pin, color: Colors.red.shade400)
        ],
      );
    }

    Widget title(String text) {
      return Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      );
    }

    Widget totalEarnings() {
      return Text(
        1239.70.moneyFormat(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
        ),
      );
    }

    /*  Widget saveAsFavoriteButton() {
      return IconButton(
          onPressed: () {},
          icon: const Icon(
            EvaIcons.heart,
            color: Colors.purple,
          ));
    } */

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: LayoutBuilder(builder: (context, constraints) {
            return IntrinsicHeight(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            avatar(constraints.maxWidth),
                          ],
                        ),
                        hSpaceRegular,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              name(),
                              const SizedBox(height: 3),
                              services(),
                              vSpaceSmall,
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                rating(),
                                vSpaceTiny,
                                location(),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  vSpaceRegular,
                  Row(
                    children: [
                      vSpaceSmall,
                      Expanded(child: shortBio()),
                    ],
                  ),
                  vSpaceRegular,
                  Row(
                    children: [
                      Expanded(
                        child: Wrap(
                          runSpacing: 10,
                          spacing: 10,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                title("Total Earnings"),
                                totalEarnings()
                              ],
                            ),
                            hSpaceLarge,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                title("Pending  Receivables"),
                                totalEarnings()
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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
    Widget _avatar(double width) {
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

    Widget _name() {
      return Text(
        "${serviceProvider.firstName} ${serviceProvider.lastName[0]}.",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      );
    }

    Widget _services() {
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

    Widget _shortBio() {
      return Text(
        "${serviceProvider.shortBio}",
        style: const TextStyle(fontSize: 13, height: 1.3),
      );
    }

    Widget _rating() {
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

    Widget _location() {
      return Wrap(
        alignment: WrapAlignment.end,
        children: [
          EzText.cardTitle2("${serviceProvider.address?.displaySafe()}"),
          Icon(Icons.location_pin, color: Colors.red.shade400)
        ],
      );
    }

    Widget _title(String text) {
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

    Widget _total_earnings() {
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

    Widget _saveAsFavoriteButton() {
      return IconButton(
          onPressed: () {},
          icon: const Icon(
            EvaIcons.heart,
            color: Colors.purple,
          ));
    }

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
                            _avatar(constraints.maxWidth),
                          ],
                        ),
                        hSpaceRegular,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _name(),
                              const SizedBox(height: 3),
                              _services(),
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
                                _rating(),
                                vSpaceTiny,
                                _location(),
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
                      Expanded(child: _shortBio()),
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
                                _title("Total Earnings"),
                                _total_earnings()
                              ],
                            ),
                            hSpaceLarge,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _title("Pending  Receivables"),
                                _total_earnings()
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

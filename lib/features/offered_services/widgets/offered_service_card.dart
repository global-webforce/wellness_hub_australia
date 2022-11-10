import 'package:ez_core/ez_core.dart';

import 'package:wellness_hub_australia/models/offered_service.model.dart';
import 'package:flutter/material.dart';

class OfferedServiceCard extends StatelessWidget {
  final OfferedService offeredService;
  final Function? onTap;
  final Function? onTapDelete;
  final bool selected;
  const OfferedServiceCard(
      {Key? key,
      required this.offeredService,
      this.onTap,
      this.onTapDelete,
      this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Text(
        "${offeredService.title} ",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    Widget ratePerHour() {
      return Text(
        "${offeredService.ratePerHour!.moneyFormat()} /hour",
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: 18, color: Theme.of(context).colorScheme.primary),
      );
    }

    Widget description() {
      return Text(
        "${offeredService.description}",
        style: const TextStyle(
          fontSize: 14,
        ),
      );
    }

    Widget verifiedBadge() {
      return offeredService.verified == 1
          ? const Icon(
              Icons.check_circle,
              color: Colors.green,
            )
          : const SizedBox.shrink();
    }

    Widget deleteButton() {
      return onTapDelete == null
          ? const SizedBox.shrink()
          : IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () => onTapDelete!(),
              icon: const Icon(
                Icons.delete_rounded,
                color: Colors.red,
              ));
    }

    return SizedBox(
        width: 360,
        child: Card(
          elevation: 2,
          shape: selected
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 2))
              : null,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap == null ? null : () => onTap!(),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: LayoutBuilder(builder: (context, constraints) {
                return IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Wrap(
                                    direction: Axis.horizontal,
                                    spacing: 5,
                                    children: [title(), verifiedBadge()],
                                  ),
                                  Expanded(child: description()),
                                  vSpaceTiny,
                                  ratePerHour(),
                                ],
                              ),
                            ),
                            hSpaceRegular,
                            deleteButton()
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ));
  }
}

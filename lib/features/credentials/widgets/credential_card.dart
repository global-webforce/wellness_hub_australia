import 'package:ez_core/ez_core.dart';
import 'package:wellness_hub_australia/app/models/credential.model.dart';
import 'package:flutter/material.dart';

class CredentialCard extends StatelessWidget {
  final Credential credential;
  final Function? onTap;
  final Function? onTapDelete;

  const CredentialCard({
    Key? key,
    required this.credential,
    this.onTap,
    this.onTapDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Text(
        "${credential.title}",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    Widget description() {
      return Text(
        "${credential.description}",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 14,
        ),
      );
    }

    Widget verifiedBadge() {
      return credential.verified == 1
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
              onPressed: () => onTapDelete!(),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Icon(
                Icons.delete_rounded,
                color: Colors.red,
              ));
    }

    return SizedBox(
        width: 360,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap == null ? null : () => onTap!(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                            Column(
                              children: const [
                                Icon(
                                  Icons.file_present_rounded,
                                ),
                              ],
                            ),
                            hSpaceRegular,
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
                                  vSpaceTiny,
                                  Expanded(child: description()),
                                ],
                              ),
                            ),
                            hSpaceTiny,
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

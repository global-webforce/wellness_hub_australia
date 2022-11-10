import 'package:ez_core/ez_core.dart';
import 'package:wellness_hub_australia/models/field.model.dart';
import 'package:flutter/material.dart';

class FieldCard extends StatelessWidget {
  final Field field;
  final Function onTap;

  const FieldCard({
    Key? key,
    required this.field,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _title() {
      return Text(
        "${field.title}",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
      );
    }

    Widget _description() {
      return Text(
        "${field.description}",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 14,
          height: 1.3,
        ),
      );
    }

    return SizedBox(
        width: 360,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => onTap(),
            child: Padding(
              padding: const EdgeInsets.all(15),
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
                                  Icons.card_membership_rounded,
                                  size: 30,
                                ),
                              ],
                            ),
                            hSpaceRegular,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  _title(),
                                  vSpaceTiny,
                                  Expanded(child: _description()),
                                ],
                              ),
                            ),
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

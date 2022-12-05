import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ez_core/ez_core.dart';
import 'package:wellness_hub_australia/app/models/field.model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ChooseFieldCard extends StatelessWidget {
  final Field field;
  final Function onTap;
  final bool selected;
  final Color? color;
  const ChooseFieldCard(
      {Key? key,
      required this.field,
      required this.onTap,
      this.selected = false,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget icon() {
      return Card(
        color: color ?? Theme.of(context).colorScheme.primary,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            EvaIcons.searchOutline,
            color: Colors.white,
          ),
        ),
      );
    }

    Widget title() {
      return Text(
        "${field.title}",
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            // color: Colors.white,
            fontSize: 16,
            height: 1.3,
            fontWeight: FontWeight.w500),
      );
    }

    return Card(
      elevation: selected ? 10 : 1,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: LayoutBuilder(builder: (context, constraints) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                icon(),
                hSpaceSmall,
                Expanded(child: title()),
                if (selected) Icon(Icons.check, color: HexColor("#8A58B2"))
              ],
            );
          }),
        ),
      ),
    );
  }
}

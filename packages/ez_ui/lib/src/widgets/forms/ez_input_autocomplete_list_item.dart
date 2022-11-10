import 'package:ez_ui/src/widgets/ez_text.dart';
import 'package:flutter/material.dart';

class EzInputAutoCompleteListItem extends StatelessWidget {
  final String state, city;
  final Function onTap;

  const EzInputAutoCompleteListItem(
      {Key? key, required this.state, required this.city, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(
            Icons.near_me,
          ),
          onTap: () => onTap(),
          title: EzText.cardSubTitle(city),
          subtitle: EzText.cardSubTitle(state),
        ),
        const Divider(
          indent: 50,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'package:hsssiot/constants.dart';

class SliderItem extends StatelessWidget {
  IconData icon;
  String title;
  final Function(String)? onItemClick;
  SliderItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onItemClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: kTitleTextStyle.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      leading: Icon(
        icon,
        size: 30,
      ),
      onTap: () {
        onItemClick!(title);
      },
    );
  }
}

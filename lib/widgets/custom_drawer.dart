import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:hsssiot/constants.dart';
import 'package:hsssiot/widgets/widgets.dart';

class CustomDrawer extends StatelessWidget {
  final Function(String)? onItemClick;

  const CustomDrawer({Key? key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
            radius: 65,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('images/avatar.png'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'gerald',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SliderItem(
            title: 'Home',
            icon: Icons.home,
            onItemClick: onItemClick,
          ),
          ExpansionTile(
            title: Text(
              "Trees",
              style: kTitleTextStyle.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            leading: Icon(
              LineAwesomeIcons.tree,
              size: 30,
            ),
            childrenPadding: EdgeInsets.all(20),
            children: [
              SliderItem(
                title: 'All Trees',
                icon: LineAwesomeIcons.spa,
                onItemClick: onItemClick,
              ),
              SliderItem(
                title: 'Species',
                icon: LineAwesomeIcons.spa,
                onItemClick: onItemClick,
              ),
              SliderItem(
                title: 'Add Trees',
                icon: LineAwesomeIcons.spa,
                onItemClick: onItemClick,
              ),
            ],
          ),
          SliderItem(
            title: 'Statistics',
            icon: Icons.graphic_eq,
            onItemClick: onItemClick,
          ),
          SliderItem(
            title: 'Settings',
            icon: Icons.settings,
            onItemClick: onItemClick,
          ),
        ],
      ),
    );
  }
}

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/iconoir.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:hsssiot/screens/screens.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final List _screens = [
    GasSensor(),
    ProximitySensor(),
    GasSensor(),
    Profile(),
  ];
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        items: const [
          Iconify(
            Iconoir.gas,
            size: 30.0,
            color: Colors.white,
          ),
          Iconify(
            Mdi.human_greeting_proximity,
            size: 30.0,
            color: Colors.white,
          ),
          Iconify(
            Ic.round_do_not_touch,
            size: 30.0,
            color: Colors.white,
          ),
          Icon(
            Icons.account_box,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        color: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).canvasColor,
        height: 50,
      ),
      body: _screens[_page],
    );
  }
}

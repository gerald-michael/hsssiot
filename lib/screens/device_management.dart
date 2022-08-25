import 'package:flutter/material.dart';

class DeviceManagement extends StatefulWidget {
  const DeviceManagement({Key? key}) : super(key: key);

  @override
  State<DeviceManagement> createState() => _DeviceManagementState();
}

class _DeviceManagementState extends State<DeviceManagement> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Device Management",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Gas Sensor",
                  style: TextStyle(fontSize: 18),
                ),
                Switch(value: true, onChanged: toggleSwitch),
              ],
            ),
            Row(
              children: [
                Text(
                  "Touch Sensor",
                  style: TextStyle(fontSize: 18),
                ),
                Switch(value: true, onChanged: toggleSwitch),
              ],
            ),
            Row(
              children: [
                Text(
                  "Vibration Sensor",
                  style: TextStyle(fontSize: 18),
                ),
                Switch(value: true, onChanged: toggleSwitch),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }
}

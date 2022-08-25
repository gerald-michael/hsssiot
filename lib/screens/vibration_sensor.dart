import 'package:flutter/material.dart';

class VibrationSensor extends StatelessWidget {
  const VibrationSensor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vibration Sensor",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.3),
                blurRadius: 100.0,
              )
            ]),
            child: Card(
              margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/image2.jpg"),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("1/10/2022 10:30 am"),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hsssiot/constants.dart';

class GasSensor extends StatelessWidget {
  const GasSensor({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double value = 55;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gas Sensor",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            Text(
              "Current Reading",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: 150,
              height: 150,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: value / 100,
                    backgroundColor: kLightPrimaryColor,
                    color: kLightSecondaryColor,
                    strokeWidth: 10,
                  ),
                  Center(
                    child: Text("$value"),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                border: TableBorder.all(),
                columnWidths: {
                  0: FractionColumnWidth(0.21),
                  1: FractionColumnWidth(0.24),
                  2: FractionColumnWidth(0.55),
                },
                children: [
                  buildRow(["Value", "Status", "Time Recorded"],
                      isHeader: true),
                  buildRow(["30.0", "High", "1/02/2022 10:30pm"]),
                  buildRow(["33.0", "High", "1/02/2022 10:25pm"]),
                  buildRow(["32.0", "High", "1/02/2022 10:20pm"]),
                  buildRow(["34.0", "High", "1/02/2022 10:15pm"]),
                  buildRow(["31.0", "High", "1/02/2022 10:10pm"]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TableRow buildRow(List<String> cells, {bool isHeader = false}) => TableRow(
          children: cells.map((cell) {
        final style = TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: 18,
        );
        return Padding(
          padding: EdgeInsets.all(12.0),
          child: Center(
              child: Text(
            cell,
            style: style,
          )),
        );
      }).toList());
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsssiot/constants.dart';
import 'package:hsssiot/store/models/models.dart';
import 'package:hsssiot/store/service/gas_sensor_service.dart';
import 'package:intl/intl.dart';

class GasSensor extends ConsumerStatefulWidget {
  const GasSensor({Key? key}) : super(key: key);

  @override
  _GasSensorState createState() => _GasSensorState();
}

class _GasSensorState extends ConsumerState<GasSensor> {
  double reading = 1.0;
  @override
  Widget build(BuildContext context) {
    AsyncValue<List<GasSensorReading>> readings = ref.watch(gasReadingFuture);
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
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              // Text(
              //   "Current Reading",
              //   style: TextStyle(fontSize: 24),
              // ),
              // SizedBox(
              //   height: 10.0,
              // ),
              // SizedBox(
              //   width: 150,
              //   height: 150,
              //   child: Stack(
              //     fit: StackFit.expand,
              //     children: [
              //       CircularProgressIndicator(
              //         value: reading / 100,
              //         backgroundColor: kLightPrimaryColor,
              //         color: kLightSecondaryColor,
              //         strokeWidth: 10,
              //       ),
              //       Center(
              //         child: Text("$reading"),
              //       )
              //     ],
              //   ),
              // ),
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
                  children: readings.when(
                    data: (data) {
                      List<TableRow> tableRows = [
                        buildRow(["Value", "Status", "Time Recorded"],
                            isHeader: true)
                      ];
                      for (int i = 0; i < data.length; i++) {
                        if (i == 0) {
                          setState(() {
                            reading = data[i].value!;
                          });
                          print(reading);
                        }
                        tableRows.add(buildRow([
                          data[i].value.toString(),
                          data[i].status.toString().toUpperCase(),
                          "${DateFormat('yyyy-MM-dd kk:mm').format(DateTime.parse(data[i].dateCreated.toString()))}"
                        ]));
                      }
                      return tableRows;
                    },
                    error: (error, stackTrace) => [],
                    loading: () => [],
                  ),
                ),
              )
            ],
          ),
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

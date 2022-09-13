import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsssiot/store/models/vibration_reading.dart';
import 'package:hsssiot/store/service/vibration_sensor_service.dart';
import 'package:intl/intl.dart';

class VibrationSensor extends ConsumerWidget {
  const VibrationSensor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<VibrationSensorReading>> readings =
        ref.watch(vibrationReadingFuture);
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
        body: readings.when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
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
                                  image: NetworkImage(
                                      data[index].image.toString()),
                                  fit: BoxFit.fitHeight),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                                "${DateFormat('yyyy-MM-dd kk:mm').format(DateTime.parse(data[index].dateCreated.toString()))}"),
                          )
                        ]),
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) => Center(),
          loading: (() => Center(
                child: CircularProgressIndicator(),
              )),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsssiot/store/models/proximity_reading.dart';
import 'package:hsssiot/store/service/proximity_sensor_service.dart';
import 'package:intl/intl.dart';

class ProximitySensor extends ConsumerWidget {
  const ProximitySensor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<ProximitySensorReading>> readings =
        ref.watch(proximityReadingFuture);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Proximity Sensor",
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
                  child: Column(children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(data[index].image.toString()),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${data[index].distance.toString()}cm",
                                style: TextStyle(color: Colors.red),
                              ),
                              Text(
                                  "${DateFormat('yyyy-MM-dd kk:mm').format(DateTime.parse(data[index].dateCreated.toString()))}"),
                            ],
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              );
            },
          );
        },
        error: ((error, stackTrace) => Center()),
        loading: (() => Center(
              child: CircularProgressIndicator(),
            )),
      ),
    );
  }
}

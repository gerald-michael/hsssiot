import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hsssiot/constants.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:ndialog/ndialog.dart';

class DeviceManagement extends StatefulWidget {
  const DeviceManagement({Key? key}) : super(key: key);

  @override
  State<DeviceManagement> createState() => _DeviceManagementState();
}

class _DeviceManagementState extends State<DeviceManagement> {
  String statusText = "Status Text";
  bool isConnected = false;
  bool vibrationSwitch = false;
  bool proximitySwitch = false;
  bool gasSwitch = false;
  final topic = 'Configure';

  final MqttServerClient client =
      MqttServerClient("am4beba6a68t5-ats.iot.us-east-1.amazonaws.com", "");
  @override
  void dispose() {
    super.dispose();
  }

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            isConnected
                ? Column(
                    children: [
                      GestureDetector(
                        onTap: () => _disconnect(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: kLightSecondaryColor.withOpacity(0.2),
                                  spreadRadius: 20)
                            ],
                          ),
                          child: CircleAvatar(
                            backgroundColor: kLightSecondaryColor,
                            radius: 60,
                            child: CircleAvatar(
                              child: Iconify(
                                Carbon.power,
                                size: 50,
                                color: Colors.white,
                              ),
                              backgroundColor: kLightPrimaryColor,
                              radius: 58,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Connected",
                        style: TextStyle(fontSize: 24),
                      )
                    ],
                  )
                : Column(
                    children: [
                      GestureDetector(
                        onTap: () => _connect(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 20)
                            ],
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 60,
                            child: CircleAvatar(
                              child: Iconify(Carbon.power, size: 50),
                              backgroundColor: Colors.white,
                              radius: 58,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Disconnected",
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
            bodyStream(),
          ],
        ),
      ),
    );
  }

  _connect() async {
    ProgressDialog progressDialog = ProgressDialog(context,
        blur: 0,
        dialogTransitionType: DialogTransitionType.Shrink,
        dismissable: false);
    progressDialog.setLoadingWidget(CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.red),
    ));
    progressDialog
        .setMessage(Text("Please Wait, Connecting to AWS IoT MQTT Broker"));
    progressDialog.setTitle(Text("Connecting"));
    progressDialog.show();

    isConnected = await mqttConnect("device");
    progressDialog.dismiss();
  }

  _disconnect() {
    client.disconnect();
  }

  Future<bool> mqttConnect(String uniqueId) async {
    setStatus("Connecting MQTT Broker");
    ByteData rootCA = await rootBundle.load('certs/RootCA.pem');
    ByteData deviceCert = await rootBundle.load('certs/DeviceCertificate.crt');
    ByteData privateKey = await rootBundle.load('certs/Private.key');
    SecurityContext context = SecurityContext.defaultContext;
    context.setClientAuthoritiesBytes(rootCA.buffer.asUint8List());
    context.useCertificateChainBytes(deviceCert.buffer.asUint8List());
    context.usePrivateKeyBytes(privateKey.buffer.asUint8List());
    client.securityContext = context;

    client.logging(on: true);
    client.keepAlivePeriod = 20;
    client.port = 8883;
    client.secure = true;
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.pongCallback = pong;

    final MqttConnectMessage connMess =
        MqttConnectMessage().withClientIdentifier(uniqueId).startClean();
    client.connectionMessage = connMess;

    await client.connect();
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      // print("Connected to AWS Successfully!");
    } else {
      return false;
    }

    client.subscribe(topic, MqttQos.atLeastOnce);
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final recMess = c[0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      print(
          'EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
      print('');
    });
    return true;
  }

  void setStatus(String content) {
    setState(() {
      statusText = content;
    });
  }

  void onConnected() {
    setStatus("Client connection was successful");
  }

  void onDisconnected() {
    setStatus("Client Disconnected");
    isConnected = false;
  }

  void pong() {
    print('Ping response client callback invoked');
  }

  Widget bodyStream() {
    return isConnected
        ? Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
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
                    Switch(value: gasSwitch, onChanged: gasSwitchControler),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Proximity Sensor",
                      style: TextStyle(fontSize: 18),
                    ),
                    Switch(
                        value: proximitySwitch,
                        onChanged: proximitySwitchControler),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Vibration Sensor",
                      style: TextStyle(fontSize: 18),
                    ),
                    Switch(
                        value: vibrationSwitch,
                        onChanged: vibrationSwitchControler),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        : Container();
  }

  void vibrationSwitchControler(bool value) {
    setState(() {
      vibrationSwitch = value;
    });
    publish('vibration', value ? "ON" : "OFF");
  }

  void proximitySwitchControler(bool value) {
    setState(() {
      proximitySwitch = value;
    });
    publish('proximity', value ? "ON" : "OFF");
  }

  void gasSwitchControler(bool value) {
    setState(() {
      gasSwitch = value;
    });
    publish('gas', value ? "ON" : "OFF");
  }

  void publish(device, status) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(json.encode({"command": status, "device": device}));
    client.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
  }
}

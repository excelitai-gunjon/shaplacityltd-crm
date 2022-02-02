import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shaplacityltd/core/services/internet_connection_state.dart';


class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  TestWidgetState createState() => TestWidgetState();
}

class TestWidgetState extends State<TestWidget> {

  StreamSubscription? _connectionChangeStream;
  bool isOffline = false;

  @override
  initState() {
    super.initState();

    ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
    _connectionChangeStream = connectionStatus.connectionChange.listen(connectionChanged);
  }

  void connectionChanged(dynamic hasConnection) {

    setState((){
      isOffline = !hasConnection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isOffline?const Text("Not connected") : const Text("Connected");
  }
}
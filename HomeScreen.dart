import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> item = [];
  final EventChannel _stream = EventChannel('locationStatusStream');
  void _handleLocationChanges() {
    item.clear();
    _stream.receiveBroadcastStream().listen((message) {
      print(message);
      setState(() {
        item.add("title : " + message.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Call Event Channel"),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 200,
                color: Colors.pinkAccent,
                child: MaterialButton(
                  child: Text(
                    'Click',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  onPressed: _handleLocationChanges,
                ),
              ),
              Text(item.toString())
            ],
          ),
        ));
  }
}

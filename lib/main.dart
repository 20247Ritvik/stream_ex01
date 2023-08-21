import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  StreamController<int> counterController = StreamController<int>();

  late Stream mystream;

  @override
  void initState() {
    super.initState();
    mystream = counterController.stream.asBroadcastStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder(
                stream: mystream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.toString(),
                        style: TextStyle(
                            fontSize: 82, fontWeight: FontWeight.w700));
                  } else {
                    return Text("0",
                        style: TextStyle(
                            fontSize: 82, fontWeight: FontWeight.w700));
                  }
                },
              ),
              StreamBuilder(
                stream: mystream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.toString(),
                        style: TextStyle(
                            fontSize: 82, fontWeight: FontWeight.w700));
                  } else {
                    return Text("0",
                        style: TextStyle(
                            fontSize: 82, fontWeight: FontWeight.w700));
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter++;
          counterController.sink.add(_counter);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

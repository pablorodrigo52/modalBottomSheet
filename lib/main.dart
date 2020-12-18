import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  RandomColor _randomColor = RandomColor();
  Color bottomSheetColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Press the button to open the modal',
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () 
        {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: bottomSheetColor,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Change modal background color on button'),
                      RaisedButton(
                        child: const Text('Change'),
                        onPressed: ()
                        {
                          setState(() {
                            bottomSheetColor = _randomColor.randomColor();
                          });
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.menu),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

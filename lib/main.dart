import 'package:camera_controller/screens/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //primarySwatch: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //Está pegando o título e Chave do StatefulWidget
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  //faz um override do _MyHomePageState
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState():super();

  int _xPos = 0, _yPos = 0;
  double width, heigth;

  _getScreenSize(){
    width = MediaQuery.of(context).size.width;
    heigth = MediaQuery.of(context).size.height;
    var arr = [width, heigth];
    return(arr);
  }

  _moveObject(int x, int y) {
    setState(() {
      _xPos += x;
      _yPos += y;
    });
  }

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
            Row(
              children: <Widget>[
                FlatButton(
                  onPressed:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CameraScreen()),
                    );
                  },
                  child: SizedBox.fromSize(
                    child: Icon(Icons.local_see),
                    size: Size.square(60),
                  ),
                ),
              ]
            ),
            Text(
              '$_xPos',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '$_yPos',
              style: Theme.of(context).textTheme.headline4,
            ),

            // Bottom part of Screen
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  children: <Widget>[
                    //Confirm and Reject Button
                    SizedBox.fromSize(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            onPressed:() {
                              _moveObject(0, 10);
                            },
                            child: SizedBox.fromSize(
                              child: Icon(Icons.check_circle),
                              size: Size.square(80),
                            ),
                          ), // Confirma
                          FlatButton(
                            onPressed:() {
                              _moveObject(0,-10);
                            },
                            child: SizedBox.fromSize(
                              child: Icon(Icons.remove_circle),
                              size: Size.square(80),
                            ),
                          ), // Remove
                        ],
                      ),
                      size: Size.square(160),
                    ),
                    //Diretional Buttons
                    SizedBox.fromSize(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            onPressed:() {
                              _moveObject(0, 10);
                            },
                            child: SizedBox.fromSize(
                              child: Icon(Icons.arrow_upward),
                              size: Size.square(60),
                            ),
                          ),
                          Row (
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              FlatButton(
                                onPressed:() {
                                  _moveObject(-10,0);
                                },
                                child: SizedBox.fromSize(
                                  child: Icon(Icons.arrow_back),
                                  size: Size.square(60),
                                ),
                              ),
                              FlatButton(
                                onPressed:() {
                                  _moveObject(10,0);
                                },
                                child: SizedBox.fromSize(
                                  child: Icon(Icons.arrow_forward),
                                  size: Size.square(60),
                                ),
                              ),
                            ],
                          ),
                          FlatButton(
                            onPressed:() {
                              _moveObject(0,-10);
                            },
                            child: SizedBox.fromSize(
                              child: Icon(Icons.arrow_downward),
                              size: Size.square(60),
                            ),
                          ),
                        ],
                      ),
                      size: Size.square(240),
                    ),
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
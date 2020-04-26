import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
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
  String screenValue = "0";
  String operator = "";
  double firstValue;

  Widget numberButton(int number){
    return RaisedButton(
      child: Text(number.toString()),
      onPressed: (){setState(() {
          String temp = screenValue;
          if(screenValue=="0"){
            temp="";
          }
          temp = temp + number.toString();
          screenValue = temp;
      });},
    );
  }

  Widget operationButton(String operation){
    return RaisedButton(
      child: Text(operation),
      onPressed: (){
        setState(() {
          firstValue = double.parse(screenValue);
          screenValue = "0";
          operator=operation;
        });
      },
    );
  }

  Widget dotButton(){
    return RaisedButton(
      child: Text("."),
      onPressed: (){
        if(!screenValue.contains(".")){
          setState(() {
            screenValue = screenValue+".";
          });
        }
      },
    );
  }

  Widget clearButton(){
    return RaisedButton(
      child: Text("Clear"),
      onPressed: (){
        setState(() {
          screenValue="0";
        });
      },
    );
  }

  Widget equalButton(){
    return RaisedButton(
      child: Text("="),
      onPressed: (){
        setState(() {
          double secondValue = double.parse(screenValue);
          double result;
          switch(operator){
            case "+":
              result = firstValue+secondValue; break;
            case "-":
              result = firstValue-secondValue; break;
            case "*":
              result = firstValue+secondValue; break;
            case "/":
              result = firstValue/secondValue; break;
          }
          screenValue = result.toString();
          firstValue = result;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[Text(screenValue.toString())],
            ),
            Row(
                children: <Widget>[
                  numberButton(7),
                  numberButton(8),
                  numberButton(9),
                  operationButton("+"),
            ]),
            Row(
                children: <Widget>[
                  numberButton(4),
                  numberButton(5),
                  numberButton(6),
                  operationButton("-"),
                ]),
            Row(
                children: <Widget>[
                  numberButton(1),
                  numberButton(2),
                  numberButton(3),
                  equalButton(),
                ]),
            Row(
                children: <Widget>[
                  numberButton(0),
                  operationButton("/"),
                  operationButton("*"),
                  operationButton("+"),
                ]),
            Row(
              children: <Widget>[
                dotButton(),
                clearButton(),
              ]
            ),
          ],

        ),
      ),
    );
  }
}

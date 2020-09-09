import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de temperaturas',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Conversor(title: 'Convertidor de Farenheit a Celcius'),
    );
  }
}

class Conversor extends StatefulWidget {
  Conversor({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  var _output='0.0';

  final inputController=TextEditingController();

  void _calculateTemp(){
      setState(() {
        double temperaturaOriginal= double.parse(inputController.text);
        double temperaturaSalida=(temperaturaOriginal-32)*5/9;
        _output="$temperaturaSalida";
      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //Una barra donde ponemos el titulo
        title: Text(widget.title), //Donde escribimos el titulo
      ),
      body: Center(
        child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,//Body donde ponemos multiples de cosas
              children: [
              TextFormField(
               controller: inputController,
            ),
            RaisedButton(
              onPressed: () {
                _calculateTemp();
              },
              child: Text('Convertir'),
            ),
            Text('$_output'),
          ],
         ),
        ),
      ),
    );
  }
}
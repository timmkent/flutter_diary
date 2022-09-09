import 'package:flutter/material.dart';
import 'package:flutter_diary/tk_database.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TKDatabase.configureDatabases();
  TKDatabase.bodystats().ref("diary").child("Test").set(4711);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diary',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const DataSheet(),
    );
  }
}

class DataSheet extends StatefulWidget {
  const DataSheet({Key? key}) : super(key: key);

  @override
  State<DataSheet> createState() => _DataSheetState();
}

class _DataSheetState extends State<DataSheet> {
  bool inputBlocker = false;
  final emailController = TextEditingController();

  void setTemporaryInputBlocker() {
    setState(() {
      inputBlocker = true;
    });
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        inputBlocker = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 1000,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Essen:",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 30),
              ),
              essenButton("1 Bier (33cl)"),
              essenButton("HB / Reis"),

              const SizedBox(
                height: 50,
              ),
              const Text(
                "Ausgaben:",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 30),
              ),

// TODO: Make field blocked for 3 seconds
// TODO: Finde raus, wann die Notifcation Question kommt. Wer diese ausloest.
// TODO: Height im Profil korrekt anzeigen
// TODO: imperial/not imperial in den Settings setzen koennen.
// TODO: Make sound
// TODO: Vibrate
// TODO: Show entries
// TODO: Set reminder in 30min
// TODO: erfasse weviele stunden du gerschlafen hast mit erinnering 00:30-07:00
// TODO: Erfasse Gewicht
// TODO: Erfasse jede Zigerette (1)
// TODO: Erstelle Notification Screen
// TODO: Review NB Log
// TODO: Schalte NB Werbung bei Google Ads

              TextField(
                controller: emailController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Betrag',
                ),
              ),

              RaisedGradientButton(
                child: Text("PARTY"),
                onPressed: () {
                  // Circular block screen for 2 seconds...
                  TKDatabase.bodystats().ref("diary").child(Date().toYYMMDD()).child("ausgaben").push().update({'betrag': double.parse(emailController.text), 'category': 'PARTY'});
                },
              ),

              RaisedGradientButton(
                child: Text("FRISOER"),
                onPressed: () {
                  // Circular block screen for 2 seconds...
                  TKDatabase.bodystats().ref("diary").child(Date().toYYMMDD()).child("ausgaben").push().update({'betrag': double.parse(emailController.text), 'category': 'FRISOER'});
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget essenButton(String name) {
    return RaisedGradientButton(
      gradient: inputBlocker ? gradientInactive : gradientActive,
      child: Text(name),
      onPressed: () {
        if (inputBlocker) {
          return;
        }
        // Circular block screen for 2 seconds...
        TKDatabase.bodystats().ref("diary").child(Date().toYYMMDD()).child("essen").push().update({'name': name});
      },
    );
  }
}

class Date {
  String toYYMMDD() {
    final now = DateTime.now();
    return DateFormat('yyyy-MM-dd').format(now.toUtc()).toString();
  }

  String toYYMMDDhhMMss() {
    final now = DateTime.now();
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(now.toUtc()).toString();
  }
}

const gradientActive = LinearGradient(colors: [Colors.red, Colors.yellow]);
const gradientInactive = LinearGradient(colors: [Colors.grey, Colors.grey]);

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient? gradient;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const RaisedGradientButton({
    Key? key,
    required this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    required this.onPressed,
  }) : super(key: key);

// Definiere ruhig die Color von Surge. Wen interessiert das aschon....
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), gradient: gradient, boxShadow: [
        BoxShadow(
          color: Colors.grey.shade500,
          offset: const Offset(0.0, 1.5),
          blurRadius: 1.5,
        ),
      ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}

// OLD

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

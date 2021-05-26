import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String _title = 'Meu Primeiro App';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyHomePage(title: _title),
      themeMode: ThemeMode.light,
      theme: MyThemeApp.customLightTheme,
      darkTheme: MyThemeApp.customDarkTheme,
    );
  }
}

class MyThemeApp {
  static TextStyle customStyleText(
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight);
  }

  static ThemeData get customLightTheme => ThemeData(
        primaryColor: Colors.purple.shade800,
        scaffoldBackgroundColor: Colors.purpleAccent.shade400,
        textTheme: TextTheme(
            headline1: customStyleText(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            headline2: customStyleText(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.purple.shade800,
        ),
      );
  static ThemeData get customDarkTheme => ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.grey,
        textTheme: TextTheme(
          headline1: customStyleText(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          headline2: customStyleText(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.black,
        ),
      );
}

AppBar appBarWidget({Widget? leading, List<Widget>? actions, String? title}) {
  return AppBar(
    leading: leading,
    actions: actions,
    title: Text(title ?? ""),
  );
}

Widget floatingButtonWidget({VoidCallback? onPressed, Icon? icon}) {
  return FloatingActionButton(
    onPressed: onPressed,
    child: icon,
  );
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({required this.title});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  _increment() {
    _counter++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        title: widget.title,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contador',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
      floatingActionButton: floatingButtonWidget(
        onPressed: () => setState(() {
          _increment();
        }),
        icon: Icon(Icons.add),
      ),
    );
  }
}

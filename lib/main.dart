import 'package:flutter/material.dart';
import 'package:mobile_rightclick_law_native/outstanding.dart';
import 'package:mobile_rightclick_law_native/outstanding_events.dart';
import 'package:mobile_rightclick_law_native/outstanding_tasks.dart';
import 'login_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dashboard.dart';
import 'get_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    Dashboard.tag: (context) => Dashboard(),
    Outstanding.tag: (context) => Outstanding(),
    OutstandingTasks.tag: (context) => OutstandingTasks(),
    OutstandingEvents.tag: (context) => OutstandingEvents(),
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Form(
        child: LoginPage(),
      ),
      routes: routes,
    );
  }
}

class Jowed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yeah'),
      ),
    );
  }
}

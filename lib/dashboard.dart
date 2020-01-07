import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:mobile_rightclick_law_native/login_page.dart';
import 'package:mobile_rightclick_law_native/outstanding.dart';
import 'get_data.dart';

class Dashboard extends StatefulWidget {
  static String tag = 'dashboard';
  final int userValue;

  Dashboard({Key key, @required this.userValue}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TasksReply comingAnswer;

  Future _getData() async {
    comingAnswer = await getTasks();
  }

  @override
  Widget build(BuildContextcontext) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'RightClick Law Menu',
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Text(
                'Dashboard',
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.pop(context, Dashboard.tag);
              },
            ),
            ListTile(
              title: Text(
                'Outstanding',
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.popAndPushNamed(context, Outstanding.tag);
              },
            ),
            ListTile(
              title: Text(
                'Calendar',
                textAlign: TextAlign.center,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: new AppBar(title: Text('Dashboard')),
      body: FutureBuilder(
        future: _getData(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('Press button to start.');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              return Scaffold(
                body: ListView.builder(
                    itemCount: comingAnswer.gottenData.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, position) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 15.0,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              // ignore: missing_return
                              leading: Icon(Icons.album),
                              title: Text(comingAnswer.gottenData[position]
                                      ["task_subject"]
                                  .toString()),
                              subtitle: Text(comingAnswer.gottenData[position]
                                      ["task_description"]
                                  .toString()),
                            ),
                            // ignore: deprecated_member_use
                            ButtonTheme.bar(
                              // make buttons use the appropriate styles for cards
                              child: ButtonBar(
                                alignment: MainAxisAlignment.spaceBetween,
                                // ignore: deprecated_member_use
                                children: <Widget>[
                                  FlatButton(
                                    child: Text(comingAnswer
                                        .gottenData[position]["assigned"]
                                        .toString()),
                                    onPressed: () {
                                      /* ... */
                                    },
                                  ),
                                  FlatButton(
                                    child: Text(comingAnswer
                                        .gottenData[position]["responsible"]
                                        .toString()),
                                    onPressed: () {
                                      /* ... */
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              );
          }
        },
      ),
    );
  }
}

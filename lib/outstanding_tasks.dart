import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_rightclick_law_native/main.dart';
import 'package:path_provider/path_provider.dart';
import 'dashboard.dart';
import 'get_data.dart';
import 'login_page.dart';
import 'icons/right_click_icons_icons.dart';

class OutstandingTasks extends StatefulWidget {
  static String tag = 'outstanding_tasks';

  @override
  _OutstandingTasksState createState() => _OutstandingTasksState();
}

class _OutstandingTasksState extends State<OutstandingTasks> {
  uncompletedTasksReply comingAnswer;

  Future _getData() async {
    comingAnswer = await getUncompletedTasks(userId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tasks'),
        ),
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
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  return Scaffold(
                    body: ListView.builder(
                        itemCount: comingAnswer.count,
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
                                  subtitle: Text(comingAnswer
                                      .gottenData[position]["task_description"]
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
                                        child: Text('Finish Task'),
                                        onPressed: () {
                                          completeTasks(comingAnswer
                                              .gottenData[position]["task_id"]);
                                          setState(() {
                                            _getData();
                                          });
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
            }));
  }
}

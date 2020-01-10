import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_rightclick_law_native/main.dart';
import 'package:mobile_rightclick_law_native/outstanding_events.dart';
import 'package:mobile_rightclick_law_native/navigation.dart';
import 'package:path_provider/path_provider.dart';
import 'dashboard.dart';
import 'get_data.dart';
import 'login_page.dart';
import 'package:mobile_rightclick_law_native/outstanding_tasks.dart';
import 'icons/right_click_icons_icons.dart';
import 'outstanding_calls.dart';

class Outstanding extends StatefulWidget {
  static String tag = 'outstanding';

  @override
  _OutstandingState createState() => _OutstandingState();
}

class _OutstandingState extends State<Outstanding> {
  uncompletedTasksReply comingTasksAnswer;
  uncompletedCallsReply comingCallsAnswer;
  DocumentsReply comingDocumentsAnswer;
  EventsReply comingEventsAnswer;

  Future _getData() async {
    comingTasksAnswer = await getUncompletedTasks(userId.toString());
    comingCallsAnswer = await getUncompletedCalls(userId.toString());
    comingDocumentsAnswer = await getDocumentsReply();
    comingEventsAnswer = await getEventsReply(userId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyNavigation(),
        appBar: new AppBar(
          title: Text('Outstanding'),
        ),
        body: bodyBuilder());
  }

  Widget bodyBuilder() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Transform.scale(
                scale: 1.2,
                child: IconButton(
                  icon: Icon(
                    RightClickIcons.doc_text,
                    size: 45,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, OutstandingTasks.tag);
                  },
                ),
              ),
              Text("Tasks"),
              FutureBuilder(
                  future: _getData(),
                  // ignore: missing_return
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Text('Press button to start.');
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Center(
                            child: SizedBox(
                          child: CircularProgressIndicator(),
                          width: 20,
                          height: 20,
                        ));
                      case ConnectionState.done:
                        if (snapshot.hasError)
                          return Text('Error: ${snapshot.error}');
                        return Text(comingTasksAnswer.count.toString());
                    }
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Transform.scale(
                scale: 1.2,
                child: IconButton(
                  icon: Icon(
                    RightClickIcons.call,
                    size: 45,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, OutstandingCalls.tag);
                  },
                ),
              ),
              Text('Calls'),
              FutureBuilder(
                  future: _getData(),
                  // ignore: missing_return
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Text('Press button to start.');
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Center(
                            child: SizedBox(
                          child: CircularProgressIndicator(),
                          width: 20,
                          height: 20,
                        ));
                      case ConnectionState.done:
                        if (snapshot.hasError)
                          return Text('Error: ${snapshot.error}');
                        return Text(comingCallsAnswer.count.toString());
                    }
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Transform.scale(
                scale: 1.2,
                child: IconButton(
                  icon: Icon(
                    RightClickIcons.attach,
                    size: 45,
                  ),
                  onPressed: () {
                    print('object');
                  },
                ),
              ),
              Text("Documents"),
              FutureBuilder(
                  future: _getData(),
                  // ignore: missing_return
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Text('Press button to start.');
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Center(
                            child: SizedBox(
                          child: CircularProgressIndicator(),
                          width: 20,
                          height: 20,
                        ));
                      case ConnectionState.done:
                        if (snapshot.hasError)
                          return Text('Error: ${snapshot.error}');
                        return Text(comingDocumentsAnswer.count.toString());
                    }
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Transform.scale(
                scale: 1.2,
                child: IconButton(
                  icon: Icon(
                    RightClickIcons.calendar,
                    size: 45,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, OutstandingEvents.tag);
                  },
                ),
              ),
              Text(
                "Events",
              ),
              FutureBuilder(
                  future: _getData(),
                  // ignore: missing_return
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Text('Press button to start.');
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Center(
                          child: SizedBox(
                            child: CircularProgressIndicator(),
                            width: 20,
                            height: 20,
                          ),
                        );
                      case ConnectionState.done:
                        if (snapshot.hasError)
                          return Text('Error: ${snapshot.error}');
                        return Text(comingEventsAnswer.count.toString());
                    }
                  })
            ],
          ),
        ],
      ),
    );
  }
}

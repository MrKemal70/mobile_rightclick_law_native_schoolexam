
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'get_data.dart';

class OutstandingEvents extends StatefulWidget {
  static String tag = 'outstanding_events';

  @override
  _OutstandingEventsState createState() => _OutstandingEventsState();
}

class _OutstandingEventsState extends State<OutstandingEvents> {
  EventsReply comingAnswer;

  Future _getData() async {
    comingAnswer = await getEventsReply(userId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Events'),
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
                                  ["subject"]
                                      .toString()),
                                  subtitle: Text(comingAnswer
                                      .gottenData[position]["location"]
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
                                            .gottenData[position]["begin_date"]
                                            .toString()),
                                        onPressed: () {
                                          /* ... */
                                        },
                                      ),
                                      FlatButton(
                                        child: Text(comingAnswer
                                            .gottenData[position]["who_id"]
                                            .toString()),
                                        onPressed: () {
                                          /* ... */
                                        },
                                      ),
                                      FlatButton(
                                        child: Text(comingAnswer
                                            .gottenData[position]["end_date"]
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
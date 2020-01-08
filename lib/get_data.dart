import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Map<String, dynamic> answer;
bool success;
String replyMessage;
int userId;
List data;
List uncompletedData;
int uncompletedDataSayisi;


Future<Reply> makeLoginRequest(String variableA, String variableB) async {
  // set up POST request arguments
  String url = 'http://kemaloner.nl/api/nebiliyim/public/api/login';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"email": "$variableA", "password": "$variableB" }';
  // make POST request
  Response response = await post(url, headers: headers, body: json);
  // check the status code for the result
  int statusCode = response.statusCode;
  // this API passes back the id of the new item added to the body

  Map<String, dynamic> map = jsonDecode(response.body); // Decode coming in json file


  bool success = map['success'];
  replyMessage = map['message'];
  userId       = int.parse(map['userid']);

  var answer = new Reply(success, replyMessage, userId); // Put messages in the reply class

  return answer;
}

// Return the success and message messages here in this class:
class Reply {
  bool answer;
  String responseMessage;
  int userId;

  Reply(this.answer, this.responseMessage, this.userId);
}

class TasksReply {
  bool answer;
  String responseMessage;
  List gottenData;

  TasksReply(this.answer, this.responseMessage, this.gottenData);
}

Future<TasksReply> getTasks() async {
  // set up POST request arguments
  String url = 'http://kemaloner.nl/api/nebiliyim/public/api/tasks';
  Map<String, String> headers = {"Content-type": "application/json"};
  //  String json = '{"name": "$variableA", "password": "$variableB" }';
  // make POST request
  Response response = await get(url, headers: headers);
  // check the status code for the result

  Map<String, dynamic> map = jsonDecode(response.body); // Decode coming in json file

  bool success = map['success'];
  replyMessage = map['message'];
  data = map['data'];

//  for(var assigned in map['data']) {
//    print(assigned['assigned']);
//  }

  var answer = new TasksReply(success, replyMessage, data); // Put messages in the reply class

  return answer;
}

class uncompletedTasksReply {
  List gottenData;
  int count;

  uncompletedTasksReply(this.gottenData, this.count);
}

Future<uncompletedTasksReply> getUncompletedTasks(String userID) async {
  // set up POST request arguments
  String url = 'http://kemaloner.nl/api/nebiliyim/public/api/uncompletedtasks';
  Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"userID": "$userID"}';
  // make POST request
  Response response = await post(url, headers: headers, body: json);
  // check the status code for the result

  Map<String, dynamic> map = jsonDecode(response.body); // Decode coming in json file

  int uncompletedDataSayisi = map['count'];
  List uncompletedData = map['data'];

  var uncompletedDataLength = new uncompletedTasksReply(uncompletedData, uncompletedDataSayisi); // Put messages in the reply class

  return uncompletedDataLength;
}

class uncompletedCallsReply {
  List gottenData;
  int count;
  bool answer;
  String responseMessage;

  uncompletedCallsReply(this.gottenData, this.count, this.answer, this.responseMessage);
}

Future<uncompletedCallsReply> getUncompletedCalls(String userID) async {
  // set up POST request arguments
  String url = 'http://kemaloner.nl/api/nebiliyim/public/api/uncompletedcalls';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"userID": "$userID"}';
  // make POST request
  Response response = await post(url, headers: headers, body: json);
  // check the status code for the result

  Map<String, dynamic> map = jsonDecode(response.body); // Decode coming in json file


  bool success = map['success'];
  replyMessage = map['message'];
  int uncompletedDataSayisi = map['count'];
  List uncompletedData = map['data'];

  var uncompletedCallsLength = new uncompletedCallsReply(uncompletedData, uncompletedDataSayisi, success, replyMessage); // Put messages in the reply class

  return uncompletedCallsLength;
}

class EventsReply {
  List gottenData;
  int count;
  String responseMessage;

  EventsReply(this.gottenData, this.count, this.responseMessage);
}

Future<EventsReply> getEventsReply(String userID) async {
  // set up POST request arguments
  String url = 'http://kemaloner.nl/api/nebiliyim/public/api/events';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"userID": "$userID"}';
  // make POST request
  Response response = await http.post(url, headers: headers, body: json);
  // check the status code for the result

  Map<String, dynamic> map = jsonDecode(response.body); // Decode coming in json file

  int uncompletedDataSayisi = map['count'];
  List gottenData = map['data'];
  String responseMessage = map['message'];

  var uncompletedCallsLength = new EventsReply(gottenData, uncompletedDataSayisi, responseMessage); // Put messages in the reply class

  return uncompletedCallsLength;
}

class DocumentsReply {
  int count;

  DocumentsReply(this.count);
}

Future<DocumentsReply> getDocumentsReply() async {
  // set up POST request arguments
  String url = 'http://kemaloner.nl/api/nebiliyim/public/api/documents';
  Map<String, String> headers = {"Content-type" : "application/json"};
  // make POST request
  Response response = await get(url, headers: headers);
  // check the status code for the result

//  Map<String, dynamic> map = jsonDecode(response.body); // Decode coming in json file

//  int uncompletedDataSayisi = map['count'];
  int uncompletedDataSayisi = jsonDecode(response.body);

  var uncompletedCallsLength = new DocumentsReply(uncompletedDataSayisi); // Put messages in the reply class

  return uncompletedCallsLength;
}
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'cook.dart';
import 'dart:async';
import 'dart:convert';

Future getCooks() async {

  var data = await http.get("http://kerimcaglar.com/yemek-tarifi");

  var jsonData = json.decode(data.body);

  List<Cook> cooks = [];

  for (var jd in jsonData) {
    Cook cook = Cook(
        jd["id"],
        jd["cookName"],
        jd["cookCategory"],
        jd["duration"],
        jd["person"],
        jd["content"],
        jd["recipe"],
        jd["picture"]
    );
    cooks.add(cook);
  }

  return cooks;

}
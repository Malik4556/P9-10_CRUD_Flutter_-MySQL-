import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:developer';
import 'func_isLoading.dart';

delete(BuildContext context, title, id) {
  Widget buttonCancel = TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: const Text('Cancel'));
  Widget buttonOK = TextButton(
      onPressed: () => deleteImage(context, id), child: const Text('OK'));

  AlertDialog deleteQuestion = AlertDialog(
    title: Text("Hapus"),
    content: Text("Hapus data " + title.toString() + " ?"),
    actions: [buttonOK, buttonCancel],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return deleteQuestion;
      });
}

//fungsi delete data
deleteImage(context, idData) async {
  //loading lalu pushnamed ke fungsi read
  isLoading(context);
  FormData sendData = FormData.fromMap({
    "idnews": idData.toString(),
  });

  final response = await Dio().post(
    "https://tifrp20a.my.id/6/deletenews.php",
    data: sendData);
    log("test send data :" + idData.toString());
  
  return Navigator.of(context)
      .pushNamedAndRemoveUntil('/read', (Route<dynamic> route) => false);
}

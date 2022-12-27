import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:developer';
import 'func_isLoading.dart';

editData(context,id, jdl, description, pathImg) async {
  //loading lalu pushnamed ke fungsi read
  isLoading(context);
  String? imgName;
  var dataImg;
  if (pathImg != null){
    imgName = pathImg.path.split('/').last;
    dataImg = await MultipartFile.fromFile(pathImg.path,
        filename: imgName.toString());
  }else{
    dataImg = null;
  }

  FormData sendData = FormData.fromMap({
    "idnews": id.toString(),
    "judul": jdl.toString(),
    "deskripsi": description.toString(),
    "url_image": dataImg,
  });
  final respose = await Dio().post(
      "http://tifrp20a.my.id/6/editnews.php",
      data: sendData);
    log("test send data :" + jdl.toString());
  return Navigator.of(context)
      .pushNamedAndRemoveUntil('/read', (Route<dynamic> route) => false);
}
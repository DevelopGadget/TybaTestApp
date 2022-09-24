import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:typatestapp/env/build_enviroment.env.dart';
import 'package:typatestapp/models/university.model.dart';
import 'package:http/http.dart' as Http;
import 'package:typatestapp/models/values.model.dart';

class UniversitiesProvider with ChangeNotifier {
  static final UniversitiesProvider _singleton =
      UniversitiesProvider._internal();
  factory UniversitiesProvider() => _singleton;

  UniversitiesProvider._internal();

  bool loading = true;
  List<University> universities = [];
  List<University> data = [];
  final controller = ScrollController();
  int page = 1;

  Future getUniversities() async {
    try {
      final Http.Response response = await Http.get(
          Uri.parse('${env!.baseUrl}${Values.jsonUrl}'),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});
      Iterable list = jsonDecode(response.body);
      loading = false;
      universities = list.map((e) => University.fromJson(e)).toList();
      inializeController();
      setDataPage();
    } catch (e) {
      return [];
    }
  }

  inializeController() {
    page = 1;
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        Future.delayed(const Duration(seconds: 1), setDataPage);
      }
    });
  }

  setDataPage() {
    final int endPage = page * (env?.maxScroll as int);
    data = universities.sublist(0, endPage);
    page++;
    notifyListeners();
  }

  setUniversityImage(XFile? file, int index) async {
    universities[index].image = await file?.readAsBytes();
    notifyListeners();
  }
}

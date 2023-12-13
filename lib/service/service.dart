import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:lecture_1_app/model/cat_model.dart';

const path = 'assets/cats_imgs.json';

class Service {
  Future<CatsModel> getCats() async {
    final source = await rootBundle.loadString(path, cache: false);
    final json = jsonDecode(source);
    await Future.delayed(const Duration(seconds: 1));
    return CatsModel.fromJson(json);
  }
}
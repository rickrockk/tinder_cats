import 'package:lecture_1_app/model/cat_model.dart';

abstract class AbstractAPI {
  Future<List<Cat>> getCats(int limit);
  Future<Cat> getCat();
}

class API implements AbstractAPI {
  @override
  Future<Cat> getCat() {
  }

  @override
  Future<List<Cat>> getCats(int limit) {
  }
}
import 'package:lecture_1_app/model/cat_model.dart';

abstract class CatService {
  Future<CatsModel> getCats();
}


import 'package:cv_project/model/cv_model.dart';

import '../DataBaseProvider/dataBase.dart';

class DataRepository{
  DataRepository();

  Future<int> addCV(CVModel cv) async {
    int id = await DatabaseHelper.instance.insertCV(cv);
    return id;
  }

  Future<List<CVModel>> getAllCV() async {
    List<CVModel> allCV = await DatabaseHelper.instance.getAllCV();
    return allCV;
  }

}
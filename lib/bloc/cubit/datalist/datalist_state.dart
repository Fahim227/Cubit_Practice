
import 'package:cv_project/model/cv_model.dart';

class DataListState{}

class DataListInitialState extends DataListState{}



class DataListLoadedState extends DataListState{
  List<CVModel>? allCV;

  DataListLoadedState(this.allCV);
}


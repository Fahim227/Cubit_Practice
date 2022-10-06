

import 'package:cv_project/bloc/cubit/datalist/datalist_state.dart';
import 'package:cv_project/model/cv_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../DataRepository/datalist_repo.dart';

class DataListCubit extends Cubit<DataListState>{

  final DataRepository _dataRepository;
  DataListCubit(this._dataRepository):super(DataListInitialState());


  void getAllData() async {
    List<CVModel> allCV =  await _dataRepository.getAllCV();
    emit(DataListLoadedState(allCV));
  }


}
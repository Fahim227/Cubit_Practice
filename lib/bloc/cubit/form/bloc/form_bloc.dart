

import 'package:cv_project/DataRepository/datalist_repo.dart';
import 'package:cv_project/bloc/cubit/form/bloc/form_event.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'form_state.dart' as mainState;

class FormBloc extends Bloc<FormEvent,mainState.FormChangedState>{
  final DataRepository repo;
  FormBloc(this.repo):super(mainState.FormInitState()){

    on<FormDropDownChanged>((event,emit){
      print(event.changedValue!);
      emit(mainState.FormDropdownValueAndImageChanged(event.changedValue!,event.imageString!,event.imageName));
    });
  }

}
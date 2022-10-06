library my_lib;

import 'package:cv_project/DataRepository/datalist_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../model/cv_model.dart';


part 'form_state.dart';

class FormCubit extends Cubit<FormDataState>{
  final DataRepository _dataRepository;


  FormCubit(this._dataRepository):super(FormInitialState());

  static TextEditingController DropdownValueController = TextEditingController();
  static TextEditingController applicant_name = TextEditingController();
  static TextEditingController birthDate = TextEditingController();
  static TextEditingController nid = TextEditingController();
  static TextEditingController passport_id = TextEditingController();
  static TextEditingController birth_reg = TextEditingController();
  static TextEditingController nid_file = TextEditingController();
  static TextEditingController passport_id_file = TextEditingController();
  static TextEditingController birth_reg_file = TextEditingController();
  static TextEditingController identity = TextEditingController();
  static TextEditingController identityProof = TextEditingController();
  static TextEditingController identityProofimageName = TextEditingController();
  static FormCubit get(context) => BlocProvider.of(context);


  void changeDropDownvalue(String identityType,String image,String applicant_name,String date_of_birth){
    emit(FormDropdownState(identityType,image,applicant_name,date_of_birth)) ;
  }
  void imageData(String val){
    emit(ImageFileChangedState(val)) ;
  }
  void addCV() async {
    CVModel model = CVModel();
    model.applicant_name = FormCubit.applicant_name.text;
    model.DateofBirth = FormCubit.birthDate.text;
    model.identityType = FormCubit.DropdownValueController.text;
    model.identityNumber = FormCubit.identity.text;
    model.identityImage = FormCubit.identityProof.text;
    int id = await _dataRepository.addCV(model);
    emit(FormSubmitted(id));
  }



  // void getNewImage(ImageSource fileSource) async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? pickedFile = await picker.pickImage(source: fileSource);
  //   emit(pickedFile!.path);
  // }

}

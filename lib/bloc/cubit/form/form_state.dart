

part of 'form_cubit.dart';

class FormDataState{}

class FormInitialState extends FormDataState{
  FormInitialState();
}

class FormSubmittedState extends FormDataState{
  final CVModel cvModel;

  FormSubmittedState(this.cvModel);
}

class FormDropdownState extends FormDataState{
  String? changedValue;
  String? image;
  String? name;
  String? birth_date;

  FormDropdownState(this.changedValue,this.image,this.name,this.birth_date);
}
class ImageFileChangedState extends FormDataState{
  String? imageString;

  ImageFileChangedState(this.imageString);
}
class FormSubmitted extends FormDataState{
  int? submittedID;

  FormSubmitted(this.submittedID);
}
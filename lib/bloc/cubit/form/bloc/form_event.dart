


import 'package:equatable/equatable.dart';

abstract class FormEvent extends Equatable{
  FormEvent();

  @override
  List<Object> get props => [];

}


class FormDropDownChanged extends FormEvent{
  String? changedValue;
  String? imageString;
  String? imageName;

  FormDropDownChanged(this.changedValue,this.imageString,this.imageName);
}

class FormImageChanged extends FormEvent{
  String? image;

  FormImageChanged(this.image);
}


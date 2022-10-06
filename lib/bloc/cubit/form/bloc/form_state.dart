

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class FormChangedState extends Equatable{
  FormChangedState();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class FormInitState extends FormChangedState{
  FormInitState();
}

class FormDropdownValueAndImageChanged extends FormChangedState{
  String? changedValue;
  String? imageString;
  String? imageName;

  FormDropdownValueAndImageChanged(this.changedValue,this.imageString,this.imageName) : super();
}


class FormImageChanged extends FormChangedState{
  String? image;
  String? imageName;

  FormImageChanged(this.image,this.imageName) : super();
}
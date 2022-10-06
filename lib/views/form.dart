
import 'dart:convert';
import 'dart:io';

import 'package:cv_project/DataRepository/datalist_repo.dart';
import 'package:cv_project/bloc/cubit/form/bloc/form_bloc.dart';
import 'package:cv_project/bloc/cubit/form/bloc/form_event.dart';
import 'package:cv_project/bloc/cubit/form/form_cubit.dart';
import 'package:cv_project/model/cv_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';

import '../DataBaseProvider/dataBase.dart';
import '../bloc/cubit/form/bloc/form_state.dart';
import '../common_widget/custom_textfield.dart';
import 'form_datalist.dart';
// import 'lib/bloc/cubit/form/form_state.dart';
class FormView extends StatefulWidget {
  FormView({Key? key}) : super(key: key);

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  TextEditingController? applicant_name;

  TextEditingController? birthDate;

  TextEditingController? identity;

  TextEditingController? identityProof;

  TextEditingController? nid;

  TextEditingController? passport_id;

  TextEditingController? birth_reg;

  TextEditingController? nid_file;

  TextEditingController? passport_id_file;

  TextEditingController? birth_reg_file;

  String? image;
  String? imageName;
  String? dropdownvalue;
  // List of items in our dropdown menu
  var items = [
    'Identity',
    'NID',
    'Passport',
    'Birth Certificate'
  ];

  DatabaseHelper? DBHelper;
  Database? _dataBase;

  void _createDB() async {
    DBHelper = await DatabaseHelper.instance;
    _dataBase = await DBHelper!.database;
    print(await _dataBase!.getVersion());
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createDB();
    dropdownvalue= items[0];
  }

  @override
  Widget build(BuildContext context) {
    image = '';
    imageName = '';


    applicant_name = TextEditingController();
    birthDate = TextEditingController();
    nid = TextEditingController();
    passport_id = TextEditingController();
    birth_reg = TextEditingController();
    nid_file = TextEditingController();
    passport_id_file = TextEditingController();
    birth_reg_file = TextEditingController();
    identity = TextEditingController();
    identityProof = TextEditingController();

    print('Changingg..');

    return Scaffold(
      appBar: AppBar(title: Text('Form Submit'),),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => FormCubit(DataRepository()),
          child: BlocConsumer<FormCubit,FormDataState>(
            listener: (context,state){

            },
            builder:(context,state){
              if (state is FormSubmitted){
                if ((state as FormSubmitted).submittedID! > 0 ){
                  return Center(child: Text("CV Submitted : ${(state as FormSubmitted).submittedID}"));
                  // Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new DataList()),);
                }


                // return Text("CV Submitted : ${(state as FormSubmitted).submittedID}");
              }
              return Center(
                child: Column(
                      children: [
                        TextField(
                          controller: FormCubit.applicant_name ,
                          decoration: InputDecoration(
                          hintText: 'Enter Applicant Name',
                        ),),
                        SizedBox(height: 20.0,),
                        TextField(
                          controller: FormCubit.birthDate ,
                          decoration: InputDecoration(
                          hintText: 'Enter Applicant Birth Date',
                        ),),
                        SizedBox(height: 20.0,),

                        TextField(
                                controller: FormCubit.DropdownValueController,
                                decoration: InputDecoration(
                                  suffixIcon: DropdownButton(
                                    items: items.map((value) => DropdownMenuItem(
                                        value: value,
                                        child:Text(value))).toList(),
                                    onChanged: (value) {
                                      FormCubit.DropdownValueController.text = value.toString();
                                      print(FormCubit.DropdownValueController.text);
                                    },
                                    icon:const Icon(Icons.keyboard_arrow_down_sharp) ,
                                  ),
                                ),
                              ),

                              SizedBox(height: 20.0,),


                        SizedBox(height: 20.0,),
                        TextField(
                          controller: FormCubit.identity ,
                          decoration: InputDecoration(
                            hintText: 'Enter Applicant Identity Number',
                          ),),
                        SizedBox(height: 20.0,),
                        IconButton(onPressed: () async {
                          ImagePicker picker = ImagePicker();
                          XFile? image = await picker.pickImage(source: ImageSource.gallery);
                          String imageName = image!.path.toString().split('/').last;
                          List<int> imageBytes = File(image!.path.toString()).readAsBytesSync();
                          String image64String = base64Encode(imageBytes);
                          print(image64String);
                          FormCubit.identityProof.text = image64String;
                          FormCubit.identityProofimageName.text = imageName;
                          // BlocProvider.of<FormBloc>(context).add(FormDropDownChanged(dropdownvalue,image64String,imageName));
                        }, icon: Icon(Icons.file_copy_outlined),),
                        SizedBox(height: 20.0,),
                        TextField(
                          controller: FormCubit.identityProofimageName,

                        ),


                        SizedBox(height: 20.0,),
                        image != ''? Text(imageName!) : Text(''),
                        SizedBox(height: 20.0,),
                        TextButton.icon(
                          onPressed: () {
                            context.read<FormCubit>().addCV();

                          },
                          icon: Icon(Icons.check_sharp, size: 18),
                          label: Text("Submit"),
                        )


                      ],
                    ),
                  );
            }
          ),
        ),
        )
  );
  }
}

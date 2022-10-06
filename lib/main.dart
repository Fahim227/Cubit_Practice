import 'package:cv_project/DataRepository/datalist_repo.dart';
import 'package:cv_project/bloc/cubit/datalist/datalist_cubit.dart';
import 'package:cv_project/views/form.dart';
import 'package:cv_project/views/form_datalist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<DataListCubit>(
        create: (context) => DataListCubit(DataRepository()),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:  DataList(),
        ),
      ),
    );
  }
}

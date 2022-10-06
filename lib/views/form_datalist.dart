import 'package:cv_project/bloc/cubit/datalist/datalist_cubit.dart';
import 'package:cv_project/bloc/cubit/datalist/datalist_state.dart';
import 'package:cv_project/model/cv_model.dart';
import 'package:cv_project/views/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DataList extends StatelessWidget {
  const DataList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DataList'),actions: [
        IconButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormView()),
          );
        }, icon: Icon(Icons.add))
    ],),
      body: BlocBuilder<DataListCubit,DataListState>( //CountCubit,CounterState
        builder: (context,state){
          if (state is DataListInitialState){
            context.read<DataListCubit>().getAllData();
          }
          // print(state );
          if (state is DataListLoadedState){
            List<CVModel> allCV = (state as DataListLoadedState).allCV!;
            return  RefreshIndicator(
              onRefresh: () async {
                context.read<DataListCubit>().getAllData();
              },
              child: ListView.builder(
                  itemCount: allCV.length,
                  itemBuilder: (context,index){
                    return  Card(
                        child: ListTile(
                            title: Column(
                              children: [
                                Text(
                                  '${allCV[index].applicant_name}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(allCV[index].DateofBirth!),

                              ],
                            )
                        ));
                  },

              ),
            );
          }
          return Center(
            child: Text("No CV Data Found"),
          );

          // final allTodos = (state as RepoStateLoaded).todos;

        },
      ),
    );
  }
}

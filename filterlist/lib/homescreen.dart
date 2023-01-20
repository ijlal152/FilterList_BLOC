import 'dart:convert';

import 'package:filterlist/Models/EmployeeModel.dart';
import 'package:filterlist/bloc/ListBloc/filter_list_bloc.dart';
import 'package:filterlist/widgets/AddScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void _addEmployee(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: AddScreen(),
          ),
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterListBloc, FilterListState>(
      builder: (context, state){
        //List<EmployeeModel> lst = [];
        // var employeeMappedList = state.addEmployee.map((e) {
        //   return {
        //     "name" : e.name,
        //     "address" : e.address,
        //     "id" : e.id
        //   };
        // }).toList();
        //print(employeeMappedList);
        if(state is FilterListState){
          return Scaffold(
            appBar: AppBar(
              title: const Text('Filter Employee ListView'),
              elevation: 0,
              actions: [
                Chip(
                  label: Text(state.addEmployee.length.toString()),
                  backgroundColor: Colors.white,
                )
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: (){
                          debugPrint(context.read<FilterListBloc>().state.addEmployee.runtimeType.toString());
                          debugPrint(context.read<FilterListBloc>().state.addEmployee[0].toString());
                          // dynamic jsonDataDecode = jsonEncode(context.read<FilterListBloc>().state.addEmployee);
                          // debugPrint(jsonDataDecode);
                          // String json = jsonEncode(lst);
                          var abc = EmployeeModel.convertList_To_JsonResponse(state.addEmployee);
                          print(abc);
                          //print(lst);
                        }, child: const Text('Ascending')),
                        ElevatedButton(onPressed: (){}, child: const Text('Descending')),
                        ElevatedButton(onPressed: (){}, child: const Text('Random Order')),

                        const SizedBox(height: 20,),
                      ],
                    ),
                    const SizedBox(height: 20,),

                    Expanded(
                        child: ListView.builder(
                            itemCount: state.addEmployee.length,
                            itemBuilder: (context, index){
                              //lst.add(state.addEmployee[index]);
                              return ListTile(
                                title: Text(state.addEmployee[index].name.toString()),
                                subtitle: Text(state.addEmployee[index].address.toString()),
                                trailing: GestureDetector(
                                    onTap: (){
                                      context.read<FilterListBloc>().add(RemoveEmployeeEvent(employeeModel: state.addEmployee[index]));
                                    },
                                    child: const Icon(Icons.delete, color: Colors.red,)
                                ),
                              );
                            }
                        )
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                _addEmployee(context);
              },
              child: const Icon(Icons.add),
            ),
          );
        }
     return const Center(child: Text('No data'),);
      }
);
  }
}

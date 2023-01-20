import 'package:filterlist/Models/EmployeeModel.dart';
import 'package:filterlist/bloc/ListBloc/filter_list_bloc.dart';
import 'package:filterlist/bloc/cubit/sort_list_cubit.dart';
import 'package:filterlist/guid_gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          const Text('Add Employee', style: TextStyle(
              fontSize: 24
          ),),
          const SizedBox(height: 10,),

          Form(
            key: context.read<SortListCubit>().state.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autofocus: true,
                      controller: context.read<SortListCubit>().state.nameController,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter name';
                        }
                      },
                      decoration: const InputDecoration(
                          label: Text('Name'),
                          border: OutlineInputBorder()
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autofocus: true,
                      minLines: 3,
                      maxLines: 5,
                      controller: context.read<SortListCubit>().state.addressController,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter address';
                        }
                      },
                      decoration: const InputDecoration(
                          label: Text('Address'),
                          border: OutlineInputBorder()
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('Cancel')),
                      ElevatedButton(onPressed: (){
                        if(context.read<SortListCubit>().state.formKey.currentState!.validate()){
                          var addEmployee = EmployeeModel(
                            name: context.read<SortListCubit>().state.nameController.text.toString(),
                            address:context.read<SortListCubit>().state.addressController.text.toString(),
                            id: GUIDGen.generate(),
                          );
                          context.read<FilterListBloc>().add(AddEmployeeEvent(employeeModel: addEmployee));
                          context.read<SortListCubit>().state.nameController.clear();
                          context.read<SortListCubit>().state.addressController.clear();
                          //debugPrint(context.read<FilterListBloc>().state.addEmployee.toString());
                        }
                        Navigator.pop(context);
                      }, child: const Text('Add Employee')
                      ),
                    ],),
                ],
              )
          ),
        ],
      ),
    );
  }
}

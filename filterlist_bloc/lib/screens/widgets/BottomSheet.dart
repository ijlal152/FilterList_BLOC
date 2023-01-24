import 'package:filterlist_bloc/Models/EmployeeModel.dart';
import 'package:filterlist_bloc/cubit/sortlist_cubit.dart';
import 'package:filterlist_bloc/randomID.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomModelBottomSheet extends StatelessWidget {
  const CustomModelBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          const Text('Add Task', style: TextStyle(
              fontSize: 24
          ),),
          const SizedBox(height: 10,),

          Form(
              key: context.read<SortlistCubit>().state.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      autofocus: true,
                      controller: context.read<SortlistCubit>().state.nameController,
                      decoration: const InputDecoration(
                          label: Text('Name'),
                          border: OutlineInputBorder()
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      autofocus: true,
                      minLines: 3,
                      maxLines: 5,
                      controller: context.read<SortlistCubit>().state.addressController,
                      decoration: const InputDecoration(
                          label: Text('Address'),
                          border: OutlineInputBorder()
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(onPressed: (){
                        Navigator.pop(context);}, child: const Text('Cancel')),
                      ElevatedButton(onPressed: (){
                        if(context.read<SortlistCubit>().state.formKey.currentState!.validate()){
                          var addEmployee = EmployeeModel(
                            name: context.read<SortlistCubit>().state.nameController.text.toString(),
                            address:context.read<SortlistCubit>().state.addressController.text.toString(),
                            id: GUIDGen.generate(),
                          );
                          context.read<SortlistCubit>().addEmployeeToList(addEmployee);
                          context.read<SortlistCubit>().state.nameController.clear();
                          context.read<SortlistCubit>().state.addressController.clear();
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

import 'package:filterlist_bloc/cubit/sortlist_cubit.dart';
import 'package:filterlist_bloc/cubit/sortlist_cubit.dart';
import 'package:filterlist_bloc/screens/widgets/BottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {

  void _addEmployee(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: CustomModelBottomSheet(),
          ),
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SortlistCubit, SortlistState>(
  builder: (context, state) {
    if(state is LoadingState){
      return const Center(child: Text('...'),);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Employee ListView'),
        //centerTitle: true,
        elevation: 0,
        actions:[
          Chip(
            label: Text(state.addEmployee.length.toString()),
            backgroundColor: Colors.white,
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  context.read<SortlistCubit>().sortAscendingOrder();
                },
                    child: const Text('Ascending')
                ),
                ElevatedButton(onPressed: (){
                  context.read<SortlistCubit>().sortDescendingOrder();
                }, child: const Text('Descending')),
                ElevatedButton(onPressed: (){
                  context.read<SortlistCubit>().shuffleOrder();
                }, child: const Text('Random Order')),

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
                              context.read<SortlistCubit>().removeEmployeeFromList(state.addEmployee[index]);
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

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _addEmployee(context);
        },
        child: const Icon(Icons.add),
      ),

    );
  },
      //buildWhen: (previousState, newState) =>  newState is SortStat,
);
  }
}

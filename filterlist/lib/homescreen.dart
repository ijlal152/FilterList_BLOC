
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
    return BlocConsumer<FilterListBloc, FilterListState>(
      listener: (context, state){
        if(state is AscendingOrderListState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Sorted in ascending order')));
        }
      },
      builder: (context, state){
        //state.mappedList = EmployeeModel.convertList_To_JsonResponse(state.addEmployee);

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
                      ElevatedButton(onPressed: () {
                         context.read<FilterListBloc>()
                         .add(AscendingOrderListEvent());
                      }, child: const Text('Ascending')),
                      ElevatedButton(onPressed: (){
                        context.read<FilterListBloc>()
                            .add(DescendingOrderListEvent());
                      }, child: const Text('Descending')),
                      ElevatedButton(onPressed: (){
                        context.read<FilterListBloc>()
                            .add(ShuffleListEvent());
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

      },
      //listenWhen: (previousState, newState)=> newState is AscendingOrderListState,
      //buildWhen: (previousState, newState) => previousState is FilterListState || newState is AscendingOrderListState,
);
  }
}

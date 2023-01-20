import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:filterlist/Models/EmployeeModel.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'filter_list_event.dart';
part 'filter_list_state.dart';

class FilterListBloc extends HydratedBloc<FilterListEvent, FilterListState> {
  FilterListBloc() : super(FilterListState()) {

    // on<RemoveEmployeeEvent>((event, emit) {
    //   state.addEmployee.removeAt(event.indexID);
    //   emit(EmployeeRemovedState());
    // });

    on<AddEmployeeEvent>(_OnAddEmployee);
    on<RemoveEmployeeEvent>(_OnRemoveProduct);
  }

  void _OnRemoveProduct(RemoveEmployeeEvent event, Emitter<FilterListState> emit){
    final state = this.state;
    emit(FilterListState(addEmployee: List.from(state.addEmployee)..remove(event.employeeModel)));
  }


  void _OnAddEmployee(AddEmployeeEvent event, Emitter<FilterListState> emit){
    final state = this.state;
    emit(FilterListState(
      addEmployee: List.from(state.addEmployee)..add(event.employeeModel),
    ));
  }

  @override
  FilterListState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return FilterListState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(FilterListState state) {
    // TODO: implement toJson
    return state.toMap();
  }

  // void _OnRemoveEmployee(RemoveEmployeeEvent event, Emitter<EmployeeRemovedState> emit){
  //
  //   //emit(EmployeeRemovedState());
  // }

}

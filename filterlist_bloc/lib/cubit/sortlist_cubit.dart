import 'package:equatable/equatable.dart';
import 'package:filterlist_bloc/Models/EmployeeModel.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'sortlist_state.dart';

class SortlistCubit extends HydratedCubit<SortlistState> {

  SortlistCubit() : super(SortlistState());


  void addEmployeeToList(EmployeeModel employeeModel){
    final state = this.state;
    emit(SortlistState(addEmployee: List.from(state.addEmployee)..add(employeeModel)));
  }

  void removeEmployeeFromList(EmployeeModel employeeModel){
    final state = this.state;
    emit(SortlistState(addEmployee: List.from(state.addEmployee)..remove(employeeModel)));
  }

  void sortAscendingOrder(){
    final state = this.state;
    emit(LoadingState());
    state.addEmployee.sort((a,b) => a.name.compareTo(b.name));
    //print(state.addEmployee);
    emit(SortlistState(addEmployee: state.addEmployee));
  }

  void sortDescendingOrder(){
    final state = this.state;
    emit(LoadingState());
    state.addEmployee.sort((a,b) => b.name.compareTo(a.name));
    //print(state.addEmployee);
    emit(SortlistState(addEmployee: state.addEmployee));
  }

  void shuffleOrder(){
    final state = this.state;
    emit(LoadingState());
    state.addEmployee.shuffle();
    //print(state.addEmployee);
    emit(SortlistState(addEmployee: state.addEmployee));
  }

  @override
  SortlistState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return SortlistState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SortlistState state) {
    // TODO: implement toJson
    return state.toJson();
  }

}

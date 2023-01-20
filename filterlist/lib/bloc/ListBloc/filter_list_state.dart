part of 'filter_list_bloc.dart';

class FilterListState extends Equatable{
  final List<EmployeeModel> addEmployee;
  //final List<EmployeeModel> removedEmployee;

  FilterListState({
    this.addEmployee = const <EmployeeModel>[],
    //this.removedEmployee = const <EmployeeModel>[]
});

  List<Object> get props =>[addEmployee];

  Map<String, dynamic> toMap() {
    return {
      "addEmployee": addEmployee.map((e) => e.toMap()).toList(),
      //"removedEmployee": removedEmployee.map((e) => e.toMap()).toList(),
    };
  }

  factory FilterListState.fromMap(Map<String, dynamic> map) {
    return FilterListState(
      addEmployee: List<EmployeeModel>.from(map['addEmployee'].map((x) => EmployeeModel.fromMap(x))),
      //removedEmployee: List<EmployeeModel>.from(map['removedEmployee'].map((x) => EmployeeModel.fromMap(x))),
    );
  }
//
}

class EmployeeRemovedState extends FilterListState{
  // final int id;
  // EmployeeRemovedState({required this.id});
  //
  //
  // @override
  // List<Object> get props =>[id];
}

//class FilterListInitial extends FilterListState {}

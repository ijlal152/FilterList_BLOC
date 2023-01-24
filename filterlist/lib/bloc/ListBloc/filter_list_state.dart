part of 'filter_list_bloc.dart';

class FilterListState extends Equatable{
  final List<EmployeeModel> addEmployee; // [Obj(1, 3, 4), Obj(4, 5, 6)]
  final List<EmployeeModel> ascendingOrderList;
  //final List<EmployeeModel> mappedList;
  //List<Map<String, dynamic>> mappedList;  // {name: Ijlal Hussain, address: Fateh Jang, id: c9a91676-21e4-419f-ab89-f4044f5b56e3}
  //var sortedList;


  FilterListState({
    this.addEmployee = const <EmployeeModel>[],
    this.ascendingOrderList = const<EmployeeModel>[],
    //this.mappedList = const<EmployeeModel>[]
});
  @override
  List<Object> get props =>[addEmployee, ascendingOrderList,];

  Map<String, dynamic> toMap() {
    return {
      "addEmployee": addEmployee.map((e) => e.toMap()).toList(),
      "ascendingOrderList" : ascendingOrderList.map((e) => e.toMap()).toList(),
      //"mappedList" : mappedList.map((e) => e.toMap()).toList(),
    };
  }

  factory FilterListState.fromMap(Map<String, dynamic> map) {
    return FilterListState(
      addEmployee: List<EmployeeModel>.from(map['addEmployee'].map((x) => EmployeeModel.fromMap(x))),
      ascendingOrderList: List<EmployeeModel>.from(map['ascendingOrderList'].map((x) => EmployeeModel.fromMap(x))),
      //mappedList: List<EmployeeModel>.from(map['mappedList'].map((x) => EmployeeModel.fromMap(x))),
    );
  }
//




}

class EmployeeRemovedState extends FilterListState{

}

class LoadingState extends FilterListState{

}

class AscendingOrderListState extends FilterListState{
  // List<Map<String, dynamic>> mappedList;
  // AscendingOrderListState({required this.mappedList});
  //
  // @override
  // List<Object> get props =>[mappedList];

}
class DescendingOrderListState extends FilterListState{

}

//class FilterListInitial extends FilterListState {}

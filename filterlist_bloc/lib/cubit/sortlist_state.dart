part of 'sortlist_cubit.dart';

class SortlistState extends Equatable{
  final List<EmployeeModel> addEmployee; // [Obj(1, 3, 4), Obj(4, 5, 6)]
  //final List<EmployeeModel> ascendingOrderList;

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SortlistState({this.addEmployee = const <EmployeeModel>[],});

  @override
  List<Object> get props => [addEmployee];

  Map<String, dynamic> toJson() {
    return {
      "addEmployee": addEmployee.map((e) => e.toMap()).toList(),
    };
  }

  factory SortlistState.fromJson(Map<String, dynamic> map) {
    return SortlistState(
      addEmployee: List<EmployeeModel>.from(map['addEmployee'].map((x) => EmployeeModel.fromMap(x))),
    );
  }
//
}

class LoadingState extends SortlistState{

}


part of 'filter_list_bloc.dart';


class FilterListEvent extends Equatable{
  const FilterListEvent();

  @override
  List<Object> get props => [];
}

class AddEmployeeEvent extends FilterListEvent{
  final EmployeeModel employeeModel;
  AddEmployeeEvent({required this.employeeModel});

  List<Object> get props => [employeeModel];
}

class RemoveEmployeeEvent extends FilterListEvent{
  final EmployeeModel employeeModel;
  const RemoveEmployeeEvent({required this.employeeModel});

  List<Object> get props => [employeeModel];
}

import 'package:equatable/equatable.dart';
import 'package:filterlist/Models/EmployeeModel.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'filter_list_event.dart';
part 'filter_list_state.dart';

class FilterListBloc extends HydratedBloc<FilterListEvent, FilterListState> {
  FilterListBloc() : super(FilterListState()) {
    on<AddEmployeeEvent>(_OnAddEmployee);
    on<RemoveEmployeeEvent>(_OnRemoveProduct);
    on<AscendingOrderListEvent>(_OnAscendingOrderList);
    on<DescendingOrderListEvent>(_OnDescendingOrderList);
    on<ShuffleListEvent>(_OnShuffleOrderList);
  }

  void _OnAscendingOrderList(AscendingOrderListEvent event, Emitter<FilterListState> emit){
    final state = this.state;
    emit(LoadingState());
    state.addEmployee.sort((a,b) => a.name.compareTo(b.name));
    emit(FilterListState(addEmployee: state.addEmployee));
  }

  void _OnDescendingOrderList(DescendingOrderListEvent event, Emitter<FilterListState> emit){
    final state = this.state;
    emit(LoadingState());
    state.addEmployee.sort((a,b) => b.name.compareTo(a.name));
    emit(FilterListState(addEmployee: state.addEmployee));
  }

  void _OnShuffleOrderList(ShuffleListEvent event, Emitter<FilterListState> emit){
    final state = this.state;
    emit(LoadingState());
    state.addEmployee.shuffle();
    emit(FilterListState(addEmployee: state.addEmployee));
  }

  // remove data from list
  void _OnRemoveProduct(RemoveEmployeeEvent event, Emitter<FilterListState> emit){
    final state = this.state;
    emit(FilterListState(addEmployee: List.from(state.addEmployee)..remove(event.employeeModel)));
  }

  // add data in list
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

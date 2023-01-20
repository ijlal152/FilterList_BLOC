import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'sort_list_state.dart';

class SortListCubit extends Cubit<SortListState> {
  SortListCubit() : super(SortListInitial());






  @override
  Future<void> close() {
    // TODO: implement close
    state.nameController.dispose();
    state.addressController.dispose();
    return super.close();
  }




}

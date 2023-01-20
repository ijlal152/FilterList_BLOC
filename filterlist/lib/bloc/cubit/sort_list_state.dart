part of 'sort_list_cubit.dart';

class SortListState extends Equatable {

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SortListState();
  @override
  List<Object> get props => [nameController, addressController, formKey];


  @override
  void onClose() {
    nameController.dispose();
    addressController.dispose();
  }


}

class SortListInitial extends SortListState {

}

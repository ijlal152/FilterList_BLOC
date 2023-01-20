import 'package:equatable/equatable.dart';

class EmployeeModel extends Equatable{
  final String name;
  final String address;
  final String id;
  EmployeeModel({
    required this.name,
    required this.address,
    required this.id
});

  @override
  // TODO: implement props
  List<Object?> get props => [name, address, id];

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "address": address,
      "id": id,
    };
  }

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      name: map["name"],
      address: map["address"],
      id: map["id"],
    );
  }

  static dynamic convertList_To_JsonResponse(List<dynamic> items) {
    var mappedList = items.map((e) {
      return {
        "name" : e.name,
        "address" : e.address,
        "id" : e.id,
      };
    }).toList();
    return mappedList;
  }



//
}
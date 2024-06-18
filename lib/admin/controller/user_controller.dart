import 'package:imtihon_3_oy/admin/models/user_model.dart';
import 'package:imtihon_3_oy/admin/services/user_services.dart';

class UserController {
  final userServices = UserServices();
  List<UserModel> _list = [];
  Future<List<UserModel>> get list async {
    _list = await userServices.getUsers();
    return [..._list];
  }
}
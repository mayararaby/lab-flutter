import 'package:iti_aswan_tutorial/models/user.dart';
import 'package:iti_aswan_tutorial/services/services_handler.dart';

class UserServices {
  String endPoint = "/users";

  Future<List<User>> getUsers() async {
    try {
      Map<String, dynamic> response =
          await ServicesHandler().getService(endPoint);
      Iterable usersData = response['data'];
      List<User> usersList =
          usersData.map((item) => User.fromJson(item)).toList();
      return usersList;
    } catch (error) {
      throw Exception('Failed to get users!');
    }
  }

  Future postUser(dynamic body) async {
    try {
      Map<String, dynamic> response = await ServicesHandler().postService(endPoint, body: body);
      return response;
    } catch(error) {
      print(error);
    }
  }
}

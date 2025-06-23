import 'package:adv_flutter_labs/import_export.dart';

class UserListController{
  UserListModel userListModel = UserListModel();

  void addUserInList(user) => userListModel.addUserInList(user);
  void updateUserInList(index,user) => userListModel.updateUserInList(index, user);
  List<dynamic> getUserFromList() => userListModel.getUserFromList();
  void removeUserFromList(index) => userListModel.removeUserFromList(index);
  void toggleFavUserById() => userListModel.toggleFavUserById();

}
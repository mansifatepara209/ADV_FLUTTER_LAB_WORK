class UserListModel {
  List<dynamic> userList = [];

  void addUserInList(dynamic user) {
    userList.add(user);
  }

  void updateUserInList(index, user) {
    if(index != null && index < userList.length){
      userList[index]=user;
    }
  }

  void removeUserFromList(index) {
    userList.removeAt(index);
  }

  List<dynamic> getUserFromList(){
    return userList;
  }

  void toggleFavUserById() {

  }
}

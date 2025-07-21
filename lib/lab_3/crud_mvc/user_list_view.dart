import 'dart:typed_data';
import '../../import_export.dart';

class UserListView extends StatefulWidget {
  UserListView({super.key});

  static UserListController userListController = UserListController();

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User List Page'), centerTitle: true),
      body:
          UserListView.userListController.getUserFromList().isNotEmpty
              ? ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      UserListView.userListController
                          .getUserFromList()[index][NAME],
                    ),
                    subtitle: Text(
                      UserListView.userListController
                          .getUserFromList()[index][EMAIL],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AddUserPage(
                              index: index,
                              user:
                                  UserListView.userListController
                                      .getUserFromList()[index],
                            );
                          },
                        ),
                      ).then((value) {
                        if (value == true) {
                          setState(() {});
                        }
                      });
                    },
                    trailing: SizedBox(
                      width: 96,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return AddUserPage(
                                      user:
                                          UserListView.userListController
                                              .getUserFromList()[index],
                                      index: index,
                                    );
                                  },
                                ),
                              ).then((value) {
                                if (value == true) {
                                  setState(() {});
                                }
                              });
                            },
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              UserListView.userListController.removeUserFromList(
                                index,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('User Deleted!')),
                              );
                              setState(() {});
                              print("User deleted!");
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount:
                    UserListView.userListController.getUserFromList().length,
              )
              : Center(child: Text('DATA NOT FOUND')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddUserPage();
              },
            ),
          ).then((value) {
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

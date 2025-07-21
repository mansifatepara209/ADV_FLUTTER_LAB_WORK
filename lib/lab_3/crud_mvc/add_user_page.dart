import '../../import_export.dart';

class AddUserPage extends StatefulWidget {
  final dynamic user;
  final int? index;

  const AddUserPage({super.key,this.user,this.index});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  var _nameController = TextEditingController();
  var _emailController = TextEditingController();

  @override
  void initState(){
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();

    if (widget.user != null) {
      _nameController.text = widget.user[NAME];
      _emailController.text = widget.user[EMAIL];
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.user == null ? 'Add User Page' : 'Edit User Page'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Enter Name'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Enter Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if(widget.user!=null && widget.index!=null){
                  widget.user[NAME] = _nameController.text.toString();
                  widget.user[EMAIL] = _emailController.text.toString();
                  UserListView.userListController.updateUserInList(widget.index,widget.user);
                }
                else{
                  Map<String, dynamic> newUser = {};
                  newUser[NAME] = _nameController.text.toString();
                  newUser[EMAIL] = _emailController.text.toString();
                  UserListView.userListController.addUserInList(newUser);
                }
                Navigator.pop(context, true);
              },
              child: Text(widget.user!=null? 'Update User' : 'Add User'),
            ),
          ],
        ),
      ),
    );
  }
}

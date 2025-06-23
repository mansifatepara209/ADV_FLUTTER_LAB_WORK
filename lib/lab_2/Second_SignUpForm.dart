import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    ":::SignUp Form:::",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: 20,),
                  //name field
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: "Enter Your Name",
                      hintText: "Enter Your Name",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return "Please Enter Your Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  //email Field
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Enter Your Email",
                      hintText: "Enter Your Email",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return "Please Enter Your Email";
                      }
                      if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  //MobileNo feild
                  TextFormField(
                    controller: _phoneController,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Enter Your Mobile NUmber",
                      hintText: "Enter Your MObile Number",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return "Please Enter Your Mobile Number";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  //password feild
                  TextFormField(
                    controller: _passController,
                    decoration: InputDecoration(
                      labelText: "Enter Strong Password",
                      hintText: "Enter Strong Password",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    obscureText: true,
                    validator: (value){
                      if (value == null || value.length<8){
                        return "Password must be at least 8 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  //ConfirmPassword Field
                  TextFormField(
                    controller: _confirmPassController,
                    decoration: InputDecoration(
                      labelText: "Enter Confirm Password",
                      hintText: "Enter Confirm Passwprd",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    obscureText: true,
                    validator: (value){
                      if (value != _passController.text){
                        return "Password Do Not Match! Please Enter Again!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: () {
                    if(_formKey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content : Text("Sign Up Successfully!!")));
                    }
                  }, child: Text("Sign Up"))
                ],
              ),
                 ),
            ),
          ),
        ),
    );
  }
}

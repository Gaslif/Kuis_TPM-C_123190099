import  'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
          backgroundColor: Colors.lightGreen,
        ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Column(children: [
                _createImage(),
                _usernameField(),
                _passwordField(),
                _loginButton(context),
              ]),
            ),
        ),
      ),
    );
  }
  Widget _createImage(){
    return Container(
      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdmxbvmlE0dwO_NUoQkQbLsoGpZdPCjjJBnQ&usqp=CAU"),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value){
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username',
          contentPadding: const EdgeInsets.all(8.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            borderSide:  BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _passwordField(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value){
          password = value;
        },
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.all(8.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            borderSide:  BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          String text = "";
          if(username == "gaslif" && password == "admin"){
            setState(() {
              text = "Login Success";
              isLoginSuccess = true;
            });
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) { return HomePage(username: username); }));
          } else {
            setState(() {
              text = "Login Failed";
              isLoginSuccess = false;
            });
          }

          SnackBar snackBar = SnackBar(
            content: Text(text),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
        style: ElevatedButton.styleFrom(
            primary: (isLoginSuccess) ? Colors.blue : Colors.red,
            onPrimary: Colors.white
        ),
      ),
    );
  }

}

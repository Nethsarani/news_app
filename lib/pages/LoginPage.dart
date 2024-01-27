import 'package:flutter/material.dart';
import 'package:news_app/models/DatabaseHandler.dart';
import 'package:news_app/models/User.dart';
import 'package:news_app/pages/HomePage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController(); 
  
  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    passwordController.dispose();
  } 
  
  late	DatabaseHandler	handler;		
  @override
  void	initState()	{
    super.initState();
    handler	=	DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    TextFormField (
      controller: userNameController,
      decoration: const InputDecoration(
        labelText: 'Username',
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.blue
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey
          ),
        ),
      ),
    );
    TextFormField (
      controller: passwordController,
      decoration: const InputDecoration(
        labelText: 'Password',
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.blue
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey
          ),
        ),
      ),
    );

    ElevatedButton(
      onPressed: () {
        List<User>	snapshot =	handler.retrieveUsers() as List<User>;
          for(var index=0; index<snapshot.length; index++) {
            if(snapshot[index].username==userNameController.text &&
                snapshot[index].password==passwordController.text) {
              Navigator.push(
                context,MaterialPageRoute(
                  builder: (context) => const HomePage()
              ),
              );
            }
          }

      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[600],
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      child: const Text("Login",
        style: TextStyle(color: Colors.white),
      ),
    );

    throw UnimplementedError();
  }
}
  



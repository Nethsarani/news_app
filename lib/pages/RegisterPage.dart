import 'package:flutter/material.dart';
import 'package:news_app/models/DatabaseHandler.dart';
import 'package:news_app/pages/LoginPage.dart';
import 'package:news_app/models/User.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});


  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late DatabaseHandler handler;
  TextEditingController nameTextController = TextEditingController();
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  @override
  void initState() {
    super.initState();

    handler = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: nameTextController,
            decoration: const InputDecoration(
              labelText: 'name',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: usernameTextController,
            decoration: const InputDecoration(
              labelText: 'username',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: passwordTextController,
            decoration: const InputDecoration(
              labelText: 'password',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: 100.0,
            height: 60.0,
            child: ElevatedButton(
              onPressed: () {
                handler.initializeDB().whenComplete(() async {
                  User secondUser = User(
                      name: nameTextController.text,
                      username: usernameTextController.text,
                      password: passwordTextController.text);
                  List<User> listOfUsers = [secondUser];
                  handler.insertUser(listOfUsers);
                  setState(() {});
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginPage(title: "title")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              child: const Text(
                "SAVE",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
    throw UnimplementedError();
  }
}


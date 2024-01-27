import 'package:flutter/material.dart';
import 'package:news_app/models/DatabaseHandler.dart';
import 'package:news_app/pages/LoginPage.dart';
import 'package:news_app/models/User.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});


  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
List<User> _allData=[];
class _RegisterPageState extends State<RegisterPage> {
  late DatabaseHandler handler;
  TextEditingController nameTextController = TextEditingController();
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  void _refreshData() async{
    final data=await handler.retrieveUsers();
    setState(() {
      _allData=data;
    });
  }

  Future<void> _addData(User user) async{
    await handler.insertUser(user);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Contact added"),
      backgroundColor: Colors.green,duration: Duration(seconds: 1),));
    _refreshData();
  }

  @override
  void initState() {
    super.initState();

    handler = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
        title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("Global"),
    Text("News",
    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
    )
    ],
    ),
    centerTitle: true,
    elevation: 0.0,
    ),

    body: Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: nameTextController,
            decoration: const InputDecoration(
              labelText: 'Name',
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
              labelText: 'Username',
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
              labelText: 'Password',
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
              onPressed: () async {
                //handler.db().whenComplete(() async {
                  User secondUser = User(
                      name: nameTextController.text,
                      username: usernameTextController.text,
                      password: passwordTextController.text);
                  //List<User> listOfUsers = [secondUser];
                  //handler.insertUser(listOfUsers);
                  await _addData(secondUser);
                  //setState(() {});
                //}
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
    )
    );

  }
}


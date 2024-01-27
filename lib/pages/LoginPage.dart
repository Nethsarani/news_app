import 'package:flutter/material.dart';
import 'package:news_app/models/DatabaseHandler.dart';
import 'package:news_app/models/User.dart';
import 'package:news_app/pages/HomePage.dart';
import 'package:news_app/pages/RegisterPage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}
List<User> _allData=[];
class _LoginPageState extends State<LoginPage> {
  late	DatabaseHandler	handler;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    passwordController.dispose();
  } 
  

  @override
  void	initState()	{
    super.initState();
    handler	=	DatabaseHandler();
    _refreshData();
  }



void _refreshData() async{
  final data=await handler.retrieveUsers();
  setState(() {
    _allData=data;
  });
}

  @override
  Widget build(BuildContext context) {

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

    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
    ),
        SizedBox(
          height: 20.0,
        ),
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
      ),
        SizedBox(
          height: 20.0,
        ),
      ElevatedButton(
        onPressed: () async {
          //List<User>	snapshot =	handler.retrieveUsers() as List<User>;
           _refreshData();
          for(var index=0; index<_allData.length; index++) {
            if(_allData[index].username==userNameController.text &&
                _allData[index].password==passwordController.text) {
              Navigator.push(
                context,MaterialPageRoute(
                  builder: (context) => const HomePage()
              ),
              );
              break;
            }
          }

          userNameController.text="";
          passwordController.text="";

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
      ),

        ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,MaterialPageRoute(
              builder: (context) => const RegisterPage()
          ),
      );
    },
    style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[600],
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      child: const Text("Register",
        style: TextStyle(color: Colors.white),
      ),
    ),


        Text(_allData.length.toString()
    )

    ],
    )
    );
    }



  }

  



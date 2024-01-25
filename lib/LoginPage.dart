import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; 

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController(); 
  
  @override void dispose() { 
    super.dispose();
    userNameController.dispose();
    passwordController.dispose();
  } 
  
  
  
  TextFormField (
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
  
  TextFormField (
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
  
  ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,MaterialPageRoute(
          builder: (context) => const LoginScreen()
        ),
      );
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
  
  }
  
  class	User	{
    final	int?	id;	
    final	String	name;	
    final	int	age;	
    final	String?	email;
    final String? password;
    
    User(	{
      this.id,
      required	this.name,
      required	this.age,
      required this.email
      required this.password
    });	
    
    User.fromMap(Map<String,	dynamic>	res)	:	
      id	=	res["id"],	
      name	=	res["name"],	
      age	=	res["age"],	
      email	=	res["email"],
      password=res["password"];	
      
    Map<String,	Object?>	toMap()	{	
      return	{	
        'id':	id,	
        'name':	name,	
        'age':	age,
        'email':	email,
        'password': password
      };			
    }	
  }		


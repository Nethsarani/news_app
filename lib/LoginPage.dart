import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
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


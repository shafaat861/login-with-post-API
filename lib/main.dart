

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
TextEditingController emailControler=TextEditingController();
TextEditingController passwordControler=TextEditingController();

Future<void> login(String email,password) async {
  try{

    Response response = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          'email' : email,
          'password' : password
        }
    );

    if(response.statusCode == 200){

      var data = jsonDecode(response.body.toString());
      print(data['token']);
      print('Login successfully');

    }else {
      print('failed');
    }
  }catch(e){
    print(e.toString());
  }
}

class _MyAppState extends State<MyApp> {
  @override


  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Sign up api'),
        centerTitle: true,
        backgroundColor: Colors.amber,),
        body:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                 TextFormField(
                   controller: emailControler,
                   decoration: InputDecoration(
                     hintText: 'Email',
                   ),
                 ),
                 SizedBox(height: 20,),
              TextFormField(
                controller: passwordControler,
                decoration: InputDecoration(
                    hintText: 'password',
                ),
              ),
              SizedBox(height: 50,),
              GestureDetector(
                onTap: (){
                  login(emailControler.text.toString(),passwordControler.text.toString());
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10)
                  ),

                  child: Center(child: Text('Sign Up')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:registrationapp/Home.dart';

import 'Sign_Up.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  //create a global key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
           child: Form(
            //implement key
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.green,
                  backgroundImage: AssetImage('image/icon2.jpg'),
                ),
                SizedBox(
                  height: 20.0,
                  child: Text('User login'),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    // ignore: missing_return
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'PLease enter the correct  Email ';
                      }
                    },
                    onSaved: (input) => _email = input,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        size: 15.0,
                      ),
                      labelText: 'Email ',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    // ignore: missing_return
                    validator: (input) {
                      if (input.length < 6) {
                        return 'please enter the coreect password';
                      }
                    },
                    onSaved: (input) => _password = input,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.remove_red_eye,
                        size: 15.0,
                      ),
                      labelText: 'Password ',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ),
                RaisedButton(
                  onPressed: signIn,
                  child: Text('Sign in'),
                ),
                FlatButton(
                  onPressed: signIn,
                  child: Text('Don\'t have an Account? Login', style: TextStyle(color:Colors.green),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    //validate the fields
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        AuthResult user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } catch (e) {
        print(e);
      }
    }
    else{
      return SignUp();
    }
  }
}

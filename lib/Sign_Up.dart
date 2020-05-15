import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:registrationapp/Sign_in.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email, _password, _user,_confirmPass;
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
                  child: Text('Register'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    // ignore: missing_return
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter your name ';
                      }
                    },
                    onSaved: (input) => _user = input,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        size: 15.0,
                      ),
                      labelText: 'User Name ',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    // ignore: missing_return
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter a valid Email ';
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
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    // ignore: missing_return
                    validator: (input) {
                      if (input.length < 6) {
                        return 'Password should be atleast 6 characters ';
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    // ignore: missing_return
                    validator: (input) {
                      if (input.length < 6) {
                        return 'Password should be atleast 6 characters ';
                      }
                    },
                    onSaved: (input) => _confirmPass = input,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.remove_red_eye,
                        size: 15.0,
                      ),
                      labelText: 'Confirm Password ',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: signUp,
                    child: Text('Sign Up'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUp() async {
    //validate the fields
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        AuthResult user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } catch (e) {
        print(e);
      }
    }
  }
}

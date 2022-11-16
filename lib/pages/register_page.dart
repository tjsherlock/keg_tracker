import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({
    Key? key,
    required this.showLoginPage,
    }): super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();


}


class _RegisterPageState extends State<RegisterPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();


  @override
  dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future signUp() async {

    if(passwordConfirmed()){
      //create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }

    //Add use details
    addUserDetails(
      _firstNameController.text.trim(),
      _lastNameController.text.trim(),
      _emailController.text.trim(),
      int.parse(_ageController.text.trim()),
    );
  }

  Future addUserDetails(String firstName, String lastName, String email, int age) async {

    await FirebaseFirestore.instance.collection('Users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'age': age,
    });
  }

  bool passwordConfirmed(){
    if(_passwordController.text.trim() == _confirmPasswordController.text.trim()){
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Put Integrity Brewing icon here.
                    Image.asset(
                      //  'assets/images/image001.jpg',
                      //'assets/images/IntegrityBrewingTransparent_75x75.png',
                      'assets/images/IB_I_Logo_Black_Vector_10PTC.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    //https://stackoverflow.com/questions/50198885/how-to-use-an-image-instead-of-an-icon-in-flutter

/*              Icon(
                  Icons.android,
                  size: 100,
                ),*/

                    //Hello again!
                    SizedBox(height: 10),
                    Text('Keg Tracker',
                        style: GoogleFonts.bebasNeue(
                          fontSize: 52,
                        )
/*              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  ),*/
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Register to track kegs\.',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height:50),

                    //First Name
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                              controller: _firstNameController,
                              autofocus: false,
                              decoration:InputDecoration(
                                border: InputBorder.none,
                                hintText:'First Name',
                              )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    //Last Name
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                              controller: _lastNameController,
                              autofocus: false,
                              decoration:InputDecoration(
                                border: InputBorder.none,
                                hintText:'Last Name',
                              )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),


                    //Age
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                              controller: _ageController,
                              autofocus: false,
                              decoration:InputDecoration(
                                border: InputBorder.none,
                                hintText:'Age',
                              )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),









                    //email textfield







                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                              controller: _emailController,
                              autofocus: false,
                              decoration:InputDecoration(
                                border: InputBorder.none,
                                hintText:'Email',
                              )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    //password textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration:InputDecoration(
                                border: InputBorder.none,
                                hintText:'Password',
                              )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    //confirm password textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                              controller: _confirmPasswordController,
                              obscureText: true,
                              decoration:InputDecoration(
                                border: InputBorder.none,
                                hintText:'Confirm Password',
                              )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),


                    //sign in button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: GestureDetector(
                        onTap: signUp,
                        child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Center(
                              child: Text('Sign up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )
                              ),
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 25),

                    //not a member? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'Member already?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )
                        ),
                        GestureDetector(
                          onTap: widget.showLoginPage,
                          child: Text(
                              ' Log in now',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
        ));

  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/main_button.dart';
import '../utils/space.dart';
import '../utils/text_fild.dart';
import '../utils/text_style.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController userName = TextEditingController();
  TextEditingController userPass = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPh = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBG,
      body: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SpaceVH(height: 50.0),
              Text(
                'Create new account',
                style: headline1,
              ),
              SpaceVH(height: 10.0),
              Text(
                'Please fill in the form to continue',
                style: headline3,
              ),
              SpaceVH(height: 60.0),
              textFild(
                controller: userName,
                image: 'user.svg',
                keyBordType: TextInputType.name,
                hintTxt: 'Full Name',
              ),
              textFild(
                controller: userEmail,
                keyBordType: TextInputType.emailAddress,
                image: 'user.svg',
                hintTxt: 'Email Address',
              ),

              textFild(
                controller: userPass,
                isObs: true,
                image: 'hide.svg',
                hintTxt: 'Password',
              ),
              SpaceVH(height: 80.0),
              Mainbutton(
                onTap: () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword
                    (email: userEmail.text, password: userPass.text).then((value){
print("USER CREATED");

                  }).onError((error, stackTrace) {

                    print("Error${error.toString()}");
                  });
                },
                text: 'Sign Up',
                btnColor: blueButton,
              ),
              SpaceVH(height: 20.0),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Have an account? ',
                      style: headline.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                    TextSpan(
                      text: ' Sign In',
                      style: headlineDot.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

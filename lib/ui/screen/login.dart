import 'package:cyberCrypto/net/coinNotifier.dart';
import 'package:cyberCrypto/services/authService.dart';
import 'package:cyberCrypto/ui/screen/mainPage.dart';
import 'package:cyberCrypto/ui/screen/register.dart';
import 'package:cyberCrypto/ui/themes/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool? isLoginClick = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: SizedBox(),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: size.height * 0.2,
                top: size.height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Welcome Back",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: size.width * 0.1, fontFamily: "Nunito-Bold")),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            width: 30,
                            image: AssetImage('assets/images/google.png')),
                        SizedBox(width: 40),
                        Image(
                            width: 30,
                            image: AssetImage('assets/images/facebook.png'))
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextField(
                        controller: _email,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(fontFamily: "Nunito"),
                            hintText: "Email"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextField(
                        obscureText: true,
                        controller: _password,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(fontFamily: "Nunito"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Forgot Password?",
                      style: Theme.of(context).textTheme.bodyText1,
                    )
                  ],
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      isLoginClick!
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: _email.text.isEmpty ||
                                      _password.text.isEmpty
                                  ? null
                                  : () async {
                                      setState(() {
                                        isLoginClick = true;
                                      });
                                      var response = await signIn(
                                          _email.text, _password.text);
                                      print(response);
                                      if (response == "Login Successful") {
                                        CoinNotifier cn =
                                            Provider.of<CoinNotifier>(context,
                                                listen: false);
                                        cn.getCoinsLists();
                                        AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.SUCCES,
                                          animType: AnimType.BOTTOMSLIDE,
                                          title: response,
                                          desc: '',
                                          btnCancelOnPress: () {},
                                          btnOkOnPress: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MainPage(),
                                              ),
                                            );
                                          },
                                        )..show();
                                      } else {
                                        AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.ERROR,
                                            animType: AnimType.BOTTOMSLIDE,
                                            title: response,
                                            desc: '',
                                            btnCancelOnPress: () {},
                                            btnOkOnPress: () {
                                              setState(() {
                                                isLoginClick = false;
                                              });
                                            })
                                          ..show();
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                padding: EdgeInsets.all(18),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              child: Center(
                                  child: Text(
                                "Login",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                            ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ),
                          );
                        },
                        child: Text("Don't have an account?  Sign-Up",
                            style: Theme.of(context).textTheme.bodyText1),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

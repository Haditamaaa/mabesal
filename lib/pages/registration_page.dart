import 'package:flutter/material.dart';
import 'package:mabesal/common/theme_helper.dart';
import 'package:mabesal/pages/login_page.dart';

class RegistrationPage extends StatefulWidget{
  const RegistrationPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage>{

  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).colorScheme.secondary]
              )
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 22.0),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(
                  top: 22.0, right: 138.0, left: 22.0,
              ),
              child: Row(
                children: [
                  const Spacer(),
                  Image.asset('images/image1.png',
                  width: 131, height: 115, alignment: Alignment.center,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 70, 25, 50),
              padding: const EdgeInsets.fromLTRB(25, 70, 25, 50),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50.0,
                        ),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShadow(),
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration("Email Address", "enter your email address"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val){
                              if(val!.isEmpty){
                                return "Please enter your email";
                              }
                              else if(!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShadow(),
                          child: TextFormField(
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                "Password", "Enter your password"),
                            keyboardType: TextInputType.visiblePassword,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: ThemeHelper().textInputDecoration(
                              'Confirm Password', 'Enter Your Confirm Password'),
                          keyboardType: TextInputType.visiblePassword,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Confirm password";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                            height: 15.0
                        ),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    const Text("I accept all terms and conditions.", style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return '            You need to accept terms and conditions\n'
                                  '';
                            } else {
                              return null;
                            }
                          },
                        ),
                        Container(
                          decoration: ThemeHelper().buttonBoxDecoration(context),
                          child:ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(30, 14, 30, 14),
                              child: Text('Register'.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => const LoginPage()
                                    ),
                                        (Route<dynamic> route) => false
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
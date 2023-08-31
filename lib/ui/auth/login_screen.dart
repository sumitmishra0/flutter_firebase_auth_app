import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/ui/auth/signup_screen.dart';
import 'package:flutter_application_1/widgets/round_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(children: [
                TextFormField(controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Please enter your email';
                  }
                  return null;
                },
              decoration:const InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
              ),
              SizedBox(height: 10,),
              TextFormField(controller: passwordController,
              keyboardType: TextInputType.text,
              obscureText: true,
               validator: (value) {
                  if(value!.isEmpty){
                    return 'Please enter your password';
                  }
                  return null;
                },
              decoration: InputDecoration(
                helperText:'Enter your password',
                prefixIcon: Icon(Icons.visibility_off),
              ),),
              ],)),
              SizedBox(height: 50,),
              RoundButton(title: 'Login', onTap: (){
                if(_formKey.currentState!.validate()){
    
                }
              }),
               SizedBox(height: 30,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Don't have an account?"),
                SizedBox(width: 10,),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SignupScreen()));
                }, child: Text('SignUp')),
               ],)
            ],
          ),
        ),
      ),
    );
  }
}

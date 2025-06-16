import 'package:email_validator/email_validator.dart';
import 'package:craft_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static final String name = '/login';


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 44),
                  AppLogo(width: 90, height: 90),
                  const SizedBox(height: 24),
                  Text(
                    'Welcome Back',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Please Enter Your Email & Password',
                    style: Theme.of(context).textTheme.headlineLarge
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Email address'),
                    validator: (String? value){
                      String emailValue = value ?? '';
                      if(EmailValidator.validate(emailValue)==false){
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Password'),
                    validator: (String? value){
                      RegExp regex =
                      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (value==null || value.isEmpty) {
                        return 'Please enter password';
                      } else {
                        if(value.length<8){
                          return 'At least 8 character';
                        }
                        if (!regex.hasMatch(value)) {
                          return "Must contain at least one\nlowercase,uppercase,special,digit";
                        } else {
                          return null;
                        }
                      }
            
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _onTapNext,
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapNext() async{
    if(_formKey.currentState!.validate()){

    }
  }


}

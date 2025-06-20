import 'package:email_validator/email_validator.dart';
import 'package:craft_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static final String name = '/signup';


  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _shippingAddressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
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
                    'Sign Up',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Get started with us with your details',
                    style: Theme.of(context).textTheme.headlineLarge
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _firstNameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'First Name'),
                    validator: (String? value){
                      if(value==null || value.trim().isEmpty){
                        return 'Enter First Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _lastNameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Last Name'),
                    validator: (String? value){
                      if(value==null || value.trim().isEmpty){
                        return 'Enter Last Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Phone'),
                    validator: (String? value){
                      String pattern = r'^(?:\+?88|0088)?01[13-9]\d{8}$';
                      RegExp regExp = RegExp(pattern);
                      if (value?.trim().isEmpty ?? true) {
                        return 'Please enter mobile number';
                      }
                      else if (!regExp.hasMatch(value!)) {
                        return 'Please enter valid mobile number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Email'),
                    validator: (String? value){
                      if(value==null || EmailValidator.validate(value)==false){
                        return 'Enter valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: false,
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
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _cityController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'City'),
                    validator: (String? value){
                      if(value==null || value.trim().isEmpty){
                        return 'Enter City';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _shippingAddressController,
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Shipping Address'),
                    validator: (String? value){
                      if(value==null || value.trim().isEmpty){
                        return 'Enter Shipping Address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _onTapNext,
                    child: Text('Sign Up'),
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

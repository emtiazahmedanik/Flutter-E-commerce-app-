import 'dart:async';

import 'package:craft_bay/app/asset_paths.dart';
import 'package:craft_bay/features/auth/ui/controller/verificatin_timer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});
  static final String name = '/verification-screen';
  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _pinVerificationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _vrificationTimeController = Get.find<VerificationTimerController>();

  @override
  void dispose() {
    _pinVerificationController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    _vrificationTimeController.wait();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              spacing: 10,
              children: [
                const SizedBox(height: 30),
                SvgPicture.asset(AssetPath.appLogoSvg, height: 120, width: 120),
                Text(
                  'Enter OTP Code',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text('A 4 digit OTP code has been sent'),
                buildPinCodeTextField(),
                ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){

                      }
                    },
                    child: Text('Next')
                ),
                const SizedBox(height: 20,),
                GetBuilder<VerificationTimerController>(
                  builder: (context) {
                    return Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Code will expire in',style: TextStyle(color: Colors.black54)),
                          TextSpan(text: ' ${_vrificationTimeController.getTime} s'),
                        ]
                      )
                    );
                  }
                ),
                GetBuilder<VerificationTimerController>(
                  builder: (context) {
                    return Visibility(
                      visible: _vrificationTimeController.isTimeEnd,
                        child: TextButton(
                            onPressed: (){
                              _vrificationTimeController.wait();
                            },
                            child: Text('Resend Code')
                        )
                    );
                  }
                )


              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPinCodeTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: PinCodeTextField(
        length: 4,
        validator: (String? value) {
          if (value == null || value.isEmpty || value.length < 4) {
            return '';
          }
          return null;
        },
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          inactiveColor: Colors.teal
        ),
        animationDuration: Duration(milliseconds: 300),
        enableActiveFill: true,
        controller: _pinVerificationController,
        appContext: context,
      ),
    );
  }
}

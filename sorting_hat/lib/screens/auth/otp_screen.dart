import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorting_hat/controllers/auth_controller.dart';

class OTPScreen extends ConsumerStatefulWidget {
  const OTPScreen({Key? key, required this.verificationId}) : super(key: key);
  final String verificationId;
  static const String routeName = '/otp-screen';

  @override
  ConsumerState<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends ConsumerState<OTPScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  void verifyOTP(BuildContext context, String verificationId, String userOTP) {
    ref.read(authControllerProvider).verifyOTP(
          context: context,
          verificationId: verificationId,
          userOTP: userOTP,
        );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Verifying the number"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text("Just get the otp already mf!"),
              SizedBox(
                width: size.width * 0.5,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: otpController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: "- - - - - -",
                    hintStyle: TextStyle(fontSize: 30),
                  ),
                  onChanged: (val) {
                    if (val.length == 6) {
                      verifyOTP(context, widget.verificationId, val.trim());
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

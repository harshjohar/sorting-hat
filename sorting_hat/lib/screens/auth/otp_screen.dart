import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorting_hat/constants.dart';
import 'package:sorting_hat/controllers/auth_controller.dart';
import 'package:sorting_hat/widgets/custom_text_button.dart';

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
    TextStyle? createStyle(Color color) {
      ThemeData theme = Theme.of(context);
      return theme.textTheme.headline5?.copyWith(color: color);
    }

    List<TextStyle?> otpTextStyles = [
      createStyle(kYellowColor),
      createStyle(kYellowColor),
      createStyle(kYellowColor),
      createStyle(kYellowColor),
      createStyle(kYellowColor),
      createStyle(kYellowColor),
    ];

    ThemeData theme = Theme.of(context);
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: kGreenColor,
          height: double.infinity,
          width: double.infinity,
        ),
        SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Verification Code",
                  style: theme.textTheme.headline4,
                ),
                const SizedBox(height: 16),
                Text(
                  "We texted you a code",
                  style: theme.textTheme.headline6,
                ),
                const Spacer(flex: 2),
                OtpTextField(
                  numberOfFields: 6,
                  autoFocus: true,
                  styles: otpTextStyles,
                  borderColor: kYellowColor,
                  focusedBorderColor: kYellowColor,
                  cursorColor: kYellowColor,
                  // styles: otpTextStyles,
                  showFieldAsBox: true,
                  borderWidth: 2.0,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    if (code.length == 6) {
                      verifyOTP(context, widget.verificationId, code.trim());
                    }
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    verifyOTP(context, widget.verificationId,
                        verificationCode.trim());
                  },
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "This helps us verify every user in our app",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyText1,
                    ),
                  ),
                ),
                const Spacer(flex: 3),
                CustomTextButton(
                  fn: () {},
                  text: "Confirm",
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

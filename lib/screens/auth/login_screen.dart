import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tuko_app/components/auth_template.dart';
import 'package:tuko_app/components/custom_button.dart';
import 'package:tuko_app/components/custom_text_field.dart';
import 'package:tuko_app/core/app_assets.dart';
import 'package:tuko_app/core/app_color.dart';
import 'package:tuko_app/screens/auth/register_screen.dart';
import 'package:tuko_app/screens/home_screen.dart';
import 'package:tuko_app/utility/dialog_helper.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return AuthTemplate(
      formContent: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Tuko App",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: "Email",
              prefixIcon: Icons.email_outlined,
              controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required.";
                  }

                  String email = value.trim().toLowerCase();

                  RegExp strictEmailRegex = RegExp(r'^[\w-\.]+@(gmail)\.(com|net)$');

                  if (!strictEmailRegex.hasMatch(email)) {
                    if (!email.contains("@")) return "Missing '@' symbol.";
                    if (!email.contains("gmail")) return "Only @gmail.com accounts are allowed.";
                    if (!email.endsWith(".com") && !email.endsWith(".net")) return "Must end with .com or .net";

                    return "Invalid email format. Check your spelling.";
                  }

                  return null;
                }
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: "Password",
              prefixIcon: Icons.lock_outline,
              controller: _passwordController,
              validator: (value){
                RegExp regex = RegExp(r'^(?=.*?[A-Z|a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
                if(value ==null || value.isEmpty){
                  return "Password is required.";
                }
                if(!regex.hasMatch(value)){
                  return "Min. 6 chars: letters, numbers & symbols.";
                }else{
                  return null;
                }
              },
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 20),
            CustomButton(textbutton: "Login",onPressed: () async {
              if (_formKey.currentState!.validate()) {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim(),
                  );

                  // استخدمي pushReplacementNamed عشان ميرجعش للوجين بظهره
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);

                } on FirebaseAuthException catch (e) {
                  String message = "An error occurred";

                  if (e.code == 'invalid-credential') {
                    message = "Invalid email or password. Please check your data.";
                  }
                  else  if (e.code == 'user-not-found') {
                    message = "This email is not registered. Please go to the Sign Up page.";
                  }
                  else if (e.code == 'too-many-requests') {
                    message = "Too many failed attempts. Please try again later.";
                  }

                  DialogHelper.showErrorDialog(context, message);

                } catch (e) {
                  // لأي خطأ غير متوقع (زي فصل النت مثلاً)
                  DialogHelper.showErrorDialog(context, "Connection error or unexpected issue. Please try again.");
                }
              }
            },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Divider(color: AppColor.black)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "OR",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(child: Divider(color: AppColor.black)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppAssets.google),
                SizedBox(width: 30),
                SvgPicture.asset(AppAssets.faceBook),
              ],
            ),
            SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColor.black,
                  ),
                ),
                // SizedBox(width: 5),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterScreen.routeName);
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColor.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

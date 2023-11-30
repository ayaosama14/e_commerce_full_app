import 'package:e_commerce_app/cubit/change_password/change_password_cubit.dart';
import 'package:e_commerce_app/cubit/login/login_cubit.dart';
import 'package:e_commerce_app/cubit/login/login_states.dart';
import 'package:e_commerce_app/shared/constant.dart';
import 'package:e_commerce_app/shared/navigator.dart';
import 'package:e_commerce_app/views/home_view.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:e_commerce_app/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
  String? message;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: Form(
                key: myFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 60)),
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: const DecorationImage(
                            image: AssetImage(
                              ('assets/images/logo2.png'),
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    hSizedBox,
                    Text(
                      'Welcom to lafyuu',
                      style: boldTextStyle,
                    ),
                    Text(
                      'sign in to continue',
                      style: thinTextStyle,
                    ),
                    hSizedBox,
                    CustomTextField(
                        hint: 'Email',
                        prefixIcon: Icons.email_outlined,
                        myController: emailController,
                        validator: (value) {
                          if (value!.endsWith('@gmail.com')) {
                            return null;
                          }
                          // else if (EcommerceCubit.get(context)
                          //         .responseloginValue!
                          //         .data["status"] ==
                          //     false) {
                          //   return EcommerceCubit.get(context)
                          //       .responseloginValue!
                          //       .data["message"];
                          // }
                          else {
                            return 'Oops!should end with@gmail.com ';
                          }
                        }),
                    hSizedBox,
                    CustomTextField(
                      hint: 'Password',
                      prefixIcon: Icons.lock,
                      myController: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Oops! your password is empty';
                        } else {}
                        return null;
                      },
                      isSecure: ChangePasswordCubit.get(context).isSecure
                          ? true
                          : false,
                      suffixIcon: IconButton(
                        onPressed: () {
                          ChangePasswordCubit.get(context)
                              .changeSecurePassword(isSecure: false);
                        },
                        icon: ChangePasswordCubit.get(context).isSecure
                            ? const Icon(Icons.remove_red_eye_outlined)
                            : const Icon(Icons.format_color_reset_rounded),
                      ),
                    ),
                    hSizedBox,
                    Row(
                      children: [
                        Expanded(
                          child: buildElevated(
                              text: 'Sign in',
                              isnotRow: true,
                              onPressFunction: () {
                                setState(() {});
                                if (myFormKey.currentState!.validate()) {
                                  //check date = da postLoginData()
                                  LoginCubit.get(context).postLoginData(
                                      emailController.text,
                                      passwordController.text);
                                  if (LoginCubit.get(context)
                                          .responseloginValue!
                                          .data["status"] ==
                                      false) {
                                    message = LoginCubit.get(context)
                                        .responseloginValue!
                                        .data["message"];
                                    snackerBar(
                                        context: context,
                                        backgroundColor: Colors.redAccent);
                                  } else {
                                    message = LoginCubit.get(context)
                                        .responseloginValue!
                                        .data["message"];
                                    snackerBar(
                                        context: context,
                                        backgroundColor: Colors.greenAccent);

                                    navigate(context,  HomeView(productId: 40,));
                                  }
                                }
                              }),
                        ),
                      ],
                    ),
                    hSizedBox,
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text('OR'),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    hSizedBox,
                    buildElevated(
                      onPressFunction: () {},
                      text: 'Login with google',
                      isnotRow: false,
                      widgetA: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                ('assets/images/Google.png'),
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    hSizedBox,
                    buildElevated(
                      onPressFunction: () {},
                      text: 'Login with facebook',
                      isnotRow: false,
                      widgetA: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                ('assets/images/Facebook.png'),
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    hSizedBox,
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'ForgetPassword? ',
                        style: boldColorTextStyle,
                      ),
                    ),
                    hSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have account?',
                          style: thinTextStyle,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Register',
                            style: boldColorTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

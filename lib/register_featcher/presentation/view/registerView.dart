import 'package:e_commerce_app/Login_featcher/presentation/helper_mehods/build_elevated_button.dart';
import 'package:e_commerce_app/Login_featcher/presentation/view/login_view.dart';
import 'package:e_commerce_app/home_featcher/presentation/views/home_view.dart';
import 'package:e_commerce_app/register_featcher/domain/cubit/register_cubit.dart';
import 'package:e_commerce_app/register_featcher/domain/cubit/register_states.dart';
import 'package:e_commerce_app/register_featcher/presentation/helper_methods/build_snackbar.dart';
import 'package:e_commerce_app/register_featcher/presentation/widgets/custom_text_field.dart';
import 'package:e_commerce_app/shared/constant.dart';
import 'package:e_commerce_app/shared/navigator.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController personController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterStates>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: Form(
                key: myFormKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        'Let\'s get started',
                        style: boldTextStyle,
                      ),
                      Text(
                        'creat a new account',
                        style: thinTextStyle,
                      ),
                      hSizedBox,
                      CustomTextField(
                          hint: 'Full name',
                          prefixIcon: Icons.person_4_rounded,
                          myController: personController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Oops! your name is empty';
                            } else {}
                            return null;
                          }),
                      hSizedBox,
                      CustomTextField(
                        hint: 'Email',
                        prefixIcon: Icons.email,
                        myController: emailController,
                        validator: (value) {
                          if (value!.endsWith('@gmail.com')) {
                            return null;
                          } else {
                            return 'Should contain @gmail.com ';
                          }
                        },
                      ),
                      hSizedBox,
                      CustomTextField(
                          hint: 'phone number',
                          prefixIcon: Icons.phone,
                          myController: phoneController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Oops! your phone is empty';
                            } else {}
                            return null;
                          }),
                      hSizedBox,
                      CustomTextField(
                          hint: 'Password',
                          prefixIcon: Icons.lock,
                          isSecure: true,
                          myController: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Oops! your password is empty';
                            } else {}
                            return null;
                          }),
                      hSizedBox,
                      CustomTextField(
                          hint: 'Password Again',
                          prefixIcon: Icons.lock,
                          isSecure: true,
                          myController: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Oops! your password is empty';
                            } else {}
                            return null;
                          }),
                      hSizedBox,
                      Row(children: [
                        Expanded(
                          child: buildElevated(
                            text: 'Sign up',
                            isnotRow: true,
                            onPressFunction: () async {
                              setState(() {});
                              //post data to apis
                              if (myFormKey.currentState!.validate()) {
                                RegisterCubit.get(context).postRegisterData(
                                    personController.text,
                                    phoneController.text,
                                    emailController.text,
                                    passwordController.text);

                                if (RegisterCubit.get(context)
                                        .responseRegisterValue!
                                        .data["status"] ==
                                    true) {
                                  buildSnackerBar(
                                      context: context,
                                      backgroundColor: Colors.greenAccent);
                                  navigate(
                                      context,
                                      HomeView(
                                        productId: 40,
                                      ));
                                } else {
                                  buildSnackerBar(
                                      context: context,
                                      backgroundColor: Colors.redAccent);
                                }
                              }
                            },
                          ),
                        )
                      ]),
                      hSizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'have an account ? ',
                            style: thinTextStyle,
                          ),
                          InkWell(
                            onTap: () {
                              navigate(context, const LoginView());
                            },
                            child: Text(
                              'Sign in',
                              style: boldColorTextStyle,
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}

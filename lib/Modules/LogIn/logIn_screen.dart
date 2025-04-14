import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Shared/Styles/Colors.dart';

import '../../Shared/Components/components.dart';
import '../Register/register_screen.dart';
import 'cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
 final  formKey = GlobalKey<FormState>();
 LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {

          if (state is LoginSuccess){
            if (state.login.status == true){
              print(state.login.message);
              print(state.login.data!.token);
            }else{
              print(state.login.message);
            }
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Login here',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: defColor,
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text('Welcome back you have been missed!',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 50,),
                    
                        defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            textLabel: 'Email',
                            prefix: Icons.email_rounded,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'email address must not be empty';
                              }
                              return null;
                            }),
                    
                        SizedBox(height: 25,),
                    
                        defaultFormField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            textLabel: 'Password',
                            isPassword: cubit.isPassword,
                            prefix: Icons.lock_rounded,
                            suffixIcon: cubit.suffix,
                            suffixPressed: () {
                              cubit.changePasswordVisibility();
                            },
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'password must not be empty';
                              }
                              return null;
                            }
                        ),
                    
                        SizedBox(height: 35,),
                    
                        ConditionalBuilder(
                          condition: state is! LoginLoading,
                          builder: (context) => defaultButton(
                            function: (){
                              FocusScope.of(context).unfocus();
                              if (formKey.currentState!.validate())
                              {
                                LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            width: double.infinity,
                            height: 50,
                            text: 'LogIn',
                            textColor: Colors.white,
                            buttonColor: defColor,
                            radius: 20,

                          ), fallback: (BuildContext context) => Center(child: CircularProgressIndicator(color: defColor,)) ,
                    
                        ),
                    
                    
                    
                        SizedBox(height: 10,),
                    
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t have an account?',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                )
                            ),
                            defaultTextButton(
                              text: 'Register',
                              textColor: defColor,
                              fontSize: 15,
                              function: () {
                                navigatePush(context, RegisterScreen());
                              },
                            )
                          ],
                        ),
                        SizedBox(height: 150,),
                    
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

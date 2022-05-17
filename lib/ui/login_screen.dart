import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplebloc/bloc/login/login_bloc.dart';
import 'package:simplebloc/ui/home_screen.dart';
import 'package:simplebloc/widget/btm_sheet_dialog.dart';
import 'package:simplebloc/widget/loading_dialog.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final devHeight = MediaQuery.of(context).size.height;
    final devWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login BloC Screen'),
        ),
        body: BlocConsumer<LoginBloc, LoginState>(builder: (context, state) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: devWidth * 0.7,
                    height: devHeight * 0.06,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.black12,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.account_circle),
                          border: InputBorder.none,
                          isCollapsed: true,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: devWidth * 0.7,
                    height: devHeight * 0.06,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.black12,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          border: InputBorder.none,
                          isCollapsed: true,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<LoginBloc>(context).add(
                        Login(
                          usernameController.text,
                          passwordController.text,
                        ),
                      );
                    },
                    child: Text(
                      'Login',
                    ),
                  ),
                ],
              ),
            ),
          );
        }, listener: (context, state) {
          if (state is LoadingState) {
            LoadingDialog(context);
          } else if (state is LoginSuccessState) {
            Future.delayed(Duration(seconds: 2), () {
              Navigator.pop(context);
              CustomBottomSheet(context, state.status);
            }).then((_) {
              Future.delayed(Duration(seconds: 2), () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomeScreen(),
                    ),
                    (route) => false);
              });
            });
          } else if (state is LoginFailureState) {
            Future.delayed(Duration(seconds: 2), () {
              Navigator.pop(context);
              CustomBottomSheet(context, state.status);
            }).then((_) {
              Future.delayed(Duration(seconds: 2), () {
                Navigator.pop(context);
              });
            });
          }
        }),
      ),
    );
  }
}

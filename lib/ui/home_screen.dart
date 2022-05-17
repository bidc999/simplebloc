import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplebloc/bloc/login/login_bloc.dart';
import 'package:simplebloc/ui/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Screen',
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
              if (state is LoginSuccessState) {
                return Column(
                  children: [
                    Text('Username : ' + state.username),
                    Text('Password : ' + state.password),
                  ],
                );
              }
              return Container();
            }),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LoginScreen(),
                      ),
                      (route) => false);
                },
                child: Text('Logout')),
          ],
        ),
      ),
    );
  }
}

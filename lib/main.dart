import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:simplebloc/bloc/login/login_bloc.dart';
import 'package:simplebloc/ui/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Simple BloC',
        home: LoginScreen(),
      ),
    );
  }
}

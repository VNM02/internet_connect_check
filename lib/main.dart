import 'package:connect/blocs/internet_bloc/internet_bloc.dart';
import 'package:connect/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> InternetBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Home(),
      ),
    );
  }
}
// Now with this the InternetBloc will be available anywhere in the MaterialApp
// Blocprovider will ensure that its child i.e MaterialApp will have access to the InternetBloc
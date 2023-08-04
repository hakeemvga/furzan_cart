import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furzan_app/Screens/LoginScreen.dart';
import 'package:furzan_app/Screens/splash_screen.dart';
import 'package:furzan_app/bloc/LoginBloc/user_data_bloc.dart';
import 'package:furzan_app/bloc/PasswordBloc/password_bloc.dart';
import 'package:furzan_app/bloc/ProductBloc/product_bloc.dart';

const String baseUrl = "http://192.168.1.58:3010/api";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => UserDataBloc()),
            BlocProvider(create: (context)=>PasswordBloc()),
            BlocProvider(create: (context)=>ProductBloc()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const SplashScreen(),
          ),
        );
      },
    );
  }
}

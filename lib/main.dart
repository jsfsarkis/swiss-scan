import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiss_scan/cubits/url_launcher/url_launcher_cubit.dart';
import 'package:swiss_scan/cubits/validate_code_cubit/validate_code_cubit.dart';
import 'package:swiss_scan/ui/screens/tab_bar_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UrlLauncherCubit>(create: (context) => UrlLauncherCubit()),
        BlocProvider<ValidateCodeCubit>(create: (context) => ValidateCodeCubit()),
      ],
      child: const MaterialApp(
        title: 'Swiss Scan',
        home: TabBarScreen(),
      ),
    );
  }
}

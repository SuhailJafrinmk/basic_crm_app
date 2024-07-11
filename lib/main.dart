import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crm_app/features/homescreen/bloc/home_screen_bloc.dart';
import 'package:crm_app/features/homescreen/cubit/homescreen_cubit.dart';
import 'package:crm_app/features/homescreen/presentation/home_page.dart';
import 'package:crm_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) =>
            HomeScreenBloc(FirebaseFirestore.instance)..add(FetchContacts()),
      ),
      BlocProvider(
        create: (context) => HomescreenCubit(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: HomePage());
  }
}

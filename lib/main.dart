import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/app_theme.dart';
import 'data/database/db_config.dart';
import 'data/database/entity/month_task_entity.dart';
import 'data/database/entity/task_entity.dart';
import 'logic/home/cubit/home_cubit.dart';
import 'presenter/home/HomeScreen.dart';

void main() async {
  Hive.registerAdapter(MonthTasksEntiryAdapter());
  Hive.registerAdapter(TaskEntityAdapter());

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await DbConfig.getInstance.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale(
              'fa', ''), // English, no country code // Spanish, no country code
        ],
        title: 'Flutter Demo',
        theme: app_style,
        home: HomeScreen(),
      ),
    );
  }
}

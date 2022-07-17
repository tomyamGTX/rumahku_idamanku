import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:rumah_idamanku/portfolios/portfolio3/Portfolio3Screen.dart';
import 'package:rumah_idamanku/portfolios/providers/house.provider.dart';

import 'firebase_options.dart';
import 'locale/Languages.dart';
import 'main/store/AppStore.dart';
import 'main/utils/AppConstant.dart';
import 'main/utils/AppDataProvider.dart';

AppStore appStore = AppStore();
BaseLanguage? language;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize(aLocaleLanguageList: languageList());

  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));
  await appStore.setLanguage(
      getStringAsync(SELECTED_LANGUAGE_CODE, defaultValue: defaultLanguage));

  defaultRadius = 10;
  defaultToastGravityGlobal = ToastGravity.BOTTOM;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HouseProvider>.value(value: HouseProvider()),
        ChangeNotifierProvider<HouseProvider>(
            create: (context) => HouseProvider())
      ],
      child: MaterialApp(
        title: 'Rumah Idamanku',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const Portfolio3Screen(),
      ),
    );
  }
}

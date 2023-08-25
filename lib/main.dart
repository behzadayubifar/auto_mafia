import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'package:provider/provider.dart';

import '../providers/settings.dart';
import '../screens/game_screen.dart';
import '../screens/naming_screen.dart';
import './data/roles.dart';
import './screens/home.dart';
import './providers/player_data.dart';
import './screens/show_roles_screen.dart';
import './screens/Days/day_screen.dart';
import './screens/Days/three_remained.dart';
import './screens/Nights/night_screen.dart';
import './providers/themes.dart';
import './screens/role_panels/nostradamous.dart';
import './screens/role_panels/matador.dart';
import './screens/role_panels/leon.dart';
import './screens/role_panels/kane.dart';
import './screens/role_panels/doctor.dart';
import 'screens/role_panels/citizen.dart';
import './screens/role_panels/konstantin.dart';
import './screens/role_panels/god_father.dart';

import 'data/local/db/app_db.dart';
import 'providers/db_provider.dart';
import 'screens/nights/timer_night.dart';
import './screens/nights/blocked_screen.dart';
import './screens/Days/victory.dart';

main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    Provider.value(value: AppDb()),
    ChangeNotifierProvider(create: (_) => DayNightThemeManager()),
    ChangeNotifierProvider(create: (_) => Settings()),
    ChangeNotifierProvider(create: (_) => Roles()),
    ChangeNotifierProvider(create: (_) => PlayerData()),
    // ChangeNotifierProvider(create: (_) => AppDbProvider()),
    ChangeNotifierProxyProvider<AppDb, AppDbProvider>(
        create: (context) => AppDbProvider(),
        update: (context, db, notifier) => notifier!
          ..initAppDb(db)
          ..getPlayersListFuture()),
    // // Add the AppDbProvider
    // Provider<AppDb>(
    //   create: (_) => AppDb(),
    //   dispose: (_, db) => db.close(),
    // ),
  ], child: const GodFatherApp()));
}

class GodFatherApp extends StatefulWidget {
  const GodFatherApp({super.key});

  @override
  State<GodFatherApp> createState() => _GodFatherAppState();
}

class _GodFatherAppState extends State<GodFatherApp> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        title: 'God Father',
        // theme: DayNightThemeManager().currentTheme,
        theme: ThemeData.dark(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        home: Home(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/game': (context) => GameScreen(),
          '/naming': (context) => NamingScreen(),
          '/show-roles': (context) => const ShowRolesScreen(),
          '/day': (context) => const DayScreen(),
          '/three-remained': (context) => const ThreeRemained(),
          '/night': (context) => const NightScreen(),
          '/nostradamous': (context) => const Nostradamous(),
          '/matador': (context) => const Matador(),
          '/leon': (context) => const Leon(),
          '/kane': (context) => const Kane(),
          '/doctor': (context) => const Doctor(),
          '/citizen': (context) => const Citizen(),
          '/konstantin': (context) => const Konstantin(),
          '/god-father': (context) => const GodFather(),
          '/blocked': (context) => const BlockedScreen(),
          '/timer_night': (context) => const TimerNight(),
          '/victory': (context) => const Victory(),
          // Add more routes for other screens if needed
        },
      ),
    );
  }
}

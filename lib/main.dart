import 'package:flutter/material.dart';
import 'src/shared/storage/hive_config.dart';
import 'src/routes/app_routes.dart';
import 'src/modules/initial/page/initial_page.dart';
import 'src/modules/home/page/home_page.dart';
import 'src/modules/history/page/history_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FastLocation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      initialRoute: AppRoutes.initial,
      routes: {
        AppRoutes.initial: (c) => const InitialPage(),
        AppRoutes.home: (c) => const HomePage(),
        AppRoutes.history: (c) => const HistoryPage(),
      },
    );
  }
}

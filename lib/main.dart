import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samba_pos_test/providers/yaml_service.dart';
import 'package:samba_pos_test/views/menu_page.dart';

void main() {
  // YamlService.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => YamlService(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

final GlobalKey appKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // YamlService.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: appKey,
        home: MenuPage());
  }
}

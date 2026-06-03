import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart'; // Elimina el # de la URLs del navegador
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

// comentaro de erik xdxd
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'H2O Chimal',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      // Conectamos la configuración de go_router aquí
      routerConfig: AppRouter.router,
    );
  }
}

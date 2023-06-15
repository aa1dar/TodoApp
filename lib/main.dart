import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/navigation/navigation_logger.dart';
import 'package:todo_app/navigation/navigation_routes.dart';
import 'package:todo_app/providers/logger_provider.dart';
import 'package:todo_app/utils/style/app_themes.dart';

void main() {
  runApp(ProviderScope(observers: [LoggerProvider()], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: NavigationRouteName.home,
        routes: NavigationRoutesBuilder.routes,
        navigatorObservers: [NavigationLogger()],
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        darkTheme: AppTheme.darkTheme(),
        theme: AppTheme.lightTheme());
  }
}

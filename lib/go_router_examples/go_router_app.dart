import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app_router.dart';

void main() {
  setPathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(const GoRouterApp());
}

class GoRouterApp extends StatelessWidget {
  const GoRouterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router(),
    );
  }
}

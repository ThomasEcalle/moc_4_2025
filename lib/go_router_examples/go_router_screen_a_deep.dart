import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterScreenADeep extends StatelessWidget {
  static const String routeName = 'screenADeep';

  static Future<Object?> push(BuildContext context) async {
    return context.pushNamed(routeName);
  }

  static Future<void> go(BuildContext context) async {
    return context.goNamed(routeName);
  }

  const GoRouterScreenADeep({super.key});

  @override
  Widget build(BuildContext context) {
    print('GoRouterScreenADeep build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Router Screen A Deep'),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Go back'),
          ),
        ),
      ),
    );
  }
}

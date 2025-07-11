import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'go_router_screen_a_deep.dart';

class GoRouterScreenA extends StatelessWidget {
  static const String routeName = 'screenA';

  static Future<void> push(BuildContext context) async {
    await context.pushNamed(routeName);
  }

  const GoRouterScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    print('GoRouterScreenA build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Router Screen A'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  GoRouterScreenADeep.push(context);
                },
                child: const Text('Go to Screen A Deep'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('Go back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

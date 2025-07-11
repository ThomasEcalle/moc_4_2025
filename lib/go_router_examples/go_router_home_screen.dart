import 'package:flutter/material.dart';

import 'go_router_screen_a.dart';
import 'go_router_screen_a_deep.dart';
import 'go_router_screen_b.dart';
import 'go_router_screen_c.dart';

class GoRouterHomeScreen extends StatelessWidget {
  const GoRouterHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Router Home Screen'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _pushScreenA(context),
                child: const Text('Push Screen A'),
              ),
              ElevatedButton(
                onPressed: () => _pushScreenADeep(context),
                child: const Text('Push Screen A Deep'),
              ),
              ElevatedButton(
                onPressed: () => _goToScreenADeep(context),
                child: const Text('Go to Screen A Deep'),
              ),
              ElevatedButton(
                onPressed: () => _pushScreenB(context, id: '123'),
                child: const Text('Push Screen B with ID'),
              ),
              ElevatedButton(
                onPressed: () => _goToScreenC(context, id: '456'),
                child: const Text('Go to Screen C with ID'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pushScreenA(BuildContext context) {
    GoRouterScreenA.push(context);
  }

  void _pushScreenADeep(BuildContext context) {
    GoRouterScreenADeep.push(context);
  }

  void _goToScreenADeep(BuildContext context) {
    GoRouterScreenADeep.go(context);
  }

  void _pushScreenB(BuildContext context, {required String id}) {
    GoRouterScreenB.push(context, id: id);
  }

  void _goToScreenC(BuildContext context, {required String id}) {
    GoRouterScreenC.go(context, id: id);
  }
}

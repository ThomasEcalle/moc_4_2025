import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterScreenB extends StatelessWidget {
  static const String routeName = 'screenB';

  static Future<void> push(BuildContext context, {required String id}) async {
    await context.pushNamed(routeName, extra: id);
  }

  const GoRouterScreenB({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    print('GoRouterScreenB build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Router Screen B'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Screen B ID: $id'),
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

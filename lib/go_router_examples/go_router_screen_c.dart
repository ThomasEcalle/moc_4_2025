import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterScreenC extends StatelessWidget {
  static const String routePath = '/screenC/:id';
  static const String routeName = 'screenC';

  static Future<void> go(BuildContext context, {required String id}) async {
    context.goNamed(routeName, pathParameters: {'id': id});
  }

  const GoRouterScreenC({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    print('GoRouterScreenB build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Router Screen C'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Screen C ID: $id'),
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

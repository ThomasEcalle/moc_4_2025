import 'package:go_router/go_router.dart';

import 'go_router_home_screen.dart';
import 'go_router_screen_a.dart';
import 'go_router_screen_a_deep.dart';
import 'go_router_screen_b.dart';
import 'go_router_screen_c.dart';
import 'page_not_found.dart';

class AppRouter {
  static GoRouter? _instance;

  static GoRouter router() {
    return _instance ??= GoRouter(
      initialLocation: '/',
      errorBuilder: (context, state) => const PageNotFound(),
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) {
            return GoRouterHomeScreen();
          },
          routes: [
            GoRoute(
              path: 'a',
              name: GoRouterScreenA.routeName,
              builder: (context, state) => const GoRouterScreenA(),
              routes: [
                GoRoute(
                  path: 'adeep',
                  name: GoRouterScreenADeep.routeName,
                  builder: (context, state) {
                    return const GoRouterScreenADeep();
                  },
                ),
              ],
            ),
            GoRoute(
              path: 'b',
              name: GoRouterScreenB.routeName,
              builder: (context, state) {
                final extra = state.extra;
                if (extra is! String) return const PageNotFound();
                return GoRouterScreenB(id: extra);
              },
            ),
            GoRoute(
              path: 'c/:id',
              name: GoRouterScreenC.routeName,
              builder: (context, state) {
                final id = state.pathParameters['id'];
                if (id == null) return const PageNotFound();
                return GoRouterScreenC(id: id);
              },
            ),
          ],
        ),
      ],
      redirect: (context, state) {

        return null;
      }
    );
  }
}

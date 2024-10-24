import "package:kwork_clone/src/core/constants/all_library.dart";



final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell-key');

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell-key');
late StatefulNavigationShell navigationShell2;

@immutable
final class AppRouter {
  const AppRouter._();

  static final GoRouter router = GoRouter(
    navigatorKey: appNavigatorKey,
    initialLocation: AppRouteName.splash,
    routes: [
      GoRoute(path: AppRouteName.splash, builder: (context, state) => const Splash()),

      GoRoute(
        path: AppRouteName.welcomePage,
        builder: (context, state) => Scaffold(
          body: Center(
            child: CustomTextWidget("OnBoarding", textColor: context.appTheme.secondary),
          ),
        ),
      ),

      GoRoute(
        path: AppRouteName.login,
        builder: (context, state) => const Login(),
        routes: [
          GoRoute(path: AppRouteName.register, builder: (context, state) => const Register()),
          GoRoute(path: AppRouteName.forgetPassword, builder: (context, state) => const ForgotPassword()),
        ],
      ),

      /// Patient Shell Route
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: appNavigatorKey,
        builder: (context, state, navigationShell) {
          navigationShell2 = navigationShell;
          return HomeNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorKey,
            routes: [
              GoRoute(
                path: AppRouteName.catalog,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Catalog(),
                ),
                routes: [
                  SubRoutes.categoryDetail,
                  SubRoutes.catalogDetail,
                  SubRoutes.catalogItemInfo,
                  GoRoute(
                    parentNavigatorKey: appNavigatorKey,
                    path: AppRouteName.favorite,
                    pageBuilder: (BuildContext context, GoRouterState state) {
                      return MaterialPage(child: Favorite(navigationShell: navigationShell2));
                    },
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouteName.chats,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: Chat(navigationShell: navigationShell2), // Pass navigationShell here
                ),
                routes: [SubRoutes.support, SubRoutes.search],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouteName.orders,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: Order(navigationShell: navigationShell2),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouteName.notification,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: NotificationScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouteName.more,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: MoreScreen(),
                ),
                routes: [
                  SubRoutes.myKWorks,
                  SubRoutes.viewed,
                  SubRoutes.profile,
                  SubRoutes.setting,
                  SubRoutes.catalogItemInfo,
                  SubRoutes.blockedUsers,
                  SubRoutes.support,
                  SubRoutes.transactions,
                  GoRoute(
                    parentNavigatorKey: appNavigatorKey,
                    path: AppRouteName.favorite,
                    pageBuilder: (BuildContext context, GoRouterState state) {
                      return MaterialPage(child: Favorite(navigationShell: navigationShell2));
                    },
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

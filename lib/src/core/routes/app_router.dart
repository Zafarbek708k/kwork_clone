import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:kwork_clone/src/core/constants/context_extension.dart";
import "package:kwork_clone/src/core/routes/sub_routes.dart";
import "package:kwork_clone/src/core/widgets/text_widget.dart";
import "package:kwork_clone/src/feature/auth/view/pages/forgot_password.dart";
import "package:kwork_clone/src/feature/auth/view/pages/login.dart";
import "package:kwork_clone/src/feature/auth/view/pages/register.dart";
import "package:kwork_clone/src/feature/auth/view/pages/splash.dart";
import "package:kwork_clone/src/feature/catalog/view/pages/catalog.dart";
import "package:kwork_clone/src/feature/chats/view/pages/chat.dart";
import "package:kwork_clone/src/feature/more/view/pages/more.dart";
import "package:kwork_clone/src/feature/notification/view/pages/notification.dart";
import "package:kwork_clone/src/feature/orders/view/pages/order.dart";
import "../../feature/catalog/view/pages/favorite.dart";
import "../../feature/home_navigation.dart";
import "app_route_name.dart";

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
                  routes: [SubRoutes.support, SubRoutes.search]),
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

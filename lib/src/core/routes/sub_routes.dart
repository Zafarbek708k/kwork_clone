import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kwork_clone/src/feature/chats/view/pages/search.dart';
import 'package:kwork_clone/src/feature/chats/view/pages/support.dart';
import 'package:kwork_clone/src/feature/more/view/pages/my_kworks.dart';

import '../../feature/catalog/view/pages/catalog_detail.dart';
import '../../feature/catalog/view/pages/category_detail.dart';
import '../../feature/catalog/view/pages/favorite.dart';
import 'app_route_name.dart';
import 'app_router.dart';

@immutable
class SubRoutes{
  static final GoRoute catalogDetail = GoRoute(
      parentNavigatorKey: appNavigatorKey,
      path: AppRouteName.catalogDetail,
      pageBuilder: (BuildContext context, GoRouterState state) => const MaterialPage(
        // child: Modules(argument: state.extra as Fan),
        child: CatalogDetail(),
      ),
      routes: [categoryDetail]);

  static final GoRoute categoryDetail = GoRoute(
    parentNavigatorKey: appNavigatorKey,
    path: AppRouteName.categoryDetail,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return const MaterialPage(child: CategoryDetail());
      // child: ModuleLessons(argument: state.extra! as Fan),
    },
    routes: const [],
  );

  // static final GoRoute favorite = GoRoute(
  //   parentNavigatorKey: appNavigatorKey,
  //   path: AppRouteName.favorite,
  //   pageBuilder: (BuildContext context, GoRouterState state) {
  //     return const MaterialPage(child: Favorite(navigationShell: navigationShell2));
  //   },
  // );

  static final GoRoute support = GoRoute(
    parentNavigatorKey: appNavigatorKey,
    path: AppRouteName.support,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return const MaterialPage(child: Support());
    },
    routes: const [],
  );
  static final GoRoute search = GoRoute(
    parentNavigatorKey: appNavigatorKey,
    path: AppRouteName.search,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return const MaterialPage(child: Search());
    },
    routes: const [],
  );


  /// more sub routes
  static final GoRoute myKWorks = GoRoute(
    parentNavigatorKey: appNavigatorKey,
    path: AppRouteName.myKWorks,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return const MaterialPage(child: MyKworks());
    },
  );



}
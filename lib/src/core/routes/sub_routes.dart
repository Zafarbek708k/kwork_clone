import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kwork_clone/src/feature/catalog/view/pages/catalog_item_info.dart';
import 'package:kwork_clone/src/feature/chats/view/pages/search.dart';
import 'package:kwork_clone/src/feature/chats/view/pages/support.dart';
import 'package:kwork_clone/src/feature/more/view/pages/my_kworks.dart';
import 'package:kwork_clone/src/feature/more/view/pages/profile.dart';
import 'package:kwork_clone/src/feature/more/view/pages/setting.dart';
import 'package:kwork_clone/src/feature/more/view/pages/viewed.dart';

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
      routes: [categoryDetail, catalogItemInfo]);

  static final GoRoute categoryDetail = GoRoute(
    parentNavigatorKey: appNavigatorKey,
    path: AppRouteName.categoryDetail,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return const MaterialPage(child: CategoryDetail());
      // child: ModuleLessons(argument: state.extra! as Fan),
    },
    routes: const [],
  );

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
  static final GoRoute viewed = GoRoute(
    parentNavigatorKey: appNavigatorKey,
    path: AppRouteName.viewed,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return const MaterialPage(child: Viewed());
    },
    routes: [catalogItemInfo]
  );
  static final GoRoute profile = GoRoute(
    parentNavigatorKey: appNavigatorKey,
    path: AppRouteName.profile,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return const MaterialPage(child: Profile());
    },
  );
  static final GoRoute setting = GoRoute(
    parentNavigatorKey: appNavigatorKey,
    path: AppRouteName.setting,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return const MaterialPage(child: Setting());
    },
  );
  static final GoRoute catalogItemInfo = GoRoute(
    parentNavigatorKey: appNavigatorKey,
    path: AppRouteName.catalogItemInfo,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return const MaterialPage(child: CatalogItemInfo());
    },
  );



}
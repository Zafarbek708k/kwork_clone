import "package:kwork_clone/src/core/constants/all_library.dart";

import "../../feature/more/view/pages/setting.dart";




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
  static final GoRoute blockedUsers = GoRoute(
    parentNavigatorKey: appNavigatorKey,
    path: AppRouteName.blockedUsers,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return const MaterialPage(child: BlockedUsers());
    },
  );



}
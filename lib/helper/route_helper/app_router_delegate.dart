import 'package:navigator_2_point_0/values/app_global/app_exports.dart';

class HomeRouterDelegate extends RouterDelegate<HomeRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<HomeRoutePath> {
  String? pathName;
  bool isError = false;

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  HomeRoutePath get currentConfiguration {
    if (isError) return HomeRoutePath.unKnown();

    if (pathName == null) return HomeRoutePath.home();

    return HomeRoutePath.otherPage(pathName);
  }

  void onTapped(String path) {
    pathName = path;
    debugPrint(pathName);
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        pages: [
          MaterialPage(
            key: const ValueKey('HomePage'),
            child: HomePage(
              onTapped: (String path) {
                pathName = path;
                debugPrint(pathName);
                notifyListeners();
              },
              child: null,
            ),
          ),
          if (isError)
            const MaterialPage(
              key: ValueKey('UnknownPage'),
              child: UnknownPage(),
            )
          else if (pathName != null)
            MaterialPage(
              key: ValueKey(pathName),
              child: const OtherPage(),
            ),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) return false;

          pathName = null;
          isError = false;
          notifyListeners();

          return true;
        });
  }

  @override
  Future<void> setNewRoutePath(HomeRoutePath configuration) async {
    if (configuration.isUnknown) {
      pathName = null;
      isError = true;
      return;
    }

    if (configuration.isOtherPage) {
      if (configuration.pathName != null) {
        pathName = configuration.pathName;
        isError = false;
        return;
      } else {
        isError = true;
        return;
      }
    } else {
      pathName = null;
    }
  }
}

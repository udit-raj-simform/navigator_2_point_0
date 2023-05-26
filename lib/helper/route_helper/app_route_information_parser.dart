import 'package:navigator_2_point_0/values/app_global/app_exports.dart';

class HomeRouteInformationParser extends RouteInformationParser<HomeRoutePath> {
  @override
  Future<HomeRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) {
      return HomeRoutePath.home();
    }

    if (uri.pathSegments.length == 1) {
      final pathName = uri.pathSegments.elementAt(0).toString();
      if (pathName == "") return HomeRoutePath.unKnown();
      return HomeRoutePath.otherPage(pathName);
    }

    return HomeRoutePath.unKnown();
  }

  @override
  RouteInformation? restoreRouteInformation(HomeRoutePath configuration) {
    if (configuration.isUnknown) {
      return const RouteInformation(location: '/error');
    }
    if (configuration.isHomePage) return const RouteInformation(location: '/');
    if (configuration.isOtherPage) {
      return RouteInformation(location: '/${configuration.pathName}');
    }

    return null;
  }
}

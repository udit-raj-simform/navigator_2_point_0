import 'package:navigator_2_point_0/values/app_global/app_exports.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.firstPage:
        return _GeneratePageRoute(
            widget: FirstPage(), routeName: settings.name!);
      case AppRoutesName.secondPage:
        return _GeneratePageRoute(
            widget: const SecondPage(), routeName: settings.name!);
      default:
        return _GeneratePageRoute(
            widget: FirstPage(), routeName: settings.name!);
    }
  }
}

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final String routeName;

  _GeneratePageRoute({required this.widget, required this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              textDirection: TextDirection.rtl,
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
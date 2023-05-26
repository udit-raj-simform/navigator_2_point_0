import 'package:navigator_2_point_0/values/app_global/app_exports.dart';

void main() {
  // runApp(const MyNavigatorOneApp());
  runApp(const MyNavigatorTwoApp());
}

class MyNavigatorOneApp extends StatelessWidget {
  const MyNavigatorOneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => HomePage(child: child!),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: AppRoutesName.firstPage,
    );
  }
}

class HomePage extends StatelessWidget {
  final Widget? child;

  const HomePage({super.key, this.child, Function(String path)? onTapped});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: child ?? FirstPage()));
  }
}

class MyNavigatorTwoApp extends StatelessWidget {
  const MyNavigatorTwoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Flutter Navigation 2.0",
      routerDelegate: HomeRouterDelegate(),
      routeInformationParser: HomeRouteInformationParser(),
    );
  }
}

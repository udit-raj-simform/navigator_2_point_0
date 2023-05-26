import 'package:navigator_2_point_0/values/app_global/app_exports.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("SECOND PAGE"),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Navigator.pushNamed(context, RoutesName.SECOND_PAGE);
              },
              child: const Text("NAVIGATE")),
        ],
      ),
    );
  }
}

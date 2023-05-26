import 'package:navigator_2_point_0/values/app_global/app_exports.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("FIRST PAGE"),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutesName.secondPage);
              },
              child: const Text("NAVIGATE")),
        ],
      ),
    );
  }
}

import 'package:navigator_2_point_0/values/app_global/app_exports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("HOME PAGE"),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const OtherPage()));
              },
              child: const Text("NAVIGATE")),
        ],
      ),
    );
  }
}

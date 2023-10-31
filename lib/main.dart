import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ripple Project",
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: const MyHomeWidget(),
    );
  }
}

class MyHomeWidget extends StatefulWidget {
  const MyHomeWidget({super.key});

  @override
  State<MyHomeWidget> createState() => _MyHomeWidgetState();
}

class _MyHomeWidgetState extends State<MyHomeWidget>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _animationController;

  var listRadius = [150.0, 200.0, 250.0, 300.0, 350.0];

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 4), lowerBound: 0.5);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Ripple Animation"),
      ),
      body: Center(
        child: Stack(alignment: Alignment.center, children: [
          buildMyContainer(listRadius[0]),
          buildMyContainer(listRadius[1]),
          buildMyContainer(listRadius[2]),
          buildMyContainer(listRadius[3]),
          buildMyContainer(listRadius[4]),
          const Icon(
            Icons.add_call,
            color: Colors.white,
          ),
        ]),
      ),
    );
  }

  Widget buildMyContainer(radius) {
    return Container(
      height: radius * _animation.value,
      width: radius * _animation.value,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red.withOpacity(1.0 - _animation.value)),
    );
  }
}

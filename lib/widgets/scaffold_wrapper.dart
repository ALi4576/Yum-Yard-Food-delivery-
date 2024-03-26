import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({
    super.key,
    required this.child,
    this.bottomNavigationBar,
    this.appBar,
  });

  final Widget child;
  final Widget? bottomNavigationBar;
  final AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: MediaQuery.of(context).size.height *
                  (bottomNavigationBar == null ? 0.86 : 0.8),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

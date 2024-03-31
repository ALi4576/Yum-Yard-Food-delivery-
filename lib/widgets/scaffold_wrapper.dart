import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({
    super.key,
    required this.child,
    this.bottomNavigationBar,
    this.appBar,
    this.safeArea = true,
  });

  final Widget child;
  final Widget? bottomNavigationBar;
  final AppBar? appBar;
  final bool safeArea;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(
        top: safeArea,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: !safeArea ? 0 : 10),
            child: SizedBox(
              height: !safeArea
                  ? null
                  : MediaQuery.of(context).size.height *
                      (bottomNavigationBar == null ? 0.86 : 0.8),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

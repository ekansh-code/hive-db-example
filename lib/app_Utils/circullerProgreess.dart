import 'package:flutter/material.dart';
class CircularProgress extends StatelessWidget {

  CircularProgress();
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(
            Colors.amber,
          ),
        ),
      ),
    );
  }
}

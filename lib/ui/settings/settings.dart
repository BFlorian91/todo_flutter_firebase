import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 30.0,
              right: 10.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.cancel,
                    color: Colors.pink,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
            const Center(
              child: Text(
                'Settings page',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

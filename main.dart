import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: NewPage(),
  ));
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF222222), // Background color is set to #222222
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Transform.translate(
                    offset: Offset(0, -170), // Adjust position here
                    child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001) // Perspective
                        ..rotateX(30 * 3.1415926535 / 180) // Convert degrees to radians
                        ..scale(1.1),
                      alignment: FractionalOffset.center,
                      child: Container(
                        height: 180,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 248, 248, 248).withOpacity(0.5),
                              blurRadius: 15,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, 150), // Move the seats
                    child: Column(
                      children: [
                        for (var i = 0; i < 11; i++)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                String.fromCharCode(65 + i), // Convert ASCII value to character
                                style: TextStyle(color: Colors.white), // Text color
                              ),
                              SizedBox(width: 10), // Spacing between label and seats
                              Row(
                                children: List.generate(
                                  12,
                                  (seatIndex) => Seat(),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Seat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 25,
      margin: EdgeInsets.all(3), // Adjust spacing between seats
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }
}

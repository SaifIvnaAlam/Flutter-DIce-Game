// import 'package:flutter/material.dart';
// import 'dart:math';

// class DiceContainer extends StatefulWidget {
//   @override
//   _DiceContainerState createState() => _DiceContainerState();
// }

// class _DiceContainerState extends State<DiceContainer>
//     with SingleTickerProviderStateMixin {
//   int _numberOfDots = 1;
//   late AnimationController _animationController;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 500),
//     );
//     _animation = CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _rollDice() {
//     setState(() {
//       _numberOfDots = Random().nextInt(6) + 1;
//     });
//     _animationController.reset();
//     _animationController.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _rollDice,
//       child: AnimatedBuilder(
//         animation: _animation,
//         builder: (BuildContext context, Widget child) {
//           return Transform.scale(
//             scale: _animation.value,
//             child: Container(
//               width: 150.0,
//               height: 150.0,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.rectangle,
//                 borderRadius: BorderRadius.circular(10.0),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.2),
//                     blurRadius: 5.0,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: List.generate(
//                     _numberOfDots,
//                     (index) => Dot(),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//         child: Container(),
//       ),
//     );
//   }
// }

// class Dot extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 30.0,
//       height: 30.0,
//       decoration: BoxDecoration(
//         color: Colors.black,
//         shape: BoxShape.circle,
//       ),
//     );
//   }
// }

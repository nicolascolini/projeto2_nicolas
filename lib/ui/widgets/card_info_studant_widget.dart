import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:projeto2_nicolas/domain/entities/student_info_entity.dart';

class StudantCard extends StatelessWidget {
  final StudentInfoEntity student;
  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  StudantCard({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: FlipCard(
        key: cardKey,
        direction: FlipDirection.HORIZONTAL,
        speed: 500,
        flipOnTouch: true,
        front: _buildCard(
          context, 
          isFront: true,
          ),
        back: _buildCard(
          context, 
          isFront: false,
        ),
      ),
    );
  };
}

// ignore: use_function_type_syntax_for_parameters
Container _buildCard(BuildContext context, (bool isFront=true)) {

  final theme = Theme.of(context);
  return Container(
    width: double.infinity,
    height: 280,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      gradient: LinearGradient(
       begin: Alignment.topLeft,
       end: Alignment.bottomRight,
       colors: [
        theme.colorScheme.primary,
        theme.colorScheme.inverseSurface,
       ],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
  child: isFront ? _buildCard(context) : _buildCardBack(context),
  );
}

Widget _buildCardFront(BuildContext context) {
  final theme = Theme.of(context);
  var colorText = Colors.white;


  // continuar 
}

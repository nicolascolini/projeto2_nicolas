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
  }

Container _buildCard(BuildContext context, {bool isFront=true}) {

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
  child: isFront ? _buildCardFront(context) : _buildCardBack(context),
  );
}

Widget _buildCardFront(BuildContext context) {
  final theme = Theme.of(context);
  var colorText = Colors.white;


return Padding(
  padding: const EdgeInsets.all(24.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      Text(
        'DADOS DO ESTUDANTE',
        style: TextStyle(
          color: colorText,
          fontSize: 14,
          letterSpacing: 1.5,
        ),
      ),
      Icon(
      Icons.school,
      color: colorText,
      size: 28,
      ),
    ],
  ),
  const Spacer(),
  Text(
    student.name,
    style: TextStyle(
      color: theme.colorScheme.tertiary,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
  const SizedBox(height: 20),
  _buildInfoRow(Icons.cake, 'Idade: ${student.age}', colorText),
  const SizedBox(height: 10),
  _buildInfoRow(Icons.email, student.email, colorText),
  const Spacer(),
  Center(child: Text('Vire para verso',
  style: TextStyle(color: colorText.withOpacity(0.7),
  fontSize: 14,
  ),
  )
  ),

    ]
  )
  ); 
  
}

mixin; student {
}

Widget _buildCardBack(BuildContext context) {
  var colorText = Colors.white;

  return Padding(
    padding: const EdgeInsets.all(24.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'INFORMAÇÕES ADICIONAIS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colorText,
            fontSize: 10,
            letterSpacing: 1,5,
          ),
        ),
        const SizedBox(height: 20),
        _buildInfoRow(Icons.location_on, 'Endereço', colorText),
        const SizedBox(height: 0),
        Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: Text(
            student.address,
            style: TextStyle(
              color: colorText,
              fontSize: 16,
            ),
          ),
          ),
      const SizedBox(height: 20),
      _buildInfoRow(Icons.phone, student.phone, colorText),
      const Spacer(),
      Center(
        child: Text(
          'Ver frente',
          style: TextStyle(
            color: colorText.withOpacity(0,7),
            fontSize: 14,
          ),
        ),
      ),
      ],
    ), 
    );
}

Row _buildInfoRow(IconData icon, String text, [Color? colorText]) {
  return Row(
    children: [
      Icon(
        icon,
        color: colorText,
        size: 20,
      ),
      const SizedBox(width: 12),
      Expanded(
        child: Text(
          text,
          style: TextStyle(
            color: colorText,
            fontSize: 16,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}
}
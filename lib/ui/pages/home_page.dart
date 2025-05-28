import 'package:flutter/material.dart';
import 'package:projeto2_nicolas/common/config/dependencies.dart';
import 'package:projeto2_nicolas/ui/controller/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late HomePageController viewController;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    viewController = injector.get<HomePageController>();
    viewController.load.execute();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1,
      0,
      end: 0,
      9,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleEditMode() {
    setState(() {
      _isEditing = !_isEditing;
      if (_isEditing) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cartão do Estudante',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.close : Icons.edit,
            color: Colors.white),
            onPressed: _toggleEditMode
            tooltip: _isEditing ? 'Cancelar' : 'Editar Informações',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              viewController.loadSample.execute();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Cartão Exemplo Criado',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ))
            },
        ],
      ),
    );
  }
}

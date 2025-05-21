import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../common/errors/errors_classes.dart';
import '../../common/patterns/command.dart';
import 'package:projeto2_nicolas/domain/entities/student_info_entity.dart';

class EditingStudantForm extends StatefulWidget {
  final StudentInfoEntity student;

  final Command1<void, Failure, StudentInfoEntity> onSaveCommand;
  final VoidCallback onCancel;
  final VoidCallback toggleEditMode;

  const EditingStudantForm(
      {super.key,
      required this.student,
      required this.onSaveCommand,
      required this.onCancel,
      required this.toggleEditMode});

  @override
  State<EditingStudantForm> createState() => _EditingStudantFormState();
}

class _EditingStudantFormState extends State<EditingStudantForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;
  late TextEditingController _phoneController;
  late StudentInfoEntity _studant;

  void initState() {
    super.initState();
    _studant = widget.student;
    _nameController = TextEditingController(text: _studant.name);
    _ageController = TextEditingController(text: _studant.age.toString());
    _emailController = TextEditingController(text: _studant.email);
    _addressController = TextEditingController(text: _studant.address);
    _phoneController = TextEditingController(text: _studant.phone);
  }

  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Widget 
  
  //continuar
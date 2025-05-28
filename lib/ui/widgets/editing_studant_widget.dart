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

  @override
  void initState() {
    super.initState();
    _studant = widget.student;
    _nameController = TextEditingController(text: _studant.name);
    _ageController = TextEditingController(text: _studant.age.toString());
    _emailController = TextEditingController(text: _studant.email);
    _addressController = TextEditingController(text: _studant.address);
    _phoneController = TextEditingController(text: _studant.phone);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _ageController,
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an age';
                }
                final age = int.tryParse(value);
                if (age == null || age <= 0) {
                  return 'Please enter a valid age';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an address';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    widget.onCancel();
                    widget.toggleEditMode();
                  },
                  child: Text('Cancel', style: theme.textTheme.bodyLarge),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _saveForm,
                  child: Text('Save', style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
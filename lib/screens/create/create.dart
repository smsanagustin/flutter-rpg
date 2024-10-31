import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  // free up controllers
  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();

    super.dispose();
  }

  // submit handlers
  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      print("Name must not be empty.");
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      print("Slogan must not be empty.");
      return;
    }

    print(_nameController.text);
    print(_sloganController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const StyledTitle(
            "Create Character",
          ),
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // welcome message
                  Center(
                    child: Icon(Icons.code, color: AppColors.primaryColor),
                  ),
                  const Center(
                    child: StyledText("Welcome, new player!"),
                  ),
                  const Center(
                    child: StyledText(
                        "Create a name and slogan for your character."),
                  ),
                  const SizedBox(height: 30),

                  // input for name and slogan
                  TextField(
                    controller: _nameController,
                    style: Theme.of(context).textTheme.bodyMedium,
                    cursorColor: AppColors.textColor,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_2),
                      label: Text("Character name"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _sloganController,
                    style: Theme.of(context).textTheme.bodyMedium,
                    cursorColor: AppColors.textColor,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.chat),
                      label: Text("Character slogan"),
                    ),
                  ),

                  StyledButton(
                      onPressed: handleSubmit,
                      child: const StyledHeading("Create Character"))
                ],
              ),
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

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
      // show error dialog
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const StyledHeading("Please input name"),
              content: const StyledText(
                  "Every good character needs a great name..."),
              actions: [
                StyledButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const StyledHeading("Close"))
              ],
              actionsAlignment: MainAxisAlignment.center,
            );
          });

      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const StyledHeading("Please input slogan"),
              content: const StyledText("Remember to add a catchy slogan..."),
              actions: [
                StyledButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const StyledHeading("Close"))
              ],
              actionsAlignment: MainAxisAlignment.center,
            );
          });

      return;
    }

    // create a new character if all fields have been filled
    characters.add(Character(
        vocation: selectedVocation,
        name: _nameController.text.trim(),
        slogan: _sloganController.text.trim(),
        id: uuid.v4()));

    // go back to home screen
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => const Home()));
  }

  // for updating vocations
  Vocation selectedVocation = Vocation.junkie;

  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
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

                  const SizedBox(
                    height: 20,
                  ),

                  Center(
                    child: Icon(Icons.code, color: AppColors.primaryColor),
                  ),
                  const Center(
                    child: StyledText("Choose a vocation"),
                  ),
                  const Center(
                    child: StyledText("This determines you available skills."),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  VocationCard(
                      selected: selectedVocation == Vocation.junkie,
                      onTap: updateVocation,
                      vocation: Vocation.junkie),
                  VocationCard(
                      selected: selectedVocation == Vocation.wizard,
                      onTap: updateVocation,
                      vocation: Vocation.wizard),
                  VocationCard(
                      selected: selectedVocation == Vocation.raider,
                      onTap: updateVocation,
                      vocation: Vocation.raider),
                  VocationCard(
                      selected: selectedVocation == Vocation.ninja,
                      onTap: updateVocation,
                      vocation: Vocation.ninja),

                  Center(
                    child: Icon(Icons.code, color: AppColors.primaryColor),
                  ),
                  const Center(
                    child: StyledText("Good luck!"),
                  ),
                  const Center(
                    child: StyledText("Enjoy your journey..."),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  StyledButton(
                      onPressed: handleSubmit,
                      child: const StyledHeading("Create Character"))
                ],
              ),
            )));
  }
}

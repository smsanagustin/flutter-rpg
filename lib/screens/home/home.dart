import 'package:flutter/material.dart';
import 'package:flutter_rpg/character_card.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const StyledTitle(
            "Your Characters",
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: ListView.builder(
                itemCount: characters.length,
                itemBuilder: (_, index) {
                  return CharacterCard(characters[index]);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: StyledButton(
                  onPressed: () {},
                  child: const StyledHeading(
                    "CREATE NEW",
                  )),
            )
          ]),
        ));
  }
}

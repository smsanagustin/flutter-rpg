import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: StyledTitle(character.name),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // basic info - image vocation descrioption
            Container(
                padding: const EdgeInsets.all(16),
                color: AppColors.secondaryColor.withOpacity(0.4),
                child: Row(
                  children: [
                    Image.asset(
                        "assets/img/vocations/${character.vocation.image}",
                        width: 140,
                        height: 140),
                    const SizedBox(width: 20),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledTitle(character.vocation.name),
                        StyledText(character.vocation.description),
                      ],
                    ))
                  ],
                )),

            const SizedBox(
              height: 20,
            ),
            Center(
              child: Icon(Icons.code, color: AppColors.primaryColor),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  color: AppColors.secondaryColor.withOpacity(0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // slogan
                      const StyledHeading("Slogan"),
                      StyledText(character.slogan),
                      const SizedBox(
                        height: 10,
                      ),
                      const StyledHeading("Weapon of choice:"),
                      StyledText(character.vocation.weapon),
                      const SizedBox(
                        height: 10,
                      ),
                      const StyledHeading("Unique Ability:"),
                      StyledText(character.vocation.ability),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            )

            // weapon and ability
            //
            // stats & skills
            //
            // save button
          ],
        ));
  }
}
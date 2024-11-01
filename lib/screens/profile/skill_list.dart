import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.character, {super.key});

  final Character character;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  late List<Skill>
      availableSkills; // no value yet but will have one at some point

  @override
  void initState() {
    availableSkills = allSkills.where((skill) {
      return skill.vocation == widget.character.vocation;
    }).toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
            padding: const EdgeInsets.all(16),
            color: AppColors.secondaryColor.withOpacity(0.5),
            child: Column(
              children: [
                const StyledHeading("Choose an active skill"),
                const StyledText("Skills are unique to your vocation."),
                const SizedBox(height: 20),

                // row of skills
                Row(
                    children: availableSkills.map((skill) {
                  return Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.all(5),
                        child: Image.asset("assets/img/skills/${skill.image}",
                            width: 70)),
                  );
                }).toList())
              ],
            )));
  }
}

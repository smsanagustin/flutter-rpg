import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            // available points
            Container(
              color: AppColors.secondaryColor.withOpacity(0.4),
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: widget.character.points > 0
                        ? Colors.yellow
                        : Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const StyledText("Stat points available"),
                  const Expanded(
                    child: SizedBox(
                      width: 10,
                    ),
                  ),
                  StyledHeading(widget.character.points.toString())
                ],
              ),
            ),

            // stats table
            Table(
                children: widget.character.statsFormattedAsList.map((stat) {
              return TableRow(children: [
                // stat title
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: StyledHeading(stat['title']!))),

                // stat value
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: StyledHeading(stat['value']!))),

                // increase point button
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.character.increaseStat(stat['title']!);
                              });
                            },
                            icon: Icon(Icons.arrow_upward,
                                color: AppColors.textColor)))),

                // decrease point button
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.character.decreaseStat(stat['title']!);
                              });
                            },
                            icon: Icon(Icons.arrow_downward,
                                color: AppColors.textColor)))),
              ]);
            }).toList())
          ],
        ));
  }
}

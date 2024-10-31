mixin Stats {
  int _points = 10;
  int _health = 10;
  int _attack = 10;
  int _defense = 10;
  int _skill = 10;

  increaseStat(String stat) {
    if (_points > 0) {
      if (stat == "health") {
        _health++;
      }
      if (stat == "health") {
        _attack++;
      }
      if (stat == "health") {
        _defense++;
      }
      if (stat == "health") {
        _skill++;
      }
      _points--;
    }
  }

  decreaseStat(String stat) {
    if (stat == "health" && _health > 5) {
      _health--;
      _points++;
    }
    if (stat == "attack" && _attack > 5) {
      _attack--;
      _points++;
    }
    if (stat == "defense" && _defense > 5) {
      _defense--;
      _points++;
    }
    if (stat == "skill" && _skill > 5) {
      _skill--;
      _points++;
    }
  }
}

enum Stars {
  ONE,
  TWO,
  THREE,
  FOUR,
  FIVE,
}

extension Stars_Extension on Stars {

  int get number {
    switch (this) {
      case Stars.ONE:
        return 1;
      case Stars.TWO:
        return 2;
      case Stars.THREE:
        return 3;
      case Stars.FOUR:
        return 4;
      case Stars.FIVE:
        return 5;
      default:
        return null;
    }
  }

  void talk() {
    print('meow');
  }
}
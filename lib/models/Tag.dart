enum Tag {
  aquaculture,
  fish,
  imported,
  sea,
  shellfish,
}

extension Tag_Extension on Tag {

  String get name {
    switch (this) {
      case Tag.fish:
        return 'Fish';
      case Tag.aquaculture:
        return 'Aquaculture';
      case Tag.shellfish:
        return 'Shellfish';
      case Tag.sea:
        return 'Sea';
      case Tag.imported:
        return 'Imported';
      default:
        return null;
    }
  }

  void talk() {
    print('meow');
  }
}
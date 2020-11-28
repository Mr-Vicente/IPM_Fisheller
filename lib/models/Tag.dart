enum Tag {
  aquaculture,
  fish,
  imported,
  sea,
  shellfish,
}

Tag getTagEnum(String s){
  switch (s.toLowerCase()) {
    case 'fish':
      return Tag.fish;
    case 'aquaculture':
      return Tag.aquaculture;
    case 'shellfish':
      return Tag.shellfish;
    case 'sea':
      return Tag.sea;
    case 'imported':
      return Tag.imported;
    default:
      return null;
  }
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
}
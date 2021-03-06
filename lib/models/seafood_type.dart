

enum Seafood_Type {
  sea_bass,
  lobster,
  tuna,
  cod_fish,

}

Seafood_Type getSeafoodTypeEnum(String s){
  switch (s.toLowerCase()) {
    case 'sea bass':
      return Seafood_Type.sea_bass;
    case 'lobster':
      return Seafood_Type.lobster;
    case 'tuna':
      return Seafood_Type.tuna;
    case 'cod fish':
      return Seafood_Type.cod_fish;
    default:
      return null;
  }
}

extension Seafood_Type_Extension on Seafood_Type {

  String get name {
    switch (this) {
      case Seafood_Type.sea_bass:
        return 'Sea Bass';
      case Seafood_Type.lobster:
        return 'Lobster';
      case Seafood_Type.tuna:
        return 'Tuna';
      case Seafood_Type.cod_fish:
        return 'Cod Fish';
      default:
        return null;
    }
  }
}
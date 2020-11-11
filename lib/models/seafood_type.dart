enum Seafood_Type {
  sea_bass,
  lobster,
  tuna,
  cod_fish,
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
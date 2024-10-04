enum NetworkRoutes {
  SPELLS,
  HOUSES,
  CHARS,
}

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.SPELLS:
        return "/api/spells";
      case NetworkRoutes.HOUSES:
        return "/api/characters/house/{HOUSENAME}";
      case NetworkRoutes.CHARS:
        return "/api/characters";
    }
  }
}

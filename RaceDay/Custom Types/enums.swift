public enum Sex: String, Codable {
  case male, female
}

public enum Competition: String, Codable, CaseIterable {
  case openMale, openFemale, vet, supervet
}

public enum TeamResult: String, Codable, CaseIterable {
  case overall, male, female, vet, supervet
}

public enum CounterCheck: String, Codable, CaseIterable {
  case vet, female
}


public enum AgeClass: String, Codable {
  case Mopen
  case Fopen
  case M35, F35, M40, F40, M45, F45
  case M50, F50, M55, F55, M60, F60, M65, F65, M70, F70, M75, F75
  
  public func competition() -> Competition {
    switch self {
    case .Mopen: return .openMale
    case .Fopen: return .openFemale
    case .M35, .F35, .M40, .F40, .M45, .F45: return .vet
    case .M50, .F50, .M55, .F55, .M60, .F60, .M65, .F65, .M70, .F70, .M75, .F75: return .supervet
    }
  }
}

public enum ClubName: String, Codable, CaseIterable {
  case Baildon, Dewsbury, Idle, LBT, Pudsey, Skipton, Stainland, Craven, Queensbury,
  Stadium, Todmorden, South_Leeds, Northowram, Crossgates, Methley, Bramley
}

public class Runner: Codable {
  public let number: Int
  public let firstName: String
  public let lastName: String
  public var sex: Sex
  public var ageClass: AgeClass
  public let club: ClubName
  
  public init(number: Int, firstName: String, lastName: String, sex: Sex, ageClass: AgeClass, club: ClubName) {
    self.number = number
    self.firstName = firstName
    self.lastName = lastName
    self.sex = sex
    self.ageClass = ageClass
    self.club = club
  }
}

extension Runner: CustomStringConvertible {
  public var description: String {
    return "Number: \(number), Name: \(firstName) \(lastName), Club: \(club), Competition: \(ageClass.competition())"
  }
}


extension Runner {
  
  enum CodingKeys: String, CodingKey {
    case number
    case firstName = "firstname"
    case lastName = "lastname"
    case sex
    case ageClass = "ageclass"
    case club
  }
}

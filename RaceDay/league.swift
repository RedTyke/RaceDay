public class League {
  let competition: Competition
  var table: [ClubName: Int] = [:]
  
  public func addResults(club: ClubName, points: Int) {
    table[club, default: 0] += points
  }
  
  public func printTable() {
    print("-------------")
    print("-----\(competition)----")
    print("-------------")
    
    let printTable = table.sorted{ $0.value > $1.value}
    
    for (team, score) in printTable {
      print("\(team) : \(score)")
    }
    print("-------------")
    
  }
  
  public init(competition: Competition) {
    self.competition = competition
  }
}




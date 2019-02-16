import Foundation

public struct Result {
  let runner: Runner
  let points: Int
}

public struct CompResult {
  let comp: Competition
  let runner: Runner
  let points: Int
}

public struct ClubResult {
  let club: ClubName
  let comp: Competition
  let points: Int
}


public struct CompRequirement {
  let counters: Int
  let vets: Int
  let male: Int
  let female: Int
}

//
//  result.swift
//  RaceDay
//
//  Created by John McNiffe on 02/02/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

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

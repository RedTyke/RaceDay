//
//  RunnersDataModel.swift
//  RaceDay
//
//  Created by John McNiffe on 09/02/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import Foundation

class RunnersDataModel {
  
  var runners = [Runner]()
  var runnerDictionary = [Int: Runner]()
  
  init() {
    runners = try! importRunners()
    runnerDictionary = createDictionary(from: runners)
  }
  
  func importRunners() throws -> [Runner] {
    let runners = Bundle.main.decode([Runner].self, from: "WYWLRunnersJSON.json")
    return runners
  }
  
  func createDictionary(from runnersArray: [Runner]) -> [Int: Runner] {
    var runnerDictionary: [Int: Runner] = [:]
    for runner in runnersArray {
      runnerDictionary[runner.number] = runner
    }
    return runnerDictionary
  }
  
  
}

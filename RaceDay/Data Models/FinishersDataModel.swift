//
//  FinishersDataSource.swift
//  RaceDay
//
//  Created by John McNiffe on 27/01/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import UIKit

class FinishersDataModel {
  
  let runnersData = RunnersDataModel()
  
  var currentRace: ClubName
  /*
  var currentRace: ClubName {
    get {
      guard let race = UserDefaults.standard.value(forKey: "currentRace")
        else { return .Queensbury }
     return race as! ClubName
    }
    set {
      UserDefaults.standard.set(newValue, forKey: "currentRace")
    }
  }
 */

  var runnerDictionary: [Int: Runner]!
  var runnerOrder = [Runner]()
  var filteredRunnerOrder = [Result]()
  var runnerResult = [Result]()
  var finishers = [Int]()
  
  
  func getFinishers(_ race: ClubName) {
    let filename = "\(race.rawValue).json"
    finishers = Bundle.main.decode([Int].self, from: filename)
  }
  
 
  init() {
    currentRace = .Queensbury
    let runnersData = RunnersDataModel()
    runnerDictionary = runnersData.runnerDictionary
    
    refreshFinisherData()
    print("Data model init")
  }
  
  deinit {
    print("Data model deinit")
  }
  
  func scoreRunners(_ runners: [Runner]) -> [Result] {
    
    var malePoints = 500
    var femalePoints = 500
    var results: [Result] = []
    
    for runner in runners {
      
      switch runner.sex {
      case .male:
        results.append(Result(runner: runner, points: malePoints))
        malePoints -= 1
      case .female:
        results.append(Result(runner: runner, points: femalePoints))
        femalePoints -= 1
      }
    }
    return results
  }
  
  
  func refreshFinisherData() {
    getFinishers(currentRace)
    runnerOrder = finishers.compactMap { runnerDictionary[$0] }
    runnerResult = scoreRunners(runnerOrder)
    filteredRunnerOrder = runnerResult
  }
  
}

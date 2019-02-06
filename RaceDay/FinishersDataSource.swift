//
//  FinishersDataSource.swift
//  RaceDay
//
//  Created by John McNiffe on 27/01/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import UIKit

class FinishersDataSource: NSObject, UITableViewDataSource {
  
  var currentRace: ClubName
  var runners = [Runner]()
  var runnerDictionary = [Int: Runner]()
  var runnerOrder = [Runner]()
  var filteredRunnerOrder = [Result]()
  var runnerResult = [Result]()
  var finishers = [Int]()
  
  
  func getFinishers(_ race: ClubName) {
    let filename = "\(race.rawValue).json"
    finishers = Bundle.main.decode([Int].self, from: filename)
  }
  
  override init() {
    currentRace = .Queensbury
    super.init()
    getFinishers(currentRace)
    runners = try! importRunners()
    runnerDictionary = createDictionary(from: runners)
    runnerOrder = finishers.compactMap { runnerDictionary[$0] }
    runnerResult = scoreRunners(runnerOrder)
    filteredRunnerOrder = runnerResult
    
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
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return filteredRunnerOrder.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "FinisherTableViewCell", for: indexPath) as! FinisherTableViewCell
    
    let filteredFinisher = filteredRunnerOrder[indexPath.row]
    
    if let position = runnerOrder.firstIndex(where: { $0.number == filteredFinisher.runner.number }) {
      cell.positionLabel.text = String(position + 1)
    }
    cell.nameLabel.text = "\(filteredFinisher.runner.firstName) \(filteredFinisher.runner.lastName)"
    cell.numberLabel.text = String(filteredFinisher.runner.number)
    cell.ageLabel.text = filteredFinisher.runner.ageClass.rawValue
    cell.clubLabel.text = filteredFinisher.runner.club.rawValue
    cell.clubImage.image = UIImage(named: filteredFinisher.runner.club.rawValue) ?? UIImage(named: "default")
    cell.scoreLabel.text = String(filteredFinisher.points)
    
    return cell
    
  }
  
  func changeRace(_ race: ClubName) {
    currentRace = race
    getFinishers(currentRace)
    runnerOrder = finishers.compactMap { runnerDictionary[$0] }
    runnerResult = scoreRunners(runnerOrder)
    filteredRunnerOrder = runnerResult
    print("Race changed to \(currentRace)")
  }
  
}

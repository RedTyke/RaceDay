//
//  CountersDataSource.swift
//  RaceDay
//
//  Created by John McNiffe on 17/02/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import UIKit

class CountersDataSource: NSObject, UITableViewDataSource {
 
  var finishersDataModel: FinishersDataModel
  var scoreModel: ScoreModel
  var filteredRunnerOrder: [Result]
  var runnerOrder: [Runner]
  var runnerResult: [Result]
  var counters: [CompResult]
  var compCounters: [CompResult] = []
  
 
 let cellIdentifier = "CountersTableViewCell"
  
  override init() {
    scoreModel = ScoreModel()
    finishersDataModel = FinishersDataModel()
    filteredRunnerOrder = finishersDataModel.filteredRunnerOrder
    runnerOrder = finishersDataModel.runnerOrder
    runnerResult = finishersDataModel.runnerResult
    counters = scoreModel.counterResults
    super.init()
    filterCounters(index: 0)
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   return filteredRunnerOrder.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CountersTableViewCell
    
    let filteredFinisher = filteredRunnerOrder[indexPath.row]
    
    if let position = runnerOrder.firstIndex(where: { $0.number == filteredFinisher.runner.number }) {
      cell.positionLabel.text = String(position + 1)
    }
    cell.nameLabel.text = "\(filteredFinisher.runner.firstName) \(filteredFinisher.runner.lastName)"
    cell.numberLabel.text = String(filteredFinisher.runner.number)
    cell.ageClassLabel.text = filteredFinisher.runner.ageClass.rawValue
    cell.clubLabel.text = filteredFinisher.runner.club.rawValue
    cell.clubImage.image = UIImage(named: filteredFinisher.runner.club.rawValue) ?? UIImage(named: "default")
    cell.pointsLabel.text = String(filteredFinisher.points)
    cell.backgroundColor = UIColor.lightGray
    cell.alpha = CGFloat(0.1)

    
    if let counter = compCounters.firstIndex(where: { $0.runner.number == filteredFinisher.runner.number }) {
       cell.backgroundColor = UIColor.clear
      cell.alpha = CGFloat(1.0)
    }
    return cell
  }
  
  func filterCounters(index: Int) {
    switch index {
    case 0: compCounters = counters.filter { $0.comp == Competition.openFemale || $0.comp == Competition.openMale }
    case 1: compCounters = counters.filter { $0.comp == Competition.openMale }
    case 2: compCounters = counters.filter { $0.comp == Competition.openFemale }
    case 3: compCounters = counters.filter { $0.comp == Competition.vet }
    case 4: compCounters = counters.filter { $0.comp == Competition.supervet }
    default: compCounters = counters.filter { $0.comp == Competition.openFemale || $0.comp == Competition.openMale }
    }
  }
  
  
  
  func refreshData() {
    
    finishersDataModel = FinishersDataModel()
    filteredRunnerOrder = finishersDataModel.filteredRunnerOrder
    runnerOrder = finishersDataModel.runnerOrder
    runnerResult = finishersDataModel.runnerResult
 
  }
  
}

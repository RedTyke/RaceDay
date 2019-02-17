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
  var filteredRunnerOrder: [Result]
  var runnerOrder: [Runner]
  var runnerResult: [Result]
 
 let cellIdentifier = "CountersTableViewCell"
  
  override init() {
    
    finishersDataModel = FinishersDataModel()
    filteredRunnerOrder = finishersDataModel.filteredRunnerOrder
    runnerOrder = finishersDataModel.runnerOrder
    runnerResult = finishersDataModel.runnerResult
 
    super.init()
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
    //cell.ageLabel.text = filteredFinisher.runner.ageClass.rawValue
    cell.clubLabel.text = filteredFinisher.runner.club.rawValue
    cell.clubImage.image = UIImage(named: filteredFinisher.runner.club.rawValue) ?? UIImage(named: "default")
    //cell.scoreLabel.text = String(filteredFinisher.points)
 
   
    
    return cell
    
  }
  
  func refreshData() {
    
    finishersDataModel = FinishersDataModel()
    filteredRunnerOrder = finishersDataModel.filteredRunnerOrder
    runnerOrder = finishersDataModel.runnerOrder
    runnerResult = finishersDataModel.runnerResult
 
  }
  
}

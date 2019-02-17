//
//  CountersTableViewController.swift
//  RaceDay
//
//  Created by John McNiffe on 03/02/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import UIKit

class CountersTableViewController: UITableViewController {
  
  var dataModel: FinishersDataModel!
  var dataSource = CountersDataSource()
 
  var counterResults: [CompResult] = []
  var team: ClubName!
  var comp: Competition!
  
  override func viewDidLoad() {
    dataModel = FinishersDataModel()
  // dataSource = CountersDataSource()
    super.viewDidLoad()
    
  tableView.dataSource = self.dataSource
   // dataSource.filteredRunnerOrder = dataSource.runnerResult
  
    dataSource.filteredRunnerOrder = dataSource.filteredRunnerOrder.filter {
      $0.runner.club.rawValue == team.rawValue &&
      $0.runner.ageClass.competition() == comp
    }
    tableView.reloadData()
    
    print("Counters didload - \(team), \(comp)")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    //dataSource.refreshData()
    tableView.reloadData()
 
  }

}

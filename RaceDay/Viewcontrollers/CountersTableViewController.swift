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
  var dataSource: CountersDataSource!
  
  var compIndex = 0
  var segments: UISegmentedControl!
 
 // var counterResults: [CompResult] = []
  var team: ClubName!
  
  override func viewDidLoad() {
    dataModel = FinishersDataModel()
    dataSource = CountersDataSource()
    super.viewDidLoad()
    
  tableView.dataSource = self.dataSource
   // dataSource.filteredRunnerOrder = dataSource.runnerResult
  
    dataSource.filteredRunnerOrder = dataSource.filteredRunnerOrder.filter {
      $0.runner.club.rawValue == team.rawValue
    }
    tableView.reloadData()
    setUpNavBar()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    //dataSource.refreshData()
    tableView.reloadData()
 
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    navigationController?.popViewController(animated: false)
  }
  
  func setUpNavBar() {
    navigationItem.title = "Counters"
    navigationItem.hidesSearchBarWhenScrolling = false
    self.definesPresentationContext = true
    
    segments = UISegmentedControl(items: ["Overall","Men","Women","Vets","Super Vets"])
    navigationItem.titleView = segments
    segments.center = self.view.center
    segments.layer.cornerRadius = 5
    segments.addTarget(self, action: #selector(segmentTouched), for: .valueChanged)
    segments.selectedSegmentIndex = 0
  }
  
  @objc func segmentTouched(_ sender: UISegmentedControl) {
    print("Index: \(sender.selectedSegmentIndex)")
    
    switch sender.selectedSegmentIndex {
    case 0:
      dataSource.filterCounters(index: 0)
      tableView.reloadData()
    case 1:
      dataSource.filterCounters(index: 1)
      tableView.reloadData()
    case 2:
    dataSource.filterCounters(index: 2)
    tableView.reloadData()
      
    case 3:
    dataSource.filterCounters(index: 3)
    tableView.reloadData()
      
    case 4:
    dataSource.filterCounters(index: 4)
    tableView.reloadData()
      
    default:
    dataSource.filterCounters(index: 0)
    tableView.reloadData()
    }
    //tableView.reloadData()
  }
  

}

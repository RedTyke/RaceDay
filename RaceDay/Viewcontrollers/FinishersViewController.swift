//
//  ViewController.swift
//  RaceDay
//
//  Created by John McNiffe on 19/01/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import UIKit

class FinishersViewController: UITableViewController, UISearchResultsUpdating {
 
  var dataSource: FinishersDataSource!
  var dataModel: FinishersDataModel!
  
  override func viewDidLoad() {
    dataModel = FinishersDataModel()

    super.viewDidLoad()
    
    tableView.dataSource = dataSource
    
    setUpNavBar()
    setupSearch()
    
    print("Finishers didload")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  
    dataSource.refreshData()
    tableView.reloadData()
    setUpNavBar()
    print("WillAppear Reloaded for race \(String(describing: dataModel.currentRace.rawValue))")
  }
  
  func setUpNavBar() {
    navigationItem.title = "Finishers"
    navigationItem.title?.append(contentsOf: " - \(dataModel.currentRace.rawValue)")
    navigationItem.hidesSearchBarWhenScrolling = false
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(EditFinishers))
    self.definesPresentationContext = true
  }
  
  func setupSearch() {
    let search = UISearchController(searchResultsController: nil)
    search.searchResultsUpdater = self
    search.obscuresBackgroundDuringPresentation = false
    search.searchBar.placeholder = "Type something to search here"
    navigationItem.searchController = search
  }
  
  @objc func EditFinishers() {
    print("Allow adjustment of finishing order")
    // need to change datamodel as well as displayed table
  }
  
  // FIX: Move out of viewcontroller
  func updateSearchResults(for searchController: UISearchController) {
    if let text = searchController.searchBar.text, text.count > 0 {
      dataSource.filteredRunnerOrder = dataSource.runnerResult.filter {
        $0.runner.firstName.localizedCaseInsensitiveContains(text)
          || $0.runner.lastName.localizedCaseInsensitiveContains(text)
          || $0.runner.club.rawValue.localizedCaseInsensitiveContains(text)
          || $0.runner.ageClass.rawValue.localizedCaseInsensitiveContains(text)
          || $0.runner.sex.rawValue.localizedCaseInsensitiveContains(text)
          || $0.runner.ageClass.competition().rawValue.localizedCaseInsensitiveContains(text)
        
      }
    } else {
      dataSource.filteredRunnerOrder = dataSource.runnerResult
    }
    tableView.reloadData()
  }
  
  
}


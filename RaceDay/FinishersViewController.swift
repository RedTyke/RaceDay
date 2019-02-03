//
//  ViewController.swift
//  RaceDay
//
//  Created by John McNiffe on 19/01/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import UIKit

class FinishersViewController: UITableViewController, UISearchResultsUpdating {

  let dataSource = FinishersDataSource()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = dataSource
  
    navigationItem.title = "Finishers"
    navigationItem.hidesSearchBarWhenScrolling = false
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(EditFinishers))
    
    let search = UISearchController(searchResultsController: nil)
    search.searchResultsUpdater = self
    search.obscuresBackgroundDuringPresentation = false
    search.searchBar.placeholder = "Type something to search here"
    navigationItem.searchController = search
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
  }
  
  @objc func EditFinishers() {
    print("Allow adjustment of finishing order")
    // need to change datamodel as well as displayed table
  }
  
  // FIX: Move out of viewcontroller
  func updateSearchResults(for searchController: UISearchController) {
    if let text = searchController.searchBar.text, text.count > 0 {
      dataSource.filteredRunnerOrder = dataSource.runnerOrder.filter {
        $0.firstName.localizedCaseInsensitiveContains(text)
        || $0.lastName.localizedCaseInsensitiveContains(text)
        || $0.club.rawValue.localizedCaseInsensitiveContains(text)
        || $0.sex.rawValue.localizedCaseInsensitiveContains(text)
        || $0.ageClass.competition().rawValue.localizedCaseInsensitiveContains(text)
        
      }
    } else {
        dataSource.filteredRunnerOrder = dataSource.runnerOrder
      }
  tableView.reloadData()
  }

    
}


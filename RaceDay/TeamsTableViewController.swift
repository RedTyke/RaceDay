//
//  TeamsTableViewController.swift
//  RaceDay
//
//  Created by John McNiffe on 02/02/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import UIKit

class TeamsTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
 
  
  

  let scoreModel = ScoreModel()
  var filteredResults = [ClubResult]()
  var compIndex = 0
  
  // On the day results....not SEASON results.....need separate view for SEASON TEAM, Individual....most improved
  // FIX: Add searchbar to select OVERALL, MALE, FEMALE, VETS, SUPERVETS to filter which table
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
     // scoreModel.outputResults()
      filteredResults = scoreModel.getTeamResult(TeamResult.overall)
      
      navigationItem.title = "Team Results"
      navigationItem.hidesSearchBarWhenScrolling = false
      self.definesPresentationContext = true
      
      let search = UISearchController(searchResultsController: nil)
      search.searchResultsUpdater = self
      search.obscuresBackgroundDuringPresentation = false
      search.searchBar.placeholder = "Type something to search here"
      search.searchBar.scopeButtonTitles = ["Overall","Men","Women","Vets","Super Vets"]
      search.searchBar.delegate = self
      navigationItem.searchController = search
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
  }

 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredResults.count
    }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
    let result = filteredResults[indexPath.row]
    
 let cell = tableView.dequeueReusableCell(withIdentifier: "TeamsTableViewCell", for: indexPath) as! TeamsTableViewCell
   
    cell.positionLabel.text = String(indexPath.row + 1)
    cell.clubNameLabel.text = result.club.rawValue
    cell.pointsLabel.text = String(result.points)
    cell.clubImage.image = UIImage(named: result.club.rawValue) ?? UIImage(named: "default")

    return cell
  }
  


 /*
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Team Tables"
  }
  
   
  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 50
  }
 */
 
  func updateSearchResults(for searchController: UISearchController) {
    print("stuff happens....")
  }
 
  func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
      print("Scope button \(selectedScope) pressed")
    // Needs to be cleaner - refactor
    switch selectedScope {
    case 0: filteredResults = scoreModel.getTeamResult(TeamResult.overall)
    case 1: filteredResults = scoreModel.getTeamResult(TeamResult.male)
    case 2: filteredResults = scoreModel.getTeamResult(TeamResult.female)
    case 3: filteredResults = scoreModel.getTeamResult(TeamResult.vet)
    case 4: filteredResults = scoreModel.getTeamResult(TeamResult.supervet)
    default: filteredResults = scoreModel.getTeamResult(TeamResult.overall)
    }
        tableView.reloadData()
  }


}

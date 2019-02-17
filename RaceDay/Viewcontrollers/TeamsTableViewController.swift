//
//  TeamsTableViewController.swift
//  RaceDay
//
//  Created by John McNiffe on 02/02/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import UIKit

class TeamsTableViewController: UITableViewController {
  
  let scoreModel = ScoreModel()
  var filteredResults = [ClubResult]()
  var compIndex = 0
  var segments: UISegmentedControl!
  let cellIdentifier = "TeamsTableViewCell"
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
   filteredResults = scoreModel.getTeamResult(TeamResult.overall)
   setUpNavBar()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    scoreModel.refreshData()
    filteredResults = scoreModel.getTeamResult(TeamResult.overall)
    self.tableView.reloadData()
  }
  
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return filteredResults.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let result = filteredResults[indexPath.row]
    
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TeamsTableViewCell
    
    cell.positionLabel.text = String(indexPath.row + 1)
    cell.clubNameLabel.text = result.club.rawValue
    cell.pointsLabel.text = String(result.points)
    cell.clubImage.image = UIImage(named: result.club.rawValue) ?? UIImage(named: "default")
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    guard let vc = storyboard?.instantiateViewController(withIdentifier: "CountersTableViewController") as? CountersTableViewController else {
      fatalError("Unable to instantiate memory view controller.")
    }
    
    let selected = filteredResults[indexPath.row]
    
    vc.team = selected.club
    vc.comp = selected.comp
    
    navigationController?.pushViewController(vc, animated: true)
    
  }
  
  func setUpNavBar() {
    navigationItem.title = "Team Results"
    navigationItem.hidesSearchBarWhenScrolling = false
    self.definesPresentationContext = true
    
    segments = UISegmentedControl(items: ["Overall","Men","Women","Vets","Super Vets"])
    navigationItem.titleView = segments
    segments.center = self.view.center
    segments.layer.cornerRadius = 5
    segments.addTarget(self, action: #selector(segmentTouched), for: .valueChanged)
    
  }
  
  @objc func segmentTouched(_ sender: UISegmentedControl) {
    print("Index: \(sender.selectedSegmentIndex)")
    
    switch sender.selectedSegmentIndex {
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

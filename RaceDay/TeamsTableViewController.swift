//
//  TeamsTableViewController.swift
//  RaceDay
//
//  Created by John McNiffe on 02/02/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import UIKit

class TeamsTableViewController: UITableViewController {

    var data = ["Baildon","Stainland","Pudsey","Skipton"]
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
 
    }

    // MARK: - Table view data source

  /*  override func numberOfSections(in tableView: UITableView) -> Int {
     
        return 0
    }
 */

 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return data.count
    }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath)
    cell.textLabel?.text = data[indexPath.row]
    return cell
  }
  


  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Team Tables"
  }
  
   
  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 50
  }
 


}

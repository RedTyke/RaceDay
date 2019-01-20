//
//  ViewController.swift
//  RaceDay
//
//  Created by John McNiffe on 19/01/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import UIKit

class FinishersViewController: UITableViewController {

  var finishers = [Runner]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    registerTableViewCells()
    
    
    finishers.append(Runner(name: "J McNiffe"))
    finishers.append(Runner(name: "L Kaznowski"))
    navigationItem.title = "Finishers"
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(EditFinishers))
    
  }
    
    func registerTableViewCells() {
        let finisherCell = UINib(nibName: "FinisherTableViewCell", bundle: nil)
        self.tableView.register(finisherCell, forCellReuseIdentifier: "FinisherTableViewCell")
    }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return finishers.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "FinisherTableViewCell", for: indexPath) as! FinisherTableViewCell
    let finisher = finishers[indexPath.row]
    cell.nameLabel.text = finisher.name
    
    return cell
    
  }
  
  @objc func EditFinishers() {
    print("Allow adjustment of finishing order")
    // need to change datamodel as well as displayed table
  }
  
}


//
//  SetUpViewController.swift
//  RaceDay
//
//  Created by John McNiffe on 03/02/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import UIKit

class SetUpViewController: UIViewController {
  
  let dataModel = FinishersDataSource()
  
  
  @IBAction func baildonPressed(_ sender: Any) {
    print("Baildon")
  }
  @IBAction func queensburyPressed(_ sender: Any) {
    print("Queensbury")
    dataModel.changeRace(.Queensbury)
    
  }
  @IBAction func pudseyPressed(_ sender: Any) {
    print("Pudsey")
    dataModel.changeRace(.Pudsey)
  }
  @IBAction func southLeedsPressed(_ sender: Any) {
    print("South Leeds")
    dataModel.changeRace(.South_Leeds)
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  
  
}

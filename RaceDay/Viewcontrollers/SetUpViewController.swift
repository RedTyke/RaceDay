//
//  SetUpViewController.swift
//  RaceDay
//
//  Created by John McNiffe on 03/02/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import UIKit

class SetUpViewController: UIViewController {
  
  weak var delegate: SetUpViewControllerDelegate?

  @IBAction func baildonPressed(_ sender: Any) {
    self.delegate?.setUpViewController(self, didChangeCurrentRace: .Baildon)
  }
  @IBAction func queensburyPressed(_ sender: Any) {
   self.delegate?.setUpViewController(self, didChangeCurrentRace: .Queensbury)
  }
  @IBAction func pudseyPressed(_ sender: Any) {
   self.delegate?.setUpViewController(self, didChangeCurrentRace: .Pudsey)
  }
  @IBAction func southLeedsPressed(_ sender: Any) {
   self.delegate?.setUpViewController(self, didChangeCurrentRace: .South_Leeds)
  }
    @IBAction func crossgatesPressed(_ sender: Any) {
   self.delegate?.setUpViewController(self, didChangeCurrentRace: .Crossgates)
    }
  
  override func viewDidLoad() {
    super.viewDidLoad()
 
    // Do any additional setup after loading the view.
  }

  
  
}

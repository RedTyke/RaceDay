//
//  SetUpViewControllerDelegate.swift
//  RaceDay
//
//  Created by John McNiffe on 09/02/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import Foundation

protocol SetUpViewControllerDelegate: class {
  func setUpViewController(_ controller: SetUpViewController, didChangeCurrentRace race: ClubName)
}

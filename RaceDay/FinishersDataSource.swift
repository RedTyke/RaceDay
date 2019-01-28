//
//  FinishersDataSource.swift
//  RaceDay
//
//  Created by John McNiffe on 27/01/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import UIKit

class FinishersDataSource: NSObject, UITableViewDataSource {
  
  var runners = [Runner]()
  var runnerDictionary = [Int: Runner]()
  var runnerOrder = [Runner]()
  var filteredRunnerOrder = [Runner]()
  
    let finishers = [147, 1002, 50, 914, 89, 86, 786, 568, 864, 809, 1013, 653, 441, 850, 866, 877, 916, 145, 919, 997, 51, 1077, 1032, 79, 822, 795, 77, 928, 532, 451, 140, 440, 303, 820, 760, 559, 668, 650, 571, 579, 137, 812, 143, 152, 543, 25, 29, 185, 505, 759, 572, 436, 458, 1018, 11, 503, 224, 109, 180, 796, 926, 71, 675, 971, 219, 841, 94, 560, 113, 132, 1003, 550, 401, 426, 765, 566, 512, 1030, 868, 873, 1046, 47, 1048, 327, 989, 935, 1024, 805, 410, 38, 927, 769, 632, 844, 148, 1015, 162, 468, 1042, 507, 542, 171, 465, 555, 996, 59, 862, 363, 28, 43, 1004, 547, 846, 575, 353, 541, 159, 62, 962, 534, 139, 874, 39, 88, 651, 136, 929, 693, 876, 670, 87, 1039, 365, 666, 328, 985, 105, 251, 509, 1001, 1007, 968, 902, 27, 92, 69, 754, 847, 548, 150, 1038, 1027, 655, 681, 1043, 56, 945, 756, 703, 908, 686, 1074, 444, 922, 172, 855, 24, 539, 17, 449, 10, 546, 149, 504, 789, 858, 90, 544, 74, 315, 750, 830, 764, 994, 201, 416, 531, 463, 536, 785, 657, 412, 457, 272, 680, 673, 197, 285, 312, 939, 1012, 13, 302, 913, 510, 188, 967, 226, 794, 255, 910, 1041, 689, 660, 934, 944, 138, 83, 250, 564, 142, 553, 783, 911, 320, 318, 859, 84, 988, 757, 803, 37, 570, 843, 573, 802, 57, 151, 72, 355, 331, 310, 165, 133, 155, 674, 856, 343, 280, 447, 506, 435, 344, 903, 23, 12, 1045, 513, 377, 906, 173, 34, 909, 284, 340, 965, 130, 530, 210, 275, 1008, 1010, 975, 871, 18, 854, 576, 316, 114, 357, 115, 882, 993, 619, 263, 685, 259, 978, 462, 350, 601, 972, 930, 1033, 156, 852, 992, 924, 347, 222, 405, 869, 82, 112, 762, 361, 195, 3, 200, 469, 690, 418, 715, 434, 409, 281, 767, 722, 193, 925, 326, 19, 915, 103, 574, 995, 467, 268, 932, 538, 168, 801, 381, 1006, 861, 590, 464, 709, 283, 770, 67, 372, 905, 661, 31, 167, 1025, 617, 317, 1, 778, 652, 629, 609, 199, 55, 182, 337, 321, 614, 1022, 460, 936, 800, 533, 100, 777, 382, 549, 707, 262, 535, 591, 857, 698, 557, 918, 688, 446, 196, 360, 452, 258, 266, 654, 358, 110, 407, 277, 695, 278, 2, 22, 517, 348, 42, 963, 982, 431, 677, 76, 184, 349, 323, 1023, 211, 403, 269, 556, 990, 301, 408, 177, 558, 615, 204, 319, 60, 453, 433, 66, 880, 366, 205, 763, 459, 430, 708, 169, 787, 264, 369, 256, 282, 420, 872, 554, 335, 630, 623, 1040, 221, 174, 9, 427, 364, 362, 454, 406, 368, 807, 1019, 267, 70, 161, 141, 216, 413, 450, 192, 135, 511, 52, 53, 404, 46, 78, 776]

  override init() {
    super.init()
    runners = try! importRunners()
    runnerDictionary = createDictionary(from: runners)
    runnerOrder = finishers.compactMap { runnerDictionary[$0] }
    filteredRunnerOrder = runnerOrder
  }
  
  func importRunners() throws -> [Runner] {
    let bundle = Bundle.main
    let fileURL = bundle.url(forResource: "WYWLRunnersJSON", withExtension: "json")!
    let data = try Data(contentsOf: fileURL)
    let jsonDecoder = JSONDecoder()
    let runners = try jsonDecoder.decode([Runner].self, from: data)
    return runners
  }
  
  func createDictionary(from runnersArray: [Runner]) -> [Int: Runner] {
    var runnerDictionary: [Int: Runner] = [:]
    for runner in runnersArray {
      runnerDictionary[runner.number] = runner
    }
    return runnerDictionary
  }
  
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return filteredRunnerOrder.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "FinisherTableViewCell", for: indexPath) as! FinisherTableViewCell
    
    //let finisher = runnerOrder[indexPath.row]
    let filteredFinisher = filteredRunnerOrder[indexPath.row]
    
    if let position = runnerOrder.firstIndex(where: { $0.number == filteredFinisher.number }) {
        cell.positionLabel.text = String(position + 1)
    }
    // FIX: Needs to pick up position of runner in unfiltered runnerOrder Array
    //cell.positionLabel.text = String(indexPath.row + 1)
    cell.nameLabel.text = "\(filteredFinisher.firstName) \(filteredFinisher.lastName)"
    cell.numberLabel.text = String(filteredFinisher.number)
    cell.clubLabel.text = filteredFinisher.club.rawValue
    cell.clubImage.image = UIImage(named: filteredFinisher.club.rawValue) ?? UIImage(named: "default")
    
    return cell
    
  }
  
}

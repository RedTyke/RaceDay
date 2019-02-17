import UIKit

class MainTabBarController: UITabBarController, SetUpViewControllerDelegate {
  
  var finishersDataModel: FinishersDataModel!
  var finishersDataSource: FinishersDataSource!
  var countersDataSource: CountersDataSource!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    finishersDataModel = FinishersDataModel()
    finishersDataSource = FinishersDataSource()
    countersDataSource = CountersDataSource()
    
    
    let viewcontrollers = viewControllers!
    for (_, viewcontroller) in viewcontrollers.enumerated() {
      
      if let navigationController = viewcontroller as? UINavigationController, let finishersViewController = navigationController.viewControllers.first as? FinishersViewController {
        finishersViewController.dataSource = finishersDataSource
      }
      
      if let navigationController = viewcontroller as? UINavigationController, let countersViewController = navigationController.viewControllers.first as? CountersTableViewController {
        countersViewController.dataSource = countersDataSource
      }
 
      
      if let navigationController = viewcontroller as? UINavigationController, let setUpViewController = navigationController.viewControllers.first as? SetUpViewController {
        setUpViewController.delegate = self
      }
      
    }
  }
  
  func setUpViewController(_ controller: SetUpViewController, didChangeCurrentRace race: ClubName) {
    print("do stuff - \(race.rawValue)")
    finishersDataModel.currentRace = race
    finishersDataModel.refreshFinisherData()
  }
 
  
  
}

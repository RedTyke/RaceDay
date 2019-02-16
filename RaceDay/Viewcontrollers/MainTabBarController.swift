import UIKit

class MainTabBarController: UITabBarController, SetUpViewControllerDelegate {
  
  var finishersDataModel: FinishersDataModel!
  var finishersDataSource: FinishersDataSource!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    finishersDataModel = FinishersDataModel()
    finishersDataSource = FinishersDataSource()
    
    
    let viewcontrollers = viewControllers!
    for (_, viewcontroller) in viewcontrollers.enumerated() {
      
      if let navigationController = viewcontroller as? UINavigationController, let finishersViewController = navigationController.viewControllers.first as? FinishersViewController {
        finishersViewController.dataSource = finishersDataSource
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

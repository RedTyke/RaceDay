import UIKit

class MainTabBarController: UITabBarController, SetUpViewControllerDelegate {
  
  var finishersDataModel: FinishersDataModel!
  var finishersDataSource: FinishersDataSource!
  var countersDataSource: CountersDataSource!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    UserDefaults.standard.set(ClubName.Queensbury.rawValue, forKey: "currentRace")
    
    finishersDataModel = FinishersDataModel()
    finishersDataSource = FinishersDataSource()
    countersDataSource = CountersDataSource()
    
    
    
    let viewcontrollers = viewControllers!
    for (_, viewcontroller) in viewcontrollers.enumerated() {
      
      if let navigationController = viewcontroller as? UINavigationController, let finishersViewController = navigationController.viewControllers.first as? FinishersViewController {
        finishersViewController.dataSource = finishersDataSource
      }
      
      
      if let navigationController = viewcontroller as? UINavigationController, let teamsViewController = navigationController.viewControllers.first as? TeamsTableViewController {
       navigationController.navigationBar.titleTextAttributes = [
       NSAttributedString.Key.font : UIFont.systemFont(ofSize: 30)
       ]
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
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.isOpaque = false
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 30)
        ]
    }
  
}

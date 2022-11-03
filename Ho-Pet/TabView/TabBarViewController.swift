//
//  TabView.swift
//  Ho-Pet
//
//  Created by GiselaCamacho on 19/10/22.
//

import UIKit

class TabBarViewController: UIViewController, UITabBarControllerDelegate {

    var tabBarCnt: UITabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTabBarController()
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func createTabBarController(){
        tabBarCnt = UITabBarController()
        tabBarCnt.delegate = self
        tabBarCnt.tabBar.backgroundColor = UIColor.backgroundBlack
        tabBarCnt.tabBar.tintColor = UIColor.backgroundpink
        tabBarCnt.tabBar.unselectedItemTintColor = UIColor.white
        
        let firstViewController = HomeViewController()
        firstViewController.title = "Home"
        firstViewController.tabBarItem.image = UIImage(systemName: "house.fill")
        
        let secondViewController = BreedViewController()
        secondViewController.title = "Breed"
        secondViewController.tabBarItem.image = UIImage(named: "pata")
        
        let thirdViewController = UserViewController()
        thirdViewController.title = "User"
        thirdViewController.tabBarItem.image = UIImage(systemName: "person.fill")
        
        tabBarCnt.viewControllers = [firstViewController, secondViewController, thirdViewController]

        self.view.addSubview(tabBarCnt.view)
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("tabBar controller \(tabBarController.selectedIndex)")
    }
    

}

//
//  SceneDelegate.swift
//  Sarkmeli
//
//  Created by Mcbook Pro on 28.06.25.
//

import UIKit

// SceneDelegate.swift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        // create main TabBar as entry point
        let mainTabBar = UITabBarController()
        configureTabBarAppearance(for: mainTabBar.tabBar)
        
        mainTabBar.viewControllers = [
            createNavController(),
            createCalendarVC()
            
        ]
        
        self.window = window
        window.rootViewController = mainTabBar
        window.makeKeyAndVisible()
       
    }
    
    // MARK: - Private Helper Functions
   
    func createNavController() -> UINavigationController{
        let homeVC = HomeViewController()
        let navigationControler = UINavigationController(rootViewController: homeVC)
        
        navigationControler.tabBarItem = UITabBarItem(title: "Journal", image: UIImage(systemName: "book.closed"), tag: 0)
        
        
        return navigationControler
        
    
    }
    
    func createCalendarVC()-> UIViewController{
        let calendarVC = CalendarViewController()
        calendarVC.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(systemName: "calendar"), tag: 1)
        return calendarVC
    }
    
    // styling tabBar appearance with modern API
    private func configureTabBarAppearance(for tabBar: UITabBar) {
        let appearance = UITabBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(hex: "#faf5ed")
        let selectedColor = UIColor(hex: "#514029") ?? .systemBlue
        let unselectedColor = UIColor.systemGray
        
        appearance.stackedLayoutAppearance.normal.iconColor = unselectedColor
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: unselectedColor]
        
        appearance.stackedLayoutAppearance.selected.iconColor = selectedColor
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: selectedColor]
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
}

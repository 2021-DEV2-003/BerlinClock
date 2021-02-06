//
//  AppDelegate.swift
//  BerlinClock
//
//  Created by Ananth Bhamidipati on 06/02/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setInitialViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private func setInitialViewController() {
        let berlinClockManager = BerlinClockManager()
        let viewModel = ClockViewModel(clockManager: berlinClockManager)
        let clockViewController = ClockViewController(viewModel: viewModel)
        navigationController = UINavigationController(rootViewController: clockViewController)
    }

}


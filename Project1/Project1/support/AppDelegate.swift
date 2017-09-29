//
//  AppDelegate.swift
//  Project1
//
//  Created by Eric Romrell on 9/27/17.
//  Copyright © 2017 Eric Romrell. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	
	//MARK: UIApplicationDelegate callbacks

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		setupNavBar()
		return true
	}
	
	//MARK: Private functions
	
	private func setupNavBar() {
		//Set up appearance of nav bars
		let appearance = UINavigationBar.appearance()
		appearance.barTintColor = .navBar
		appearance.tintColor = .button
		appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
	}
}


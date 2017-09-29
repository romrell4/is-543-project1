//
//  ProfileViewController.swift
//  Project1
//
//  Created by Eric Romrell on 9/29/17.
//  Copyright © 2017 Eric Romrell. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
	//MARK: Outlets
	
	//MARK: Public Properties
	var user: User!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = user.preferredName
	}
	
}

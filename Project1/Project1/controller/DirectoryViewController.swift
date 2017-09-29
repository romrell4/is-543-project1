//
//  DirectoryViewController.swift
//  Project1
//
//  Created by Eric Romrell on 9/27/17.
//  Copyright © 2017 Eric Romrell. All rights reserved.
//

import UIKit

class DirectoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueResusableCell(for: indexPath)
		cell.textLabel?.text = "This is a test"
		return cell
	}
}


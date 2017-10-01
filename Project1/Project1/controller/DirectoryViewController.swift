//
//  DirectoryViewController.swift
//  Project1
//
//  Created by Eric Romrell on 9/27/17.
//  Copyright © 2017 Eric Romrell. All rights reserved.
//

import UIKit

class DirectoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	//MARK: Outlets
	@IBOutlet private weak var editButton: UIBarButtonItem!
	@IBOutlet private weak var tableView: UITableView!
	
	//MARK: Private properties
	private var users = [User]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//Load data
		Client.getAllUsers { users in
			self.users = users
			self.tableView.reloadData()
		}
		
		tableView.hideEmptyCells()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		//Deselect the selected row
		if let indexPath = tableView.indexPathForSelectedRow {
			tableView.deselectRow(at: indexPath, animated: true)
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let vc = segue.destination as? ProfileViewController, let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
			vc.user = users[indexPath.row]
		}
	}
	
	//MARK: UITableViewDataSource callbacks
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return users.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(for: indexPath) as? DirectoryTableViewCell {
			cell.user = users[indexPath.row]
			return cell
		}
		return UITableViewCell()
	}
	
	//TODO: Set up alphabet and search
	
	//MARK: UITableViewDelegate callbacks
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			users.remove(at: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .right)
		}
	}
	
	//MARK: Actions
	
	@IBAction func editButtonTapped(_ sender: Any) {
		let editing = tableView.isEditing
		tableView.setEditing(!editing, animated: true)
		editButton.title = editing ? "Edit" : "Done"
	}
}


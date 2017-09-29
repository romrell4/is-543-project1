//
//  ProfileViewController.swift
//  Project1
//
//  Created by Eric Romrell on 9/29/17.
//  Copyright © 2017 Eric Romrell. All rights reserved.
//

import UIKit

private let PROFILE_IMAGE_HEIGHT: CGFloat = 150

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	//MARK: Outlets
	@IBOutlet private weak var profileImageView: CircleImageView!
	@IBOutlet private weak var profileImageHeightConstraint: NSLayoutConstraint!
	@IBOutlet private weak var tableView: UITableView!
	
	//MARK: Public properties
	var user: User!
	
	//MARK: Private properties
	var tableData = [Row]()
	var inEditingMode: Bool = false {
		didSet {
			navigationItem.rightBarButtonItem?.title = inEditingMode ? "Done" : "Edit"
			tableView.reloadData()
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupUI()
		loadTableData()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTapped))
	}
	
	//MARK: UITableViewDataSource callbacks
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tableData.count
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 50
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let row = tableData[indexPath.row]
		if inEditingMode, let cell = tableView.dequeueReusableCell(withIdentifier: "editCell", for: indexPath) as? ProfileEditableTableViewCell {
			cell.row = row
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(for: indexPath)
			cell.textLabel?.text = row.text
			cell.detailTextLabel?.text = row.detailText
			return cell
		}
	}
	
	//MARK: UITableViewDelegate callbacks
	
	//TODO: Get image to grow and shrink
//	func scrollViewDidScroll(_ scrollView: UIScrollView) {
//		print(scrollView.contentOffset)
//		profileImageHeightConstraint.constant = PROFILE_IMAGE_HEIGHT - scrollView.contentOffset.y
//		profileImageView.setNeedsLayout()
//	}
	
	//MARK: Listeners
	
	@objc func editButtonTapped() {
		inEditingMode = !inEditingMode
	}
	
	//MARK: Private functions
	
	private func setupUI() {
		title = user.preferredName
		profileImageView.image = user.photo
		tableView.hideEmptyCells()
		profileImageHeightConstraint.constant = PROFILE_IMAGE_HEIGHT
	}
	
	private func loadTableData() {
		tableData = [
			Row(text: "Name", detailText: user.fullName),
			Row(text: "Company Name", detailText: "Unknown"),
			Row(text: "Phone", detailText: user.phone ?? "Unlisted"),
			Row(text: "Email", detailText: user.email ?? "Unlisted"),
			Row(text: "Spouse Name", detailText: "Unknown"),
			Row(text: "Business Profile", detailText: user.bio ?? "Unlisted")
		]
	}
}

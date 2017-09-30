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
	@IBOutlet private weak var profileImageView: ProfileImageView!
	@IBOutlet private weak var profileImageHeightConstraint: NSLayoutConstraint!
	@IBOutlet private weak var tableView: UITableView!
	@IBOutlet private weak var contactStackView: UIStackView!
	
	//MARK: Public properties
	var user: User!
	
	//MARK: Private properties
	var tableData = [Row]()
	var inEditingMode: Bool = false {
		didSet {
			if !inEditingMode {
				saveData()
			}
			navigationItem.rightBarButtonItem?.title = inEditingMode ? "Done" : "Edit"
			reloadTableData()
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupUI()
		reloadTableData()
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
		return tableData[indexPath.row].type == .detail ? 50 : 100
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let row = tableData[indexPath.row]
		switch row.type {
		case .detail:
			if inEditingMode, let cell = tableView.dequeueReusableCell(withIdentifier: "editCell", for: indexPath) as? ProfileEditableTableViewCell {
				cell.row = row
				return cell
			} else {
				let cell = tableView.dequeueReusableCell(for: indexPath)
				cell.textLabel?.text = row.text
				cell.detailTextLabel?.text = row.detailText ?? "Unlisted"
				return cell
			}
		case .paragraph:
			if let cell = tableView.dequeueReusableCell(withIdentifier: "paragraphCell", for: indexPath) as? ProfileParagraphTableViewCell {
				cell.paragraphTextView.isEditable = inEditingMode
				cell.paragraphTextView.text = row.text
				cell.paragraphTextView.scrollRangeToVisible(NSRange(location: 0, length: 0))
				return cell
			}
		}
		return UITableViewCell()
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
	
	private func reloadTableData() {
		tableData = [
			Row(text: "Name", detailText: user.fullName),
			Row(text: "Company Name", detailText: "Unknown"),
			Row(text: "Phone", detailText: user.phone),
			Row(text: "Email", detailText: user.email),
			Row(text: "Spouse Name", detailText: "Unknown"),
		]
		if let bio = user.bio {
			tableData.append(Row(text: bio, type: .paragraph))
		}
		tableView.reloadData()
	}
	
	private func saveData() {
		//TODO: Add company and spouse if needed
		guard let fullName = getDetailText(forRow: 0) else {
			let alert = UIAlertController(title: "Error", message: "There was an error saving the data. Please try again later.", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "OK", style: .default))
			present(alert, animated: true)
			return
		}
		user.fullName = fullName
		user.phone = getDetailText(forRow: 2)
		user.email = getDetailText(forRow: 3)
		user.bio = getParagraphText(forRow: 5)
	}
	
	private func getDetailText(forRow row: Int) -> String? {
		let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0)) as? ProfileEditableTableViewCell
		let text = cell?.detailTextField.text
		return text != "" ? text : nil
	}
	
	private func getParagraphText(forRow row: Int) -> String? {
		let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0)) as? ProfileParagraphTableViewCell
		let text = cell?.paragraphTextView.text
		return text != "" ? text : nil
	}
}

//
//  ProfileEditableTableViewCell.swift
//  Project1
//
//  Created by Eric Romrell on 9/29/17.
//  Copyright © 2017 Eric Romrell. All rights reserved.
//

import UIKit

class ProfileEditableTableViewCell: UITableViewCell {
	//MARK: Outlets
	@IBOutlet private weak var titleLabel: UILabel!
	@IBOutlet weak var detailTextField: UITextField!
	
	//MARK: Public properties
	var row: Row? {
		didSet {
			titleLabel.text = row?.text
			detailTextField?.text = row?.detailText
		}
	}
}

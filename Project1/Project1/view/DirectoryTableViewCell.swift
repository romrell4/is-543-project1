//
//  DirectoryTableViewCell.swift
//  Project1
//
//  Created by Eric Romrell on 9/27/17.
//  Copyright © 2017 Eric Romrell. All rights reserved.
//

import UIKit

class DirectoryTableViewCell: UITableViewCell {
	//MARK: Outlets
	@IBOutlet weak var profileImageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	
	//MARK: Public properties
	var user: User? {
		didSet {
			profileImageView.image = user?.photo
			nameLabel.text = user?.name
		}
	}
}

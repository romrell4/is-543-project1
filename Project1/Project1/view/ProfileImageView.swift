//
//  ProfileImageView.swift
//  Project1
//
//  Created by Eric Romrell on 9/29/17.
//  Copyright © 2017 Eric Romrell. All rights reserved.
//

import UIKit

class ProfileImageView: UIImageView {
	override func layoutSubviews() {
		layer.cornerRadius = frame.height / 2
		layer.masksToBounds = true
		layer.borderWidth = 0
	}
}

//
//  ContactOptionButton.swift
//  Project1
//
//  Created by Eric Romrell on 9/29/17.
//  Copyright © 2017 Eric Romrell. All rights reserved.
//

import UIKit

private let HEIGHT: CGFloat = 40

class ContactOptionButton: UIButton {
	override func awakeFromNib() {
		//Make the button round and have a pink background
		backgroundColor = .contactButton
		layer.cornerRadius = HEIGHT / 2
		layer.masksToBounds = true
		layer.borderWidth = 0
		translatesAutoresizingMaskIntoConstraints = false
		addConstraints([
			NSLayoutConstraint(item: self, attr1: .height, constant: HEIGHT),
			NSLayoutConstraint(item: self, attr1: .width, constant: HEIGHT)
		])
	}
}

//
//  Extensions.swift
//  Project1
//
//  Created by Eric Romrell on 9/27/17.
//  Copyright © 2017 Eric Romrell. All rights reserved.
//

import UIKit

extension UITableView {
	func dequeueResusableCell(for indexPath: IndexPath, withIdentifier identifier: String = "cell") -> UITableViewCell {
		return dequeueReusableCell(withIdentifier: identifier, for: indexPath)
	}
	
	func hideEmptyCells() {
		tableFooterView = UIView()
	}
}

extension UIColor {
	convenience init(red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat = 1) {
		self.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: opacity)
	}
	
	static var navBar: UIColor {
		return UIColor(red: 111, green: 31, blue: 168)
	}
	
	static var button: UIColor {
		return UIColor(red: 255, green: 216, blue: 250)
	}
}

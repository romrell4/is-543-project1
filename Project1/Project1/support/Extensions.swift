//
//  Extensions.swift
//  Project1
//
//  Created by Eric Romrell on 9/27/17.
//  Copyright © 2017 Eric Romrell. All rights reserved.
//

import UIKit

//MARK: UI

extension UIViewController {
	func displayDialog(title: String? = nil, message: String? = nil, dismissHandler: ((UIAlertAction) -> Void)? = nil) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: dismissHandler))
		present(alert, animated: true, completion: nil)
	}
}

extension UITableView {
	func dequeueReusableCell(for indexPath: IndexPath, withIdentifier identifier: String = "cell") -> UITableViewCell {
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
	
	static var contactButton: UIColor {
		return UIColor(red: 247, green: 30, blue: 255)
	}
}

//MARK: NS

extension NSLayoutConstraint {
	convenience init(item: Any, attr1: NSLayoutAttribute, relatedBy: NSLayoutRelation = .equal, toItem: Any? = nil, attr2: NSLayoutAttribute = .notAnAttribute, multiplier: CGFloat = 1, constant: CGFloat = 0) {
		self.init(item: item, attribute: attr1, relatedBy: relatedBy, toItem: toItem, attribute: attr2, multiplier: multiplier, constant: constant)
	}
}

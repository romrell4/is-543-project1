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

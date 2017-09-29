//
//  Row.swift
//  Project1
//
//  Created by Eric Romrell on 9/29/17.
//  Copyright © 2017 Eric Romrell. All rights reserved.
//

import Foundation

struct Row {
	var text: String
	var detailText: String?
	
	init(text: String, detailText: String?) {
		self.text = text
		self.detailText = detailText
	}
}

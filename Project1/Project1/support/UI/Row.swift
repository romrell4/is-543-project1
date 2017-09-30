//
//  Row.swift
//  Project1
//
//  Created by Eric Romrell on 9/29/17.
//  Copyright © 2017 Eric Romrell. All rights reserved.
//

import Foundation

enum RowType {
	case detail
	case paragraph
}

struct Row {
	var text: String
	var detailText: String?
	var type: RowType
	
	init(text: String, detailText: String? = nil, type: RowType = .detail) {
		self.text = text
		self.detailText = detailText
		self.type = type
	}
}

//
//  User.swift
//  Project1
//
//  Created by Eric Romrell on 9/29/17.
//  Copyright © 2017 Eric Romrell. All rights reserved.
//

import UIKit

enum Status {
	case platinum
	case gold
	case silver
	case bronze
}

class User {
	var name: String
	var companyName: String
	var phone: String?
	var email: String?
	var spouseName: String?
	var businessProfile: String?
	var status: Status?
	var photo: UIImage?
	
	init(dict: [String: Any]) {
		guard let name = dict["name"] as? String,
			let companyName = dict["company_name"] as? String else {
				fatalError("Invalid model provided")
		}
		self.name = name
		self.companyName = companyName
		self.phone = dict["phone"] as? String
		self.email = dict["email"] as? String
		self.businessProfile = dict["business_profile"] as? String
		self.photo = UIImage(named: dict["photo"] as? String ?? "")
	}
}

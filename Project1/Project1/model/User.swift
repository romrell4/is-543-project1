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
	var firstName: String
	var lastName: String
	var preferredName: String
	var fullName: String
	var phone: String?
	var email: String?
	var bio: String?
	var status: Status
	var year: String
	var address: String?
	var photo: UIImage?
	
	init(firstName: String, lastName: String, preferredName: String, fullName: String, phone: String?, email: String?, bio: String?, status: Status, year: String, address: String?, photoName: String) {
		self.firstName = firstName
		self.lastName = lastName
		self.preferredName = preferredName
		self.fullName = fullName
		self.phone = phone
		self.email = email
		self.bio = bio
		self.status = status
		self.year = year
		self.address = address
		self.photo = UIImage(named: photoName)
	}
}

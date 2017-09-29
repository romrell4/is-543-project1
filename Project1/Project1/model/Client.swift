//
//  Client.swift
//  Project1
//
//  Created by Eric Romrell on 9/29/17.
//  Copyright © 2017 Eric Romrell. All rights reserved.
//

import Foundation

class Client {
	static func getAllUsers() -> [User] {
		return [
			User(firstName: "Chewbacca", lastName: "Wookiee", preferredName: "Chewie", fullName: "Chewie Wookiee", phone: "801-555-1212", email: "chewie@gmail.com", bio: "Chewbacca", status: .gold, year: "1984", address: "125 Sailing Along Now", photoName: "founder1.png"),
			User(firstName: "Leia", lastName: "Princess", preferredName: "Your Highness", fullName: "Leia Organa", phone: "385-555-1212", email: "leia@gmail.com", bio: nil, status: .platinum, year: "1984", address: nil, photoName: "founder2.png"),
			User(firstName: "Han", lastName: "Solo", preferredName: "Han", fullName: "Han Solo", phone: "214-555-1212", email: "han@gmail.com", bio: nil, status: .silver, year: "1984", address: nil, photoName: "founder3.png"),
			User(firstName: "Luke", lastName: "Skywalker", preferredName: "Luke", fullName: "Luke Skywalker", phone: "408-555-1212", email: "luke@gmail.com", bio: nil, status: .bronze, year: "1984", address: nil, photoName: "founder4.png")
		]
	}
}

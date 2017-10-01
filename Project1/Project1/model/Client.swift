//
//  Client.swift
//  Project1
//
//  Created by Eric Romrell on 9/29/17.
//  Copyright © 2017 Eric Romrell. All rights reserved.
//

import Foundation

class Client {
	static func getAllUsers(callback: ([User]) -> Void) {
		callback([
			User(dict: [
				"name": "Chewbacca Wookiee",
				"company_name": "Wookiees R Us",
				"phone": "801-555-1212",
				"email": "chewie@gmail.com",
				"business_profile": """
					Chewbacca, nicknamed "Chewie", is a fictional character in the Star Wars franchise.
					He is a Wookiee, a tall, hirsute biped and intelligent species from the planet Kashyyyk.
					Chewbacca is the loyal friend and associate of Han Solo, and serves as co-pilot on Solo's ship, the Millenium Falcon.
					""",
				"status": Status.gold,
				"photo": "founder1.png"
			]),
			User(dict: [
				"name": "Leia Organa",
				"company_name": "The Empire",
				"phone": "385-555-1212",
				"email": "leia@gmail.com",
				"spouse_name": "Han Solo",
				"status": Status.platinum,
				"photo": "founder2.png"
			]),
			User(dict: [
				"name": "Han Solo",
				"company_name": "Falcon",
				"phone": "214-555-1212",
				"email": "han@gmail.com",
				"spouse_name": "Leia Organa",
				"status": Status.silver,
				"photo": "founder3.png"
			]),
			User(dict: [
				"name": "Luke Skywalker",
				"company_name": "Jedi Martial Arts",
				"phone": "408-555-1212",
				"email": "luke@gmail.com",
				"status": Status.bronze,
				"photo": "founder4.png"
			])
		])
	}
}

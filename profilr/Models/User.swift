//
//  User.swift
//  profilr
//
//  Created by Théo Maxime on 30/05/2024.
//

import Foundation

struct User: Codable {
	var id: Int
	var email: String
	var phone: String?
	var username: String
	var avatar: String?
}

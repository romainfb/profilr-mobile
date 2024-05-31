//
//  ProfilR.swift
//  profilr
//
//  Created by Théo Maxime on 30/05/2024.
//

import Foundation

struct ProfilR: Codable {
	var id: Int
	var url: String?
	var title: String
	var image: URL
	var user_id: Int
	var bio: String
	var view_stats_profilr_id: Int?
}

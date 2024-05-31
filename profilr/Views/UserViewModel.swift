//
//  UserViewModel.swift
//  profilr
//
//  Created by Théo Maxime on 30/05/2024.
//

import Foundation

class UserViewModel: ObservableObject {
	@Published var idUser: Int = 2
	@Published var user: User?
	@Published var profilR: ProfilR?
	@Published var errorMessage: String?
	
	func fetchUserData() {
		let scheme: String = "http"
		let host: String = "localhost"
		let port = 3000
		let path = "/api/user"
		
		var components = URLComponents()
		components.scheme = scheme
		components.host = host
		components.port = port
		components.path = path
		components.queryItems = [URLQueryItem(name: "id", value: "\(idUser)")]
		
		guard let url = components.url else {
			DispatchQueue.main.async {
				self.errorMessage = "Invalid URL"
			}
			return
		}

		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		request.addValue("application/json", forHTTPHeaderField: "Content-Type")
		
		let task = URLSession.shared.dataTask(with: request) { data, response, error in
			if let error = error {
				DispatchQueue.main.async {
					self.errorMessage = "Network Error: \(error.localizedDescription)"
				}
				return
			}
			
			guard let data = data else {
				DispatchQueue.main.async {
					self.errorMessage = "No data received"
				}
				return
			}
			
			do {
				let user = try JSONDecoder().decode(User.self, from: data)
				DispatchQueue.main.async {
					self.user = user
//					print(self.user)
					self.errorMessage = nil
				}
			} catch {
				DispatchQueue.main.async {
					self.errorMessage = "Decoding Error: \(error.localizedDescription)"
				}
			}
		}
		
		task.resume()
	}
	
	func fetchProfileData() {
		let scheme: String = "http"
		let host: String = "localhost"
		let port = 3000
		let path = "/api/profile"
		
		var components = URLComponents()
		components.scheme = scheme
		components.host = host
		components.port = port
		components.path = path
		components.queryItems = [URLQueryItem(name: "id", value: "\(idUser)")]
		
		guard let url = components.url else {
			DispatchQueue.main.async {
				self.errorMessage = "Invalid URL"
			}
			return
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		request.addValue("application/json", forHTTPHeaderField: "Content-Type")
		
		let task = URLSession.shared.dataTask(with: request) { data, response, error in
			if let error = error {
				DispatchQueue.main.async {
					self.errorMessage = "Network Error: \(error.localizedDescription)"
				}
				return
			}
			
			guard let data = data else {
				DispatchQueue.main.async {
					self.errorMessage = "No data received"
				}
				return
			}
			
			do {
				let profilR = try JSONDecoder().decode(ProfilR.self, from: data)
				DispatchQueue.main.async {
					self.profilR = profilR
//					print(self.profilR)
					self.errorMessage = nil
				}
			} catch {
				DispatchQueue.main.async {
					self.errorMessage = "Decoding Error: \(error.localizedDescription)"
				}
			}
		}
		
		task.resume()
	}
}

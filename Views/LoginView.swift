//
//  LoginView.swift
//  profilr
//
//  Created by Théo Maxime on 30/05/2024.
//

import SwiftUI

struct LoginView: View {
	@Environment(\.colorScheme) var colorScheme
	
	@State private var email: String = ""
	@State private var password: String = ""
	
    var body: some View {
		VStack(alignment: .leading, spacing: 5) {
			Text("Connexion")
				.font(.title)
				.fontWeight(.bold)
			
			Text("Entrer votre email ci-dessous pour vous connecter")
				.font(.subheadline)
				.foregroundStyle(.gray)
				.padding(.bottom)
			
			Group {
				Text("Email")
					.font(.subheadline)
					.foregroundColor(.primary)
				
				TextField("E-mail", text: $email)
					.padding()
					.background(Color(UIColor.systemGray6))
					.cornerRadius(5)
				
				Text("Mot de passe")
					.font(.subheadline)
					.foregroundColor(.primary)
				
				SecureField("mot de passe", text: $password)
					.padding()
					.background(Color(UIColor.systemGray6))
					.cornerRadius(5)
			}
			
			
			Button(action: {
				// Action for creating an account
			}) {
				Text("Créer mon compte")
					.font(.headline)
					.foregroundColor(colorScheme == .dark ? Color.black : Color.white)
					.padding()
					.frame(maxWidth: .infinity)
					.background(colorScheme == .dark ? Color.white : Color.black)
					.cornerRadius(10)
			}
			.padding(.top, 20)
			
			HStack {
				Text("Pas encore de compte ?")
				Button(action: {
					// Action for signing in
				}) {
					Text("Inscription")
						.foregroundColor(.blue)
				}
			}
			.font(.subheadline)
			.padding(.top, 10)
		}
		.padding()
    }
}

#Preview {
    LoginView()
}

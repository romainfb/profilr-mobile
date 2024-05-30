//
//  RegisterView.swift
//  profilr
//
//  Created by Théo Maxime on 30/05/2024.
//

import SwiftUI

struct RegisterView: View {
	@Environment(\.colorScheme) var colorScheme
	
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Inscription")
                .font(.title)
                .fontWeight(.bold)
			
            Text("Entrer vos informations pour vous inscrire")
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

                Text("Username")
                    .font(.subheadline)
                    .foregroundColor(.primary)

                TextField("username", text: $username)
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

                Text("Confirmation de mot de passe")
                    .font(.subheadline)
                    .foregroundColor(.primary)

                SecureField("confirmation de mot de passe", text: $confirmPassword)
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
                Text("Déjà un compte ?")
                Button(action: {
                    // Action for signing in
                }) {
                    Text("Connexion")
                        .foregroundColor(.blue)
                }
            }
            .font(.subheadline)
            .padding(.top, 10)
			
        }
        .padding(30)
    }
}

#Preview {
	RegisterView()
}

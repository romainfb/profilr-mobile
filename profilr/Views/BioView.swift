//
//  BioView.swift
//  profilr
//
//  Created by Théo Maxime on 31/05/2024.
//

import SwiftUI

struct BioView: View {
    @Environment(\.colorScheme) var colorScheme
	@Environment(\.dismiss) var dismiss
	
    @Binding var bio: String

    var body: some View {
        VStack(spacing: 20) {
			Capsule()
				.fill(Color.gray.opacity(0.5))
				.frame(width: 40, height: 5)
				.padding(.top, 10)
            Text("Modifier la biographie")
				.font(.title2)
				.fontWeight(.bold)
            Text("Présentez-vous à vos contact dès maintenant !")
				.font(.subheadline)
				.foregroundColor(.gray)
				.multilineTextAlignment(.center)
				.padding(.horizontal)
            TextEditor(text: $bio)
				.font(.subheadline)
				.foregroundColor(.gray)
				.multilineTextAlignment(.center)
				.padding(.horizontal)
            Button(action: {
                // valider la modif
				dismiss()
            }) {
                Text("Valider")
                    .font(.headline)
                    .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                    .frame(maxWidth: .infinity)
					.padding()
                    .background(colorScheme == .dark ? Color.white : Color.black)
                    .cornerRadius(10)
            }
			.padding([.top, .leading, .trailing])
			Button(action: {
				// annuler et fermer la sheet
				dismiss()
			}) {
				Text("Annuler")
					.font(.system(size: 16, weight: .regular))
					.foregroundColor(Color(UIColor.label)) // Color depending on the system's color scheme
					.frame(maxWidth: .infinity)
					.padding()
					.background(Color(UIColor.systemBackground))
					.cornerRadius(10)
					.overlay(
						RoundedRectangle(cornerRadius: 10)
							.stroke(Color(UIColor.separator), lineWidth: 1)
					)
			}
			.padding([.bottom, .leading, .trailing])
        }
    }
}

// #Preview {
//	BioView(bio: .constant("Test"))
// }

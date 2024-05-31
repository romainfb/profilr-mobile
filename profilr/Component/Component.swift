//
//  Component.swift
//  profilr
//
//  Created by Théo Maxime on 30/05/2024.
//

import Foundation
import SwiftUI

struct SocialLinkView: View {
	var platform: String
	var username: String
	
	var body: some View {
		HStack {
			Image(systemName: "line.horizontal.3") // Placeholder for drag handle
				.resizable()
				.frame(width: 20, height: 20)
				.padding(.leading, 10)
			
			Image(platform) // Platform icon
				.resizable()
				.frame(width: 24, height: 24)
				.padding(.leading, 10)
			
			VStack(alignment: .leading) {
				Text(platform)
					.font(.headline)
				Text("@\(username)")
					.font(.subheadline)
					.foregroundColor(.gray)
			}
			.padding(.leading, 10)
			
			Spacer()
			
			Button(action: {
				// Action to remove the link
			}) {
				Image(systemName: "xmark.circle")
					.resizable()
					.foregroundColor(.black)
					.frame(width: 20, height: 20)
					.padding(.trailing, 10)
			}
		}
		.padding(.vertical, 10)
		.background(Color(UIColor.systemGray6))
		.cornerRadius(8)
		.overlay(
			RoundedRectangle(cornerRadius: 8)
				.stroke(Color.gray.opacity(0.3), lineWidth: 1)
		)
	}
}

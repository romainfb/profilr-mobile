//
//  profilrApp.swift
//  profilr
//
//  Created by Théo Maxime on 30/05/2024.
//

import SwiftUI

@main
struct profilrApp: App {
	let userViewModel = UserViewModel()
	@State var showBio = false
    var body: some Scene {
        WindowGroup {
			AccueilView(viewModel: userViewModel, showBio: $showBio)
        }
    }
}

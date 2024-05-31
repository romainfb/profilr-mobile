import SwiftUI

struct AccueilView: View {
	@Environment(\.colorScheme) var colorScheme
	@ObservedObject var viewModel: UserViewModel
	
	@Binding var showBio: Bool
	@State private var bio: String = ""
	
	var body: some View {
		ZStack {
			VStack {
				HStack {
					Rectangle()
						.fill(colorScheme == .dark ? Color.black : Color.white)
						.frame(maxWidth: 140, maxHeight: 40)
					Text("ProfilR")
						.fontWeight(.bold)
					Spacer()
					Button(action: {
						// action to share the page
					}) {
						Image(systemName: "paperplane.fill")
							.resizable()
							.frame(width: 24, height: 24)
							.foregroundColor(colorScheme == .dark ? .white : .black)
							.padding()
					}
				}
				.padding([.leading, .trailing, .bottom])
				VStack {
					if let imageUrl = viewModel.profilR?.image {
						AsyncImage(url: imageUrl)
							.frame(width: 160, height: 160)
							.cornerRadius(90)
					} else {
						Image("tiplouf")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.frame(width: 160, height: 160)
							.cornerRadius(50)
					}
					HStack {
						Text(viewModel.profilR?.title ?? "Title not found")
							.font(.title)
							.fontWeight(.bold)
						Image(systemName: "pencil")
					}
					.padding(.top)
					Text(viewModel.user?.username ?? "Username not found")
						.font(.subheadline)
						.foregroundStyle(.gray)
						.padding(.bottom)
					
					Button(action: {
						// open sheet to show bio
						bio = viewModel.profilR?.bio ?? ""
						showBio.toggle()
					}) {
						HStack {
							Text("Biographie")
							Image(systemName: "pencil")
						}
						.font(.headline)
						.foregroundColor(colorScheme == .dark ? Color.black : Color.white)
						.padding()
						.frame(maxWidth: .infinity)
						.background(colorScheme == .dark ? Color.white : Color.black)
						.cornerRadius(10)
					}
					.padding()
				}
				
				Spacer()
				
				VStack {
					HStack {
						Text("Mes Liens")
							.font(.title2)
							.fontWeight(.bold)
						Spacer()
					}
					Divider()
					Button(action: {
						// action to add a link
					}) {
						HStack {
							Image(systemName: "link")
							Text("Ajouter un lien")
						}
						.font(.subheadline)
						.foregroundColor(.black)
						.padding()
						.frame(maxWidth: .infinity)
						.background(Color(UIColor.systemGray6))
						.cornerRadius(8)
						.overlay(
							RoundedRectangle(cornerRadius: 8)
								.stroke(style: StrokeStyle(dash: [5]))
								.foregroundColor(.gray)
						)
					}
					SocialLinkView(platform: "Instagram", username: "supdevinci")
					Button(action: {
						// Action for creating an account
					}) {
						Text("Enregistrer")
							.font(.headline)
							.foregroundColor(colorScheme == .dark ? Color.black : Color.white)
							.padding()
							.frame(maxWidth: .infinity)
							.background(colorScheme == .dark ? Color.white : Color.black)
							.cornerRadius(10)
					}
					.padding(.top, 20)
				}
				.padding()
			}
			.sheet(isPresented: $showBio) {
				BioView(bio: $bio)
			}
		}
		.task {
			viewModel.fetchUserData()
			viewModel.fetchProfileData()
		}
	}
}

//#Preview {
//    AccueilView()
//}

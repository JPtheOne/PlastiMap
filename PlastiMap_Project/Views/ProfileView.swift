import SwiftUI

struct ProfileView: View {
    @State private var username: String = "JohnDoe"
    @State private var email: String = "john.doe@example.com"
    @State private var phoneNumber: String = "123-456-7890"

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Edit Profile")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green.opacity(0.7))
                        .cornerRadius(10)
                        .padding(.top, 44)

                    VStack(spacing: 20) {
                        TextField("Username", text: $username)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .foregroundColor(.black)

                        TextField("Email", text: $email)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .foregroundColor(.black)

                        TextField("Phone Number", text: $phoneNumber)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .foregroundColor(.black)

                        Button(action: {
                            // Action for saving changes
                        }) {
                            Text("Save Changes")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                    .background(Color.green.opacity(0.7))
                    .cornerRadius(8)
                }
                .padding(.horizontal)
            }
            .background(
                Image("plant_bg") // Make sure the image name exists in your assets
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

import SwiftUI

struct ProfileView: View {
    @State private var username: String = "JohnDoe"
    @State private var email: String = "john.doe@example.com"
    @State private var phoneNumber: String = "123-456-7890"

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information").font(.headline)) {
                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    TextField("Phone Number", text: $phoneNumber)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                Section {
                    Button(action: {
                        // Action for saving changes
                    }) {
                        Text("Save Changes")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            }
            .navigationBarTitle("Edit Profile", displayMode: .inline)
            .background(Color(.systemGroupedBackground))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

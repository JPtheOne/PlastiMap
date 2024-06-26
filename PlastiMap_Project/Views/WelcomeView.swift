import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct WelcomeView: View {
    @State var email = ""
    @State var password = ""
    @State var isAuthenticated = false
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            if isAuthenticated {
                MenuTabView()
            } else {
                ZStack {
                    Color.green.ignoresSafeArea()
                    
                    VStack {
                        Image("logito")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .foregroundColor(.white)
                        
                        Text("Welcome to PlastiMap")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        TextField("Email", text: $email)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(5.0)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                        
                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(5.0)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                        
                        Button(action: login) {
                            Text("Login")
                                .bold()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                                .foregroundColor(.green)
                        }
                        .padding(.bottom, 10)
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                        }

                        NavigationLink(destination: RegistrationView(email: $email, password: $password)) {
                            Text("Registrarme")
                                .bold()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                                .foregroundColor(.green)
                        }
                    }
                    .padding()
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                self.alertMessage = error.localizedDescription
                self.showingAlert = true
            } else {
                print("Authentication successful")
                isAuthenticated = true
            }
        }
    }
}

struct RegistrationView: View {
    @Binding var email: String
    @Binding var password: String
    @State private var name: String = ""
    @State private var phoneNumber: String = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack {
                Text("Registro")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                TextField("Nombre", text: $name)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                
                SecureField("Contraseña", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)

                TextField("Teléfono", text: $phoneNumber)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)

                Button("Registrarme") {
                    register()
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .foregroundColor(.green)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            }
            .padding()
        }
    }

    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                self.alertMessage = error.localizedDescription
                self.showingAlert = true
            } else {
                print("Registration successful")
                // Aquí guardamos la información adicional en Firestore
                if let userId = result?.user.uid {
                    let db = Firestore.firestore()
                    db.collection("users").document(userId).setData([
                        "name": name,
                        "email": email,
                        "phoneNumber": phoneNumber
                    ]) { error in
                        if let error = error {
                            print("Error writing document: \(error)")
                        } else {
                            print("Document successfully written!")
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

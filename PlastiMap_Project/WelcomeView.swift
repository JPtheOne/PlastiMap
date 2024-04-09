import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                VStack {
                    Image(systemName: "leaf.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                    
                    Text("Welcome to PlastiMap")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer().frame(height: 50)
                    
                    NavigationLink(destination: MenuView()) {
                        Text("Continue")
                            .bold()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .foregroundColor(.green)
                    }
                    .padding()
                }
                .padding()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle()) // This line is added to ensure compatibility with all devices.
    }
}



struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

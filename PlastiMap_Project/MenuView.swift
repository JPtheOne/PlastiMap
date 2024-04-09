import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: RecycleLocationsView()) {
                    Text("Recycle Locations")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 44)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                NavigationLink(destination: AboutRecyclingView()) {
                    Text("About Recycling")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 44)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                // Add more buttons/NavigationLinks for other features of your app
            }
            .padding()
            .navigationBarTitle("Main Menu", displayMode: .inline)
        }
    }
}

struct RecycleLocationsView: View {
    var body: some View {
        Text("Here are recycling locations.")
    }
}

struct AboutRecyclingView: View {
    var body: some View {
        Text("Learn about recycling.")
    }
}

// MARK: - Preview
// This struct is specifically for previewing the SwiftUI view in Xcode's Canvas
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

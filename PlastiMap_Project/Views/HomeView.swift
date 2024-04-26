
import SwiftUI
//import MapKit

struct HomeView: View {
    // Access the shared data
    let recyclableItems = RecyclableItem.allItems

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Página Principal")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green.opacity(0.7))
                        .cornerRadius(10)
                        .padding(.top, 44)

                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
                        ForEach(recyclableItems) { item in
                            NavigationLink(destination: Map_TestView(item: item)) {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.green.opacity(0.7)) // Apply same opacity as the text background
                                        .frame(width: 150, height: 150)
                                        .cornerRadius(8)
                                    VStack {
                                        Image(item.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 130, height: 100) // Adjust dimensions to ensure it fits inside
                                        Text(item.title)
                                            .foregroundColor(.white)
                                            .font(.headline)
                                          
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
            }
            .background(
                Image("plant_bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

// Preview Provider
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

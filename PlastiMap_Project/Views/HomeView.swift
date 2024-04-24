import SwiftUI

struct RecyclableItem { // Items can be added if needed
    var imageName: String
    var title: String
}

struct HomeView: View {
    let recyclableItems: [RecyclableItem] = [
        RecyclableItem(imageName: "pet", title: "PET"),
        RecyclableItem(imageName: "F", title: "Fierros viejos"),
        RecyclableItem(imageName: "steel", title:" Acero"),
        RecyclableItem(imageName: "wood", title:"Madera"),
        RecyclableItem(imageName: "cloth", title: "Tela"),
        RecyclableItem(imageName: "battery", title: "Baterías")
    ]

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
                        .padding(.top, 44) // Padding to compensate for the safe area at the top
                    
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
                        ForEach(recyclableItems, id: \.title) { item in
                            NavigationLink(destination: RecycleMapViewController(item: item)) {
                                ZStack {
                                    Image(item.imageName) // Use image as background, make sure these images exist in your assets
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 150, height: 150)
                                        .clipped()

                                    Text(item.title)
                                        .foregroundColor(.white)
                                        .font(.headline) // Adjust font style if necessary
                                }
                                .background(Color.white.opacity(0.5)) // Applying the background to the whole ZStack
                                .cornerRadius(8)
                                .frame(width: 150, height: 150) // Set frame for ZStack to control size
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

struct RecycleMapViewController: View {
    var item: RecyclableItem
    
    var body: some View {
        Text("Mapa para: \(item.title)")
    }
}

// Preview Provider
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

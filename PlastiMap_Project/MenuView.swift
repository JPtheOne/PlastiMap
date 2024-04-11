import SwiftUI

struct RecyclableItem { // Items can be added if needed
    var imageName: String
    var title: String
}


struct ContentView: View {
    var body: some View {
        TabView {
            MenuView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            RecycleMapViewController(item: RecyclableItem(imageName: "", title: "Mapa"))
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Mapa")
                }
            
            Text("Vender")
                .tabItem {
                    Image(systemName: "dollarsign.circle.fill")
                    Text("Vender")
                }
            
            Text("Perfil")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Perfil")
                }
        }
        
    }
}

struct MenuView: View {
    let recyclableItems: [RecyclableItem] = [
        RecyclableItem(imageName: "bottle.fill", title: "PET"), // Usando símbolos del sistema
        RecyclableItem(imageName: "cart.fill", title: "Cartón"), // Asumo que no hay un exacto para cartón, pero puedes elegir uno adecuado
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
                        ForEach(recyclableItems, id: \.title) { item in
                            NavigationLink(destination: RecycleMapViewController(item: item)) {
                                VStack {
                                    Image(systemName: item.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                        .background(Color.white)
                                        .cornerRadius(8)
                                    
                                    Text(item.title)
                                        .foregroundColor(.black)
                                }
                                .padding()
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(8)
                            }
                        }
                    }
                    
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
                }
                .padding()
            }
            .background(
                Image("plant_bg") // Sigue siendo necesario reemplazar este nombre
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
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

struct RecycleMapViewController: View {
    var item: RecyclableItem
    
    var body: some View {
        Text("Mapa para: \(item.title)")
    }
}

// Vista de previsualización
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

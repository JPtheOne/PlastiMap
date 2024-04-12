import SwiftUI

struct RecyclableItem { // Items can be added if needed
    var imageName: String
    var title: String
}

struct HomeView: View {
    let recyclableItems: [RecyclableItem] = [
        RecyclableItem(imageName: "pet", title: "PET"),
        RecyclableItem(imageName: "steel", title: "Fierros viejos"),
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
                        .padding(.top, 44) // Padding para compensar el área segura en la parte superior
                    
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
                        ForEach(recyclableItems, id: \.title) { item in
                            NavigationLink(destination: RecycleMapViewController(item: item)) {
                                ZStack {
                                    // Usar Image como fondo, asegúrate de que estas imágenes existan en tus assets
                                    Image(item.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 150, height: 150)
                                        .cornerRadius(8)
                                        .clipped()

                                    Text(item.title)
                                        .foregroundColor(.white)
                                        .font(.headline) // Ajusta el estilo de la fuente si es necesario
                                }
                                .frame(width: 150, height: 150) // Ajusta estos valores según el diseño que prefieras
                                .cornerRadius(8)
                            }
                        }
                    }
                }
                .padding()
            }
            .background(
                Image("plant_bg") // Asegúrate de tener esta imagen en tus assets
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

// Vista de previsualización
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

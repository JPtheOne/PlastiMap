import SwiftUI

struct Store1: Identifiable {
    let id = UUID() // Add an id property for ForEach to use
    var name: String
    var latitude: Double
    var longitude: Double
    var material: String
    var pricePerKg: Double
    var imageName: String
}

struct SellView: View {
    let stores: [Store1] = [
        Store1(name: "Plasticos Chela", latitude: 19.0, longitude: 13.0, material: "Plastico", pricePerKg: 45, imageName: "store"),
        Store1(name: "Metales Juan", latitude: 19.5, longitude: 13.5, material: "Metal", pricePerKg: 50, imageName: "store"),
        Store1(name: "Papel Recycle", latitude: 20.0, longitude: 14.0, material: "Papel", pricePerKg: 10, imageName: "store")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Vende tus Reciclables")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green.opacity(0.7))
                        .cornerRadius(10)
                        .padding(.top, 44)
                    
                    ForEach(stores) { store in
                        NavigationLink(destination: Text("Detalles para: \(store.name)")) {
                            HStack(spacing: 20) {
                                Image(store.imageName) // Make sure the image name exists in your assets
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120, height: 120)
                                    .cornerRadius(8)
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(store.name)
                                        .bold()
                                        .foregroundColor(.white)
                                    
                                    Text("Coords: \(store.latitude), \(store.longitude)")
                                        .foregroundColor(.white)
                                        .font(.caption)
                                    
                                    Text("\(store.material) - $\(store.pricePerKg)/kg")
                                        .foregroundColor(.white)
                                        .font(.caption)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.green.opacity(0.7))
                            .cornerRadius(8)
                        }
                    }
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

struct SellView_Previews: PreviewProvider {
    static var previews: some View {
        SellView()
    }
}

import Foundation
import MapKit

struct RecyclableItem: Identifiable {
    let id = UUID()
    var imageName: String
    var title: String
    var coordinate: CLLocationCoordinate2D
    var description: String
    var pricePerKilo: Double
    
    static let allItems: [RecyclableItem] = [
        RecyclableItem(imageName: "pet", title: "PET", coordinate: CLLocationCoordinate2D(latitude: 19.0410, longitude: -98.2060), description: "Polietileno Tereftalato, comúnmente utilizado en envases y botellas.", pricePerKilo: 0.25),
        RecyclableItem(imageName: "F", title: "Fierros viejos", coordinate: CLLocationCoordinate2D(latitude: 19.0430, longitude: -98.1980), description: "Metales ferrosos que pueden contener hierro o acero.", pricePerKilo: 0.15),
        RecyclableItem(imageName: "steel", title: "Acero", coordinate: CLLocationCoordinate2D(latitude: 19.0420, longitude: -98.2020), description: "Utilizado en la construcción y fabricación de herramientas.", pricePerKilo: 0.20),
        RecyclableItem(imageName: "wood", title: "Madera", coordinate: CLLocationCoordinate2D(latitude: 19.0450, longitude: -98.2010), description: "Madera recuperada o descartada, utilizada para reciclaje o reutilización.", pricePerKilo: 0.10),
        RecyclableItem(imageName: "cloth", title: "Tela", coordinate: CLLocationCoordinate2D(latitude: 19.0460, longitude: -98.2040), description: "Restos de tela o ropa usada apta para reciclaje.", pricePerKilo: 0.05),
        RecyclableItem(imageName: "battery", title: "Baterías", coordinate: CLLocationCoordinate2D(latitude: 19.0400, longitude: -98.2050), description: "Baterías usadas, incluyendo tipos como alcalinas o de litio.", pricePerKilo: 1.00)
    ]
}

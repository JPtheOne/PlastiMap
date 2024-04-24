import Foundation
import MapKit

struct RecyclableItem: Identifiable {
    let id = UUID()
    var imageName: String
    var title: String
    var coordinate: CLLocationCoordinate2D
    
    static let allItems: [RecyclableItem] = [
        RecyclableItem(imageName: "pet", title: "PET", coordinate: CLLocationCoordinate2D(latitude: 19.0410, longitude: -98.2060)),
        RecyclableItem(imageName: "F", title: "Fierros viejos", coordinate: CLLocationCoordinate2D(latitude: 19.0430, longitude: -98.1980)),
        RecyclableItem(imageName: "steel", title: "Acero", coordinate: CLLocationCoordinate2D(latitude: 19.0420, longitude: -98.2020)),
        RecyclableItem(imageName: "wood", title: "Madera", coordinate: CLLocationCoordinate2D(latitude: 19.0450, longitude: -98.2010)),
        RecyclableItem(imageName: "cloth", title: "Tela", coordinate: CLLocationCoordinate2D(latitude: 19.0460, longitude: -98.2040)),
        RecyclableItem(imageName: "battery", title: "Baterías", coordinate: CLLocationCoordinate2D(latitude: 19.0400, longitude: -98.2050))
    ]
}

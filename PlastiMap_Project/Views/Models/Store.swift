import Foundation

struct Store: Identifiable {
    var id: String
    var name: String
    var latitude: Double
    var longitude: Double
    var material: String
    var pricePerKg: Double
    var imageName: String
    
    // Inicializador para crear un `Store` directamente desde un documento de Firestore
    init(id: String, name: String, latitude: Double, longitude: Double, material: String, pricePerKg: Double, imageName: String) {
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.material = material
        self.pricePerKg = pricePerKg
        self.imageName = imageName
    }
    
    // Inicializador para crear un `Store` desde un diccionario, útil cuando se recupera un documento de Firestore
    init?(dictionary: [String: Any]) {
        guard let name = dictionary["name"] as? String,
              let latitude = dictionary["latitude"] as? Double,
              let longitude = dictionary["longitude"] as? Double,
              let material = dictionary["material"] as? String,
              let pricePerKg = dictionary["pricePerKg"] as? Double,
              let imageName = dictionary["imageName"] as? String,
              let id = dictionary["id"] as? String else {
            return nil
        }
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.material = material
        self.pricePerKg = pricePerKg
        self.imageName = imageName
    }
}

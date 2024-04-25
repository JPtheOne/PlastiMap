import SwiftUI
import Firebase
import FirebaseFirestore
import MapKit  // Make sure to import MapKit here

class RecyclableItemsViewModel: ObservableObject {
    @Published var items: [RecyclableItem] = []

    private var db = Firestore.firestore()

    init() {
        fetchData()
    }

    func fetchData() {
        db.collection("recyclableItems").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("No documents in 'recyclableItems' collection")
                return
            }
            self.items = documents.map { queryDocumentSnapshot -> RecyclableItem in
                let data = queryDocumentSnapshot.data()
                let imageName = data["imageName"] as? String ?? ""
                let title = data["title"] as? String ?? ""
                let latitude = data["latitude"] as? Double ?? 0
                let longitude = data["longitude"] as? Double ?? 0
                let description = data["description"] as? String ?? ""
                let pricePerKilo = data["pricePerKilo"] as? Double ?? 0

                return RecyclableItem(imageName: imageName, title: title, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), description: description, pricePerKilo: pricePerKilo)
            }
        }
    }
}

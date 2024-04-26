import Firebase
import Combine

class StoreViewModel: ObservableObject {
    @Published var stores: [Store] = []

    private var db = Firestore.firestore()

    // Carga las tiendas de Firestore y las escucha para cambios en tiempo real.
    func getStores() {
        db.collection("stores").addSnapshotListener { querySnapshot, error in
            if let error = error {
                print("Error getting stores: \(error.localizedDescription)")
                return
            }

            if let documents = querySnapshot?.documents {
                self.stores = documents.map { queryDocumentSnapshot -> Store in
                    let data = queryDocumentSnapshot.data()
                    let id = queryDocumentSnapshot.documentID
                    return Store(
                        id: id,
                        name: data["name"] as? String ?? "",
                        latitude: data["latitude"] as? Double ?? 0.0,
                        longitude: data["longitude"] as? Double ?? 0.0,
                        material: data["material"] as? String ?? "",
                        pricePerKg: data["pricePerKg"] as? Double ?? 0.0,
                        imageName: data["imageName"] as? String ?? "defaultImage"
                    )
                }
            }
        }
    }

    // Añade una nueva tienda a Firestore.
    func addStore(name: String, latitude: Double, longitude: Double, material: String, pricePerKg: Double, imageName: String) {
        db.collection("stores").addDocument(data: [
            "name": name,
            "latitude": latitude,
            "longitude": longitude,
            "material": material,
            "pricePerKg": pricePerKg,
            "imageName": imageName
        ])
    }

    // Elimina una tienda de Firestore.
    func deleteStore(storeToDelete: Store) {
        db.collection("stores").document(storeToDelete.id).delete()
    }

    // Actualiza una tienda existente en Firestore.
    func updateStore(updatedStore: Store) {
        db.collection("stores").document(updatedStore.id).setData([
            "name": updatedStore.name,
            "latitude": updatedStore.latitude,
            "longitude": updatedStore.longitude,
            "material": updatedStore.material,
            "pricePerKg": updatedStore.pricePerKg,
            "imageName": updatedStore.imageName
        ], merge: true) { error in
            if let error = error {
                print("Error updating store: \(error.localizedDescription)")
            }
        }
    }
}

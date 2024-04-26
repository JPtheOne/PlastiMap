import SwiftUI
import Firebase

struct StoreManagerView: View {
    @ObservedObject var viewModel = StoreViewModel() // Updated ViewModel for stores
    
    @State private var name = ""
    @State private var latitude = ""
    @State private var longitude = ""
    @State private var material = ""
    @State private var pricePerKg = ""
    @State private var selectedStore: Store? // Store seleccionado para editar
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Gestión de Tiendas")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green.opacity(0.7))
                        .cornerRadius(10)
                        .padding(.top, 44)
                    
                    ForEach(viewModel.stores) { store in
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "arrow.right.circle.fill")
                                    .foregroundColor(.white)
                                Text(store.name)
                                    .foregroundColor(.white)
                                Spacer()
                                Button("Editar") {
                                    // Configura el formulario para la edición
                                    self.selectedStore = store
                                    self.name = store.name
                                    self.latitude = String(store.latitude)
                                    self.longitude = String(store.longitude)
                                    self.material = store.material
                                    self.pricePerKg = String(store.pricePerKg)
                                }
                                .buttonStyle(BorderlessButtonStyle())
                                Button("Eliminar") {
                                    viewModel.deleteStore(storeToDelete: store)
                                }
                                .buttonStyle(BorderlessButtonStyle())
                                .foregroundColor(.red)
                            }
                            Text("Material: \(store.material) - $\(store.pricePerKg)/kg")
                            Text("Coordenadas: \(store.latitude), \(store.longitude)")
                        }
                        .padding()
                        .background(Color.green.opacity(0.5))
                        .cornerRadius(8)
                    }
                    .onDelete(perform: deleteStore)
                    
                    Divider().background(Color.white)
                    
                    Group {
                        TextField("Nombre de la tienda", text: $name)
                        TextField("Latitud", text: $latitude)
                        TextField("Longitud", text: $longitude)
                        TextField("Material", text: $material)
                        TextField("Precio por Kg", text: $pricePerKg)
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(4)
                    
                    if let _ = selectedStore {
                        Button("Actualizar Tienda") {
                            updateStore()
                        }
                        .buttonStyle(PrimaryButtonStyle())
                    } else {
                        Button("Añadir Tienda") {
                            addStore()
                        }
                        .buttonStyle(PrimaryButtonStyle())
                    }
                }
                .padding(.horizontal)
            }
            .background(
                Image("plant_bg") // Make sure this image name exists in your assets
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
            .navigationBarTitle("Tiendas", displayMode: .inline)
        }
        .onAppear {
            viewModel.getStores() // Fetch stores when the view appears
        }
    }
    
    func deleteStore(at offsets: IndexSet) {
        offsets.forEach { index in
            let store = viewModel.stores[index]
            viewModel.deleteStore(storeToDelete: store)
        }
    }
    
    func addStore() {
        if let lat = Double(latitude), let long = Double(longitude), let price = Double(pricePerKg) {
            viewModel.addStore(name: name, latitude: lat, longitude: long, material: material, pricePerKg: price, imageName: "")
            resetForm()
        } else {
            // Handle error: input data not valid
        }
    }
    
    func updateStore() {
        if let storeToUpdate = selectedStore, let lat = Double(latitude), let long = Double(longitude), let price = Double(pricePerKg) {
            viewModel.updateStore(updatedStore: Store(id: storeToUpdate.id, name: name, latitude: lat, longitude: long, material: material, pricePerKg: price, imageName: storeToUpdate.imageName))
            resetForm()
        } else {
            // Handle error: input data not valid
        }
    }
    
    func resetForm() {
        name = ""
        latitude = ""
        longitude = ""
        material = ""
        pricePerKg = ""
        selectedStore = nil // Clear selected store
    }
}

// Estilo primario para botones
struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(Color.blue.opacity(0.7))
            .cornerRadius(8)
    }
}

struct StoreManagerView_Previews: PreviewProvider {
    static var previews: some View {
        StoreManagerView()
    }
}

import SwiftUI

struct ManageStoreView: View {
    @State private var latitude: String = ""
    @State private var longitude: String = ""
    @State private var owner: String = ""
    @State private var productType: String = ""
    @State private var price: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Store Details")) {
                    TextField("Latitude", text: $latitude)
                        .keyboardType(.decimalPad)
                    TextField("Longitude", text: $longitude)
                        .keyboardType(.decimalPad)
                    TextField("Owner", text: $owner)
                    TextField("Product Type", text: $productType)
                    TextField("Price", text: $price)
                        .keyboardType(.decimalPad)
                }

                Button("Add Store") {
                    // Add the logic to handle adding the store
                    print("Store added: \(latitude), \(longitude), \(owner), \(productType), \(price)")
                }
            }
            .navigationBarTitle("Manage Store", displayMode: .inline)
        }
    }
}

struct ManageStoreView_Previews: PreviewProvider {
    static var previews: some View {
        ManageStoreView()
    }
}

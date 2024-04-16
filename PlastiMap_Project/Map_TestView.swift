import SwiftUI
import MapKit

struct Map_TestView: View {
    @State private var selectedAnnotationInfo: String? = "Select a point to see details"

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Image("plant_bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Text("Mapa de Puebla")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green.opacity(0.7))
                        .cornerRadius(10)
                        .padding(.top, 44)
                    

                    MapComponent(selectedAnnotationInfo: $selectedAnnotationInfo)
                        .frame(height: 300)
                        .cornerRadius(15)
                        .padding()

                    // Permanent Info Box
                    Text(selectedAnnotationInfo ?? "No selection")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                        .padding()
                }
            }
        }
    }
}

struct MapComponent: UIViewRepresentable {
    @Binding var selectedAnnotationInfo: String?
    let coordinates = [
        CLLocationCoordinate2D(latitude: 19.04799561392173, longitude: -98.30354892001462),
        CLLocationCoordinate2D(latitude: 19.0500, longitude: -98.2000),
        CLLocationCoordinate2D(latitude: 19.0440, longitude: -98.1980)
    ]

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator

        let region = MKCoordinateRegion(
            center: coordinates.first!,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        mapView.setRegion(region, animated: true)

        for coordinate in coordinates {
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = "Plásticos Jimenez"
            annotation.subtitle = "Pet - $10/Kg"
            mapView.addAnnotation(annotation)
        }

        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Map view updates are not necessary as data is static
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapComponent
        
        init(_ parent: MapComponent) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            if let annotation = view.annotation as? MKPointAnnotation {
                parent.selectedAnnotationInfo = "\(annotation.title ?? "Unknown") - \(annotation.subtitle ?? "No details provided")"
            }
        }
    }
}

struct Map_TestView_Previews: PreviewProvider {
    static var previews: some View {
        Map_TestView()
    }
}

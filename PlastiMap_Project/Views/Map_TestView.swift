import SwiftUI
import MapKit

struct Map_TestView: View {
    @State private var selectedAnnotationInfo: String? = "Seleccione un punto para ver más"
    var item: RecyclableItem? // This is now an optional parameter

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Image("plant_bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Text(item != nil ? "Mapa de \(item!.title)" : "Mapa General")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green.opacity(0.7))
                        .cornerRadius(10)
                        .padding(.top, 44)

                    MapComponent(selectedAnnotationInfo: $selectedAnnotationInfo, item: item)
                        .frame(height: 300)
                        .cornerRadius(15)
                        .padding()

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
    var item: RecyclableItem?

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator

        let items = item != nil ? [item!] : RecyclableItem.allItems
        let centerCoordinate = item?.coordinate ?? CLLocationCoordinate2D(latitude: 19.0430, longitude: -98.2010)

        let region = MKCoordinateRegion(
            center: centerCoordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        mapView.setRegion(region, animated: true)

        for item in items {
            let annotation = MKPointAnnotation()
            annotation.coordinate = item.coordinate
            annotation.title = item.title
            mapView.addAnnotation(annotation)
        }

        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // No need to update annotations dynamically in this example
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
        Map_TestView()  // Preview with all items
    }
}

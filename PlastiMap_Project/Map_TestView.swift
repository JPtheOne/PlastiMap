import SwiftUI
import MapKit

struct Map_TestView: View {
    var body: some View {
        VStack {
            Text("Mapa de Puebla")
                .font(.largeTitle)
                .padding()

            MapComponent()
                .frame(height: 300)  // Define el alto del marco del mapa
                .cornerRadius(15)
                .padding()
        }
    }
}

struct MapComponent: UIViewRepresentable {
    let coordinates = [
        CLLocationCoordinate2D(latitude: 19.04799561392173, longitude: -98.30354892001462),
        CLLocationCoordinate2D(latitude: 19.0500, longitude: -98.2000), // Ejemplo de otra ubicación en Puebla
        CLLocationCoordinate2D(latitude: 19.0440, longitude: -98.1980)  // Otro punto de interés
    ]

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator

        // Configura la región alrededor del primer punto de interés
        let region = MKCoordinateRegion(
            center: coordinates.first!, // Asume que siempre hay al menos un punto
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)  // Ajusta el nivel de zoom aquí
        )
        mapView.setRegion(region, animated: true)

        // Añade múltiples anotaciones al mapa
        for coordinate in coordinates {
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = "Punto de Interés"
            annotation.subtitle = "Detalles adicionales aquí"
            mapView.addAnnotation(annotation)
        }

        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // No es necesario actualizar la vista en este ejemplo, ya que los datos son estáticos.
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapComponent
        
        init(_ parent: MapComponent) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "Placemark"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
            
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                annotationView?.pinTintColor = .red
            } else {
                annotationView?.annotation = annotation
            }
            
            return annotationView
        }
    }
}

struct Map_TestView_Previews: PreviewProvider {
    static var previews: some View {
        Map_TestView()
    }
}

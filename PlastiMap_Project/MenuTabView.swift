import SwiftUI

struct MenuTabView: View {
    init() {
        // Personalizar el color de fondo de la barra de tabs
        UITabBar.appearance().backgroundColor = UIColor.white
    }

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Inicio")
                }
                //.background(Color.white) // Asegura que el fondo de la vista HomeView también es blanco
            
            Map_TestView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Mapa")
                }
                .background(Color.white) // Fondo blanco para el contenido de este tab
            
            SellsView()
                .tabItem {
                    Image(systemName: "dollarsign.circle.fill")
                    Text("Venta")
                }
                .background(Color.white) // Fondo blanco para el contenido de este tab
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Perfil")
                }
                .background(Color.white) // Fondo blanco para el contenido de este tab
        }
        .accentColor(.black) // Cambia el color de los iconos y texto en la barra de tabs a negro (u otro color que prefieras)
        .background(Color.white.edgesIgnoringSafeArea(.all)) // Fondo blanco para el TabView
    }
}

struct MenuTabView_Previews: PreviewProvider {
    static var previews: some View {
        MenuTabView()
    }
}

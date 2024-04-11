// GlobalTabView.swift

import SwiftUI

struct GlobalTabView: View {
    @StateObject var viewModel = GlobalViewModel()  // ViewModel para mantener el estado global

    var body: some View {
        TabView {
            MenuView(viewModel: viewModel)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            RecycleMapViewController(item: RecyclableItem(imageName: "map.fill", title: "Mapa"), viewModel: viewModel)
                .tabItem {
                    Label("Mapa", systemImage: "map.fill")
                }
            
            SellView(viewModel: viewModel)
                .tabItem {
                    Label("Vender", systemImage: "dollarsign.circle.fill")
                }
            
            ProfileView(viewModel: viewModel)
                .tabItem {
                    Label("Perfil", systemImage: "person.crop.circle")
                }
        }
        .background(Color.white)  // Fondo blanco para el TabView
        .cornerRadius(10)         // Bordes redondeados
        .padding()                // Espaciado alrededor del TabView
    }
}

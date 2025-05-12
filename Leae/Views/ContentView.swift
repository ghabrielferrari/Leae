struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
    }
}

import SwiftUI

struct ContentView: View {
    @State private var showTabBar = false

    var body: some View {
        ZStack {
            Color("Hover")
                .ignoresSafeArea()
                .contentShape(Rectangle()) // permite toque em toda a área
                .onTapGesture {
                    showTabBar = true
                }

            VStack {
                Spacer()
                Image("App")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500, height: 500)
                    .shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 10)
            }
        }
        .fullScreenCover(isPresented: $showTabBar) {
            TabBar()
        }
    }
}

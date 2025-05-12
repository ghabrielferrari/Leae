import SwiftUI

//import Charts
struct Gadget: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let icon: String
    let color: Color
    let destination: AnyView
}

struct GadgetCard: View {
    let gadget: Gadget
    let onTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: gadget.icon)
                    .font(.title)
                    .foregroundColor(Color("Highlight"))
                Spacer()
            }
            Text(gadget.title)
                .font(.headline)
                .foregroundColor(Color("Highlight"))
            Text(gadget.description)
                .font(.subheadline)
                .foregroundColor(Color(hex: "FF642F").opacity(0.8))
                .lineLimit(2)
        }
        .padding()
        .frame(width: 215, height: 160)
        .background(gadget.color)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
        .onTapGesture{
            onTap()
        }
    }
}

struct GadgetCarousel: View {
    let gadgets: [Gadget]
    let onTap: (Gadget) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(gadgets) { gadget in
                    GadgetCard(gadget: gadget){
                        onTap(gadget)
                    }
                }
            }
            .padding()
        }
        .padding(10)
    }
}
// explorar
// troca e doacao
// estrutura para tabbar
struct TabBar: View {
    @State var selectedTab = 0
    let isViewActive = false
    var body: some View{
        TabView{
            HomeView()
                .tabItem{
                    Image(systemName: "house")
                        .font(.system(size:25))
                    Text("Home")
                }
                .tag(0)
            
            ExploreView()
                .tabItem{
                    Image(systemName: "globe")
                        .font(.system(size:25))
                    Text("Explorar")
                }
                .tag(1)
            
            NavigationView{
                LibraryView()
            }
                .tabItem{
                    Image(systemName: "book")
                        .font(.system(size:25))
                    Text("Bilioteca")
                }
                .tag(2)
            
            ViewPerfil()
                .tabItem{
                    Image(systemName: "person.circle")
                        .font(.system(size:25))
                    Text("Perfil")
                }
                .tag(3)
        }
        .accentColor(Color("Highlight"))
        .foregroundColor(.black)
    }
}

struct HomeView: View {
    @State private var selectedGadget: Gadget? = nil
    @State private var showSheet = false

    @State private var modalVisible = false
    @State private var showGroupModal = false
    let sampleGadgets = [
        Gadget(
            title: "Leitura Atual",
            description: "Acompanhe sua leitura e progresso atual",
            icon: "books.vertical.fill",
            color: Color(hex: "FFD9CF"),
            destination: AnyView(ViewAtualizacao())
        ),
        Gadget(
            title: "Constância",
            description: "Acompanhe agora seu empenho diário!",
            icon: "flame.fill",
            color: Color(hex: "FFD9CF"),
            destination: AnyView(ViewConstancia())
        )
    ]
    
    var body: some View{
        NavigationView{
            VStack{
                ScrollView{
                    // Carrossel corrigido
                    ScrollView(.horizontal, showsIndicators: false) {
                        GadgetCarousel(gadgets: sampleGadgets) { gadget in
                            selectedGadget = gadget
                            showSheet = true
                        }
                        //                        HStack(spacing: 20) {
                        //                            ForEach(sampleGadgets) { gadget in
                        //                                GadgetCard(gadget: gadget)
                        //                            }
                        //                        }
                        //                                .padding(.horizontal) // Adiciona padding nas laterais
                        //                                .frame(height: 200)  // Altura fixa para o conteúdo
                    }
                    .frame(height: 220)    // Altura fixa para o ScrollView
                    //        NavigationView{
                    ZStack{
                        ListCard(title:"Grupos",
                                 sub: "Leia e discuta com seus amigos",
                                 GroupBook: ["Faz o urro":"Shreck",
                                             "Fãs do Damons":"TVD",
                                             "Self Assestment":"Mente milionaria"])
                            .onTapGesture{
                                showGroupModal = true
                            }                    }
                    .background(
                        NavigationLink(
                            isActive: $showGroupModal,
                            destination: {
                                GroupModal()
                            },
                            label: { EmptyView() }
                        )
                            .hidden()
                            .frame(width: 0, height: 0)
                    )
                    //        }
                    VStack{
                        //          Spacer(minLength: -)
                        TitleStructure(title: "Comentários")
                        Spacer(minLength: -15)
                        //          FakeListStructure(book: ["O Shreck não faz o urro", "Gato de botas é zika do baile", "Lord farcry é poggers"])
                        Comments(UserandComment:["@Felipe__alberto":"Não acredito que fulano fez ISSO. Tô revoltado e ainda faltam 200 páginas :sob:","@Ferrari":"Li por indicação daqui e amei! Que comunidade maravilhosa!","@Vitao":"Esse final acabou comigo :smiling_face_with_tear: Alguém mais aí precisando de terapia depois dessa leitura?","@ErikaHacimoto":"Li por indicação daqui e amei! Que comunidade maravilhosa!","@Rugs":"SHRECK FEZ O URROOOOOOOOO"])
                    }
                }
                .sheet(isPresented: $showSheet) {
                    if selectedGadget?.title == "Leitura Atual" {
                        CustomAtualizacaoView(showSheet: $showSheet)
                    } else {
                        CustomConstanciaView(showSheet: $showSheet)
                    }
                }
                .navigationBarTitle("Resumo")
            }
            .background(Color("Base"))
        }
        //    .navigationViewStyle(.stack)
        //    .ignoresSafeArea(.all, edges: .top)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
// shift + command + k - resetar, rebuild e limpeza de cache
// botao direito + extract = cria struct com funcao selecionada

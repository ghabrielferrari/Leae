import SwiftUI

struct ViewPerfil: View {
    
    let progresso: CGFloat = 0.61 // 61% de exemplo
    let icons = ["book", "square.grid.2x2", "star", "flame"]
    let titulos = ["Biblioteca", "Grupos"]
    let colunas = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State private var diasConstancia: Int = 10
    @State private var foto = "perfilImagem"
    @State private var nome = "Joana Silva"
    @State private var apelido = "@joanasilva"
    @State private var fala = "Sou muito maneiro!"
    @State private var comentarios: [Comentario] = []
    
    @State private var showSheet = false
    
    init() {
        // Inicialização do livro (exemplo fixo)
        let livro = Livro(titulo: "The Great Gatsby",
                          autor: "F. Scott Fitzgerald",
                          genero: "Mystery",
                          sinopse: "",
                          imagemCapa: "")
        
        // Inicialização do usuário
        let usuario = Usuario(
            foto: "",
            apelido: "@VitorLacerda",
            nome: "Vitor Lacerda",
            email: "",
            senha: "",
            livroAtual: livro,
            gruposUsuario: [],
            missoes: [],
            comentarios: []
        )
        
        // Inicialização dos comentários
        _comentarios = State(initialValue: [
            Comentario(livro: livro, usuario: usuario, texto: "Ótima interface!", curtidas: 10, comentarios: []),
            Comentario(livro: livro, usuario: usuario, texto: "O layout poderia ser mais clean", curtidas: 3, comentarios: [])
        ])
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.backgroundBase
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        Spacer()
                        
                        Image(foto)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 230, height: 230)
                            .clipShape(Circle())
                        
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("Aline Almeida")
                                    .foregroundColor(Color.textPrimary)
                                    .font(.system(size: 25))
                                
                                Text(apelido)
                                    .foregroundColor(Color.primaryHover)
                                
                                Text(fala)
                                    .foregroundColor(Color.textPrimary)
                                    .padding(.top, -5)
                            }
                            
                            Spacer()
                            
                            ZStack {
                                Button(action: {showSheet = true} ) {
                                    Rectangle()
                                        .fill(Color.secundaryDefault)
                                        .frame(width: 70, height: 40)
                                    .cornerRadius(20)                                }
                                .background( ConstanciaPresenter(isPresented: $showSheet) {CustomConstanciaView(showSheet: $showSheet)} )
                                
                                HStack {
                                    Image(systemName: "flame")
                                        .foregroundColor(Color.accentHighlight)
                                        .font(.system(size: 20))
                                    
                                    Text(String(diasConstancia))
                                        .foregroundColor(Color.textPrimary)
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        VStack {
                            HStack{
                                NavigationLink(destination: LibraryView()) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.secundaryBackground)
                                            .frame(height: 60)
                                        
                                        Rectangle()
                                            .fill(Color.secundaryDefault)
                                            .frame(width: 30, height: 30)
                                            .cornerRadius(10)
                                            .padding(.trailing, 120)
                                        
                                        Image(systemName: icons[0])
                                            .foregroundColor(Color.accentHighlight)
                                            .padding(.trailing, 120)
                                        
                                        Text(titulos[0])
                                            .foregroundColor(Color.accentHighlight)
                                            .padding(.leading, 20)
                                    }
                                }
                                
                                NavigationLink(destination: GroupModal()) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.secundaryBackground)
                                            .frame(height: 60)
                                        
                                        Rectangle()
                                            .fill(Color.secundaryDefault)
                                            .frame(width: 30, height: 30)
                                            .cornerRadius(10)
                                            .padding(.trailing, 120)
                                        
                                        Image(systemName: icons[1])
                                            .foregroundColor(Color.accentHighlight)
                                            .padding(.trailing, 120)
                                        
                                        Text(titulos[1])
                                            .foregroundColor(Color.accentHighlight)
                                            .padding(.leading, 20)
                                    }
                                }
                            }
                            .padding(.horizontal)
                            
                            VStack {
                                Spacer(minLength: 50)
                                Text("Meus comentários")
                                    .font(.system(size: 25))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal)
                                    .padding(-10)
                                    .offset(x: 10)
                                
                                Comments(UserandComment:["@joanasilva":"Não acredito que fulano fez ISSO. Tô revoltado e ainda faltam 200 páginas :sob:"])
                                    .padding(5)
                                Comments(UserandComment: ["@joanasilva":"Li por indicação daqui e amei! Que comunidade maravilhosa!"])
                                    .padding(5)
                                    .offset(y: -30)
                            }
                        }
                    }
                }
                .navigationTitle("Meu Perfil")
            }
        }
    }
}

struct PerfilProprio_Previews: PreviewProvider {
    static var previews: some View {
        ViewPerfil()
    }
}


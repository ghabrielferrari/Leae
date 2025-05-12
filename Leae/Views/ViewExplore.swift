import SwiftUI

struct ExploreView: View {
    // Mock data for books and reviews
    let recommendedBooks = [
        ExploreBook(title: "O Outro Lado do Ponto da Virada", author: "Malcolm Gladwell"),
        ExploreBook(title: "Entre Fogo e Espinhos", author: "Elizabeth Heiten"),
        ExploreBook(title: "Uma Vida para a Ciência", author: "Stephen Jay Gould"),
        ExploreBook(title: "Sapiens", author: "Yuval Noah Harari")
    ]
    
    let highlightedBooks = [
        ExploreBook(title: "O Alquimista", author: "Paulo Coelho"),
        ExploreBook(title: "Phantasm", author: "Kylie Smith"),
        ExploreBook(title: "O Nome da Rosa", author: "Umberto Eco"),
        ExploreBook(title: "O Código Da Vinci", author: "Dan Brown")
    ]
    
    let popularReviews = [
        Review(username: "@maria_dorineves", text: "Esse final acabou comigo 😭 Alguém mais aí precisando de terapia depois dessa leitura?"),
        Review(username: "@peter.alvarez", text: "Um manual essencial para qualquer pessoa interessada em ciência.")
    ]
    
    let factBasedBooks = [
        ExploreBook(title: "Lance Livre", author: "Eduardo Guardia"),
        ExploreBook(title: "Estado, Economia e Reformas Estruturais no Brasil", author: "Jamie Hamrow"),
        ExploreBook(title: "9 Kind of Magic", author: "Mark Haddon"),
        ExploreBook(title: "O Elmo do Pensador", author: "Edward de Bono")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Barra de Pesquisa
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(8)
                        
                        TextField("Pesquisar", text: .constant(""))
                            .textFieldStyle(PlainTextFieldStyle())
                        
                        Button(action: {}) {
                            Image(systemName: "mic.fill")
                                .foregroundColor(.gray)
                                .padding(8)
                        }
                    }
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    // Seção "Para você"
                    Text("Para você")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(recommendedBooks, id: \.title) { book in
                                ExploreBookCard(book: book)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Seção "Destaques da galera"
                    Text("Destaques da galera")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(highlightedBooks, id: \.title) { book in
                                ExploreBookCard(book: book)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Seção "Resenhas mais relevantes"
                    Text("Resenhas mais relevantes")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(popularReviews, id: \.username) { review in
                            ReviewCard(review: review)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Seção "Baseados em fatos"
                    Text("Baseados em fatos")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(factBasedBooks, id: \.title) { book in
                                ExploreBookCard(book: book)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 8)
            }
            .background(Color("Base"))
            .navigationTitle("Explorar")
        }
        //        .toolbar {
        //            ToolbarItem(placement: .navigationBarTrailing) {
        //                Image(systemName: "bell")
        //            }
        //        }
        //        .tabItem {
        //            Label("Explorar", systemImage: "magnifyingglass")
        //        }
    }
}

// Struct para representar um livro
struct ExploreBook: Identifiable {
    let id = UUID()
    let title: String
    let author: String
}

// Visualização do cartão de livro
struct ExploreBookCard: View {
    let book: ExploreBook
    
    var body: some View {
        NavigationLink(destination: LivroView()){
            VStack {
                Image("capa")//book.title) // Substituir pela imagem real do livro
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 150)
                    .cornerRadius(7)
                
                Text(book.title)
                    .font(.headline)
                    .lineLimit(1)
                    .multilineTextAlignment(.center)
                    .frame(width: 120, height: 15, alignment: .top)
                    .padding(.top, 8)
                
                Text(book.author)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(5)
    }
}

// Struct para representar uma resenha
struct Review: Identifiable {
    let id = UUID()
    let username: String
    let text: String
}

// Visualização do cartão de resenha
struct ReviewCard: View {
    let review: Review
    
    var body: some View {
        HStack(spacing: 16) {
            Circle()
                .fill(Color.gray)
                .frame(width: 40, height: 40)
                .offset(x: 0)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(review.username)
                    .font(.headline)
                
                Text(review.text)
                    .font(.body)
                    .lineLimit(3)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(20)
        .frame(width: 344, height: 120, alignment: .center)
        .background(Color(UIColor.systemPink).opacity(0.2))
        .cornerRadius(10)
    }
}

// Preview
struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

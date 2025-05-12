import SwiftUI

struct LibraryView: View {
    // Estado para controlar o filtro selecionado
    @State private var selectedFilter: BookStatus = .reading
    
    // Simulando uma lista de livros (com mais livros adicionados)
    let books: [LibraryBook] = [
        LibraryBook(title: "Título do livro 1", author: "Autor 1", coverImage: Image("book1"), status: .reading),
        LibraryBook(title: "Título do livro 2", author: "Autor 2", coverImage: Image("book2"), status: .wantToRead),
        LibraryBook(title: "Título do livro 3", author: "Autor 3", coverImage: Image("book3"), status: .abandoned),
        LibraryBook(title: "Título do livro 4", author: "Autor 4", coverImage: Image("book4"), status: .have),
        LibraryBook(title: "Título do livro 5", author: "Autor 5", coverImage: Image("book5"), status: .reading),
        LibraryBook(title: "Título do livro 6", author: "Autor 6", coverImage: Image("book6"), status: .wantToRead),
        LibraryBook(title: "Título do livro 7", author: "Autor 7", coverImage: Image("book7"), status: .abandoned),
        LibraryBook(title: "Título do livro 8", author: "Autor 8", coverImage: Image("book8"), status: .have),
        LibraryBook(title: "Título do livro 9", author: "Autor 9", coverImage: Image("book9"), status: .reading),
        LibraryBook(title: "Título do livro 10", author: "Autor 10", coverImage: Image("book10"), status: .wantToRead),
        LibraryBook(title: "Título do livro 11", author: "Autor 11", coverImage: Image("book11"), status: .abandoned),
        LibraryBook(title: "Título do livro 12", author: "Autor 12", coverImage: Image("book12"), status: .have),
        LibraryBook(title: "Título do livro 13", author: "Autor 13", coverImage: Image("book13"), status: .reading),
        LibraryBook(title: "Título do livro 14", author: "Autor 14", coverImage: Image("book14"), status: .wantToRead),
        LibraryBook(title: "Título do livro 15", author: "Autor 15", coverImage: Image("book15"), status: .abandoned),
        LibraryBook(title: "Título do livro 16", author: "Autor 16", coverImage: Image("book16"), status: .wantToRead),
        LibraryBook(title: "Título do livro 17", author: "Autor 17", coverImage: Image("book17"), status: .wantToRead),
        LibraryBook(title: "Título do livro 18", author: "Autor 18", coverImage: Image("book18"), status: .wantToRead),
        LibraryBook(title: "Título do livro 19", author: "Autor 19", coverImage: Image("book19"), status: .abandoned),
        LibraryBook(title: "Título do livro 20", author: "Autor 20", coverImage: Image("book20"), status: .have),
        LibraryBook(title: "Título do livro 21", author: "Autor 21", coverImage: Image("book21"), status: .reading),
        LibraryBook(title: "Título do livro 22", author: "Autor 22", coverImage: Image("book22"), status: .wantToRead),
        LibraryBook(title: "Título do livro 23", author: "Autor 23", coverImage: Image("book23"), status: .wantToRead),
        LibraryBook(title: "Título do livro 24", author: "Autor 24", coverImage: Image("book24"), status: .have)
    ]
    
    var body: some View {
            VStack(spacing: 16) {
                // Barra de navegação superior
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
                
                // Filtros
                HStack {
                    ForEach(BookStatus.allCases, id: \.self) { status in
                        Button(action: {
                            selectedFilter = status
                        }) {
                            Text(status.rawValue.capitalized)
                                .padding(7)
                                .background(selectedFilter == status ? Color("Highlight") : Color.clear)
                                .foregroundColor(selectedFilter == status ? .white : .black)
                                .cornerRadius(8)
                        }
                    }
                }
                .padding(.horizontal)
                
                // Grid de livros com ScrollView
                ScrollView {
                    Spacer(minLength: 5)
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 100)), count: 3), spacing: 16) {
                        ForEach(filteredBooks) { book in
                            BookCard(book: book)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top, 8)
            .background(Color("Base"))
            .navigationTitle("Minha Biblioteca")
    }
    
    // Filtrar livros com base no estado selecionado
    private var filteredBooks: [LibraryBook] {
        if selectedFilter == .reading {
            return books.filter { $0.status == .reading }
        } else if selectedFilter == .wantToRead {
            return books.filter { $0.status == .wantToRead }
        } else if selectedFilter == .abandoned {
            return books.filter { $0.status == .abandoned }
        } else if selectedFilter == .have {
            return books.filter { $0.status == .have }
        }
        return books
    }
}

// Cartão de livro
struct BookCard: View {
    let book: LibraryBook
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            NavigationLink(destination: MeuLivroView()){
                book.coverImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 130)
                    .cornerRadius(8)
            }
            
            NavigationLink(destination: MeuLivroView()){
                Text(book.title)
                    .font(.headline)
                    .lineLimit(2)
                    .minimumScaleFactor(0.7)
                    .multilineTextAlignment(.leading)
            }
                
            Text(book.author)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}

// Modelo de dados para os livros
struct LibraryBook: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let coverImage: Image
    let status: BookStatus
}

// Enum para representar o status do livro
enum BookStatus: CaseIterable {
    case reading
    case wantToRead
    case abandoned
    case have
    
    var rawValue: String {
        switch self {
        case .reading:
            return "Lendo"
        case .wantToRead:
            return "Quero Ler"
        case .abandoned:
            return "Abandonei"
        case .have:
            return "Tenho"
        }
    }
}

struct ViewLibraryPreviews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

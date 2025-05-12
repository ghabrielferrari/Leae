import SwiftUI

class GroupData {
  static let shared = GroupData()
  private init() {}
  var GroupBooks: [String: String] = [
    "Faz o urro": "Shreck",
    "Fãs do Damon": "TVD",
    "Self Assessment": "Mente milionária",
    "Clube do Livro": "1984",
    "Amantes de Fantasia": "Senhor dos Anéis",
    "Romance Club": "Orgulho e Preconceito",
    "Ficção Científica": "Duna",
    "Mistério e Suspense": "Garota Exemplar"
  ]
}

struct GroupModal: View {
  var GroupBooks: [String: String] {
    GroupData.shared.GroupBooks
  }
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      // Header with back button and title
//      HStack {
//        // Centered title
//        Text("Grupos")
//          .font(.largeTitle)
//          .fontWeight(.medium)
//          .frame(maxWidth: .infinity, alignment: .topLeading)
//
//      }
//      .padding(.horizontal, 20)
//      .padding(.top, 16)
//      .padding(.bottom, 50) // Adicionado espaço abaixo do cabeçalho
      // List items with ScrollView
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .leading, spacing: 12) {
          ForEach(Array(GroupBooks.keys.sorted()), id: \.self) { group in
              if let book = GroupBooks[group] {
                  NavigationLink(destination: GroupView()){
                      VStack(alignment: .leading, spacing: 6) {
                          Text(group)
                              .font(.system(size: 16, weight: .light))
                          HStack {
                              Text(book)
                                  .font(.caption)
                                  .fontWeight(.light)
                              Spacer()
                              Image(systemName:"chevron.right")
                                  .foregroundColor(Color(hex: "6F230F"))
                          }
                      }
                      .padding(.vertical, 8)
                      Divider()
                          .padding(.leading, -20) // Alinha o divisor com a margem
                  }
              }
          }
        }
        .padding(.horizontal, 20)
      }
      .background(Color("Base"))
    }
    .navigationBarTitle("Grupos")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct GroupModalView: PreviewProvider {
  static var previews: some View {
    NavigationView {
      GroupModal()
    }
  }
}

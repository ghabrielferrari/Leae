import SwiftUI

struct LivroView: View {
    @State private var meu: Bool = false
    
    @State private var titulo: String = "Ainda estou aqui"
    @State private var capa: String = "capa"
    @State private var autor: String = "Marcelo Rubens Paiva"
    @State private var sinopse: String = "No início da década de 1970, o Brasil enfrenta o endurecimento da ditadura militar. No Rio de Janeiro, a família Paiva - Rubens, Eunice e seus cinco filhos - vive à beira da praia em uma casa de portas abertas para os amigos. Um dia, Rubens Paiva é levado por militares à paisana e desaparece. Eunice - cuja busca pela verdade sobre o destino de seu marido se estenderia por décadas - é obrigada a se reinventar e traçar um novo futuro para si e seus filhos."
    
    @State private var av_5: String = "153"
    @State private var av_4: String = "120"
    @State private var av_3: String = "45"
    @State private var av_2: String = "19"
    @State private var av_1: String = "28"
    
    @State private var showGroupModal = false
    
    var body: some View {
        ZStack {
            Color("Base").ignoresSafeArea()
            ScrollView{
                VStack{
                    VStack{
                        Image(capa)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 250)
                            .cornerRadius(10)
                        Text(titulo).bold()
                        Text(autor)
                    }
                    Spacer(minLength: 20)
                    VStack{
                        Text("Sinopse")
                            .fontWeight(.bold)
                            .font(Font.custom("SF Pro Text", size: 20))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("Highlight"))
                            .frame(maxWidth: 305, alignment: .leading)
                        ZStack{
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                .fill(Color("Background"))
                                .frame(width: 344, height: 150)
                            ScrollView{
                                Text(sinopse)
                                    .foregroundColor(Color("Highlight"))
                                    .frame(width: 300, height: 140, alignment: .leading)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(5)
                            }
                        }
                    }
                    Spacer(minLength: 20)
                    VStack{
                        Text("Avaliações")
                            .fontWeight(.bold)
                            .font(Font.custom("SF Pro Text", size: 20))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("Highlight"))
                            .frame(maxWidth: 305, alignment: .leading)
                        ZStack {
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                .stroke(Color("Hover"))
                                .frame(width: 340, height: 200)
                            HStack {
                                VStack {
                                    Text("(\(av_5))")
                                        .font(Font.custom("SF Pro Text", size: 22))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color("Highlight"))
                                        .frame(maxWidth: 80, alignment: .trailing)
                                        .padding(1)
                                    Text("(\(av_4))")
                                        .font(Font.custom("SF Pro Text", size: 22))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color("Highlight"))
                                        .frame(maxWidth: 80, alignment: .trailing)
                                        .padding(1)
                                    Text("(\(av_3))")
                                        .font(Font.custom("SF Pro Text", size: 22))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color("Highlight"))
                                        .frame(maxWidth: 80, alignment: .trailing)
                                        .padding(1)
                                    Text("(\(av_2))")
                                        .font(Font.custom("SF Pro Text", size: 22))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color("Highlight"))
                                        .frame(maxWidth: 80, alignment: .trailing)
                                        .padding(1)
                                    Text("(\(av_1))")
                                        .font(Font.custom("SF Pro Text", size: 22))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color("Highlight"))
                                        .frame(maxWidth: 80, alignment: .trailing)
                                        .padding(1)
                                }
                                Image("Avaliacoes")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 190, height: 190)
                            }
                            
                        }
                        
                    }
                    Spacer(minLength: 40)
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
                    Spacer(minLength: 20)
                    Button(action: { meu.toggle() } ) {
                        if meu {
                            Text("Remover")
                                .font(Font.custom("SF Pro Text", size: 18))
                                .foregroundColor(Color("Highlight"))
                                .frame(width: 344, height:50)
                                .background(Color(hex: "#F48B8B"))
                                .cornerRadius(100)
                        } else {
                            Text("Adicionar")
                                .font(Font.custom("SF Pro Text", size: 18))
                                .foregroundColor(Color("Highlight"))
                                .frame(width: 344, height:50)
                                .background(Color(hex: "#FFAF9A"))
                                .cornerRadius(100)
                        }
                    }
                    Spacer()
                }
            }
            .navigationTitle("Livro")
        }
    }
}

struct LivroPreviews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

struct ListCard_Livro: View {
    let title: String
    let sub: String
    let GroupBook: [String: String]
    
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            // Background card (only one cornerRadius modifier needed)
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color("Background"))
                .frame(width: 344, height: 285)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 3, y: 0)
            
            // Content
            VStack(alignment: .leading, spacing: 10) {
                // Title
                Text(title)
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color("Highlight"))
                    .padding(.top, 16)
                    .padding(.horizontal, 20)
                
                Text(sub)
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.black.opacity(0.8))
                    .padding(.top, -5)
                    .padding(.horizontal, 23)
                
                
                Spacer()
                
                // List items
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(Array(GroupBook.keys.sorted()), id: \.self) { group in
                        if let book = GroupBook[group] {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(group)
                                    .font(.system(size: 16, weight: .light))
                                HStack{
                                    Text(book)
                                        .font(.caption)
                                        .fontWeight(.light)
                                    //                                HStack{
                                    Spacer()
                                    Image(systemName:"chevron.right")
                                        .foregroundColor(Color("Highlight"))
                                }
                            }
                            Divider()
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 16)
            }
            .frame(width: 343, height: 140, alignment: .topLeading)
        }
    }
}

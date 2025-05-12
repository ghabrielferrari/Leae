import SwiftUI

struct MeuLivroView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var naEstante: Bool = true
    
    @State private var dataDeInicio: String = ""
    @State private var dataDeFinal: String = ""
    @State private var tenho: Bool = false
    @State private var showSheet = false
    
    var body: some View {
        ZStack{
            Color("Base").ignoresSafeArea()
            ScrollView (.vertical, showsIndicators: false) {
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(Color("Background"))
                            .frame(width: 344, height: 100)
                        VStack{
                            HStack {
                                Image("dataInicial")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .frame(maxWidth: 120, alignment: .center)
                                TextField("Data de Início", text: $dataDeInicio)
                                    .font(Font.custom("SF Pro Text", size: 18))
                                    .keyboardType(.numberPad)
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: 344, alignment: .center)
                                    .offset(x: -55)
                            }
                            HStack {
                                Image("dataFinal")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .frame(maxWidth: 120, alignment: .center)
                                TextField("Data de Término", text: $dataDeFinal)
                                    .font(Font.custom("SF Pro Text", size: 18))
                                    .keyboardType(.numberPad)
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: 344, alignment: .center)
                                    .offset(x: -50)
                            }
                        }
                    }
                    .padding(15)
                    ZStack {
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(Color("Background"))
                            .frame(width: 344, height: 100)
                        HStack {
                            Image("atualize")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                            Button("Atualizar Leitura") {
                                showSheet = true
                            }
                            .background( AtualizacaoPresenter(isPresented: $showSheet) {CustomAtualizacaoView(showSheet: $showSheet)} )
                            .font(Font.custom("SF Pro Text", size: 18))
                            .foregroundColor(Color("Highlight"))
                        }
                    }
                    Spacer(minLength: 20)
                    ZStack{
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(Color("Background"))
                            .frame(width: 344, height: 100)
                        HStack{
                            Button(action: { tenho.toggle() } ) {
                                HStack {
                                    if tenho {
                                        Image(systemName: "checkmark.circle")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 25, height: 25)
                                    } else {
                                        Image(systemName: "circle")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 25, height: 25)
                                    }
                                    Text("Tenho")
                                        .font(Font.custom("SF Pro Text", size: 18))
                                }
                                .padding()
                                .foregroundColor(Color("Highlight"))
                                .background(Color("Background"))
                                .cornerRadius(8)
                            }
                        }
                    }
                }
                Spacer(minLength: 160)
                VStack{
                    Button("Remover da Estante") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .font(Font.custom("SF Pro Text", size: 18))
                    .foregroundColor(Color("Highlight"))
                    .frame(width: 344, height:80)
                    .background(Color(hex: "#F48B8B"))
                    .cornerRadius(20)
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .navigationTitle("Meu Livro")
            }
        }
    }
}
    
struct ViewMeuLivroPreviews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

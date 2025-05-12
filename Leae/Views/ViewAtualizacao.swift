import SwiftUI

struct ViewAtualizacao: View {
    @State private var showSheet = false
    
    var body: some View {
        Button("Atualizar Leitura") {
            showSheet = true
        }
        .background( AtualizacaoPresenter(isPresented: $showSheet) {CustomAtualizacaoView(showSheet: $showSheet)} )
    }
}

struct ViewAtualizacao_Previews: PreviewProvider {
    static var previews: some View {
        ViewAtualizacao()
    }
}

struct AtualizacaoPresenter<Content: View>: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    var content: () -> Content

    class Coordinator {
        var parent: AtualizacaoPresenter
        weak var presentedVC: UIViewController?

        init(parent: AtualizacaoPresenter) {
            self.parent = parent
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Apresenta o modal se for true e ainda não estiver sendo apresentado
        if isPresented, context.coordinator.presentedVC == nil {
            let hostingController = UIHostingController(rootView: content())
            hostingController.modalPresentationStyle = .pageSheet

            if let sheet = hostingController.sheetPresentationController {
                sheet.detents = [.large()]
                sheet.prefersGrabberVisible = true
                sheet.preferredCornerRadius = 30
            }

            uiViewController.present(hostingController, animated: true)
            context.coordinator.presentedVC = hostingController
        }
        // Fecha o modal se o binding foi alterado para false
        else if !isPresented, let presented = context.coordinator.presentedVC {
            presented.dismiss(animated: true) {
                context.coordinator.presentedVC = nil
            }
        }
    }
}

struct CustomAtualizacaoView: View {
    @Binding var showSheet: Bool
    
    @State private var isOn_one: Bool = false
    @State private var isOn_two: Bool = false
    @State private var comentario: String = ""
    @State private var progresso: String = ""
    
    var body: some View {
        VStack{
            HStack(alignment: .center, spacing: 0) {
                Text("Atualização")
                    .font(
                        Font.custom("SF Pro Text", size: 20)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("Highlight"))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(width: 150, alignment: .center)
                Button(action: {showSheet = false}) {
                    Text("Salvar")
                        .font(
                            Font.custom("SF Pro Text", size: 15)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("Hover"))
                        .frame(maxWidth: 90, alignment: .trailing)
                }
            }
            .frame(width: .infinity, height: 30, alignment: .center)
            .offset(x: 45)
            .padding(5)
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 344, height: 297)
                    .background(Color("Background"))
                    .cornerRadius(15)
                Spacer().frame(height: 20)
                TextField("Escreva um comentário (opcional)", text: $comentario)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(x: 20, y: -120)
                Text(isOn_one ? "Contém Spoiler" : "Contém Spoiler")
                    .foregroundColor(isOn_one ? Color("Highlight") : Color("Hover"))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(x: 20, y: 120)
                Toggle("", isOn: $isOn_one)
                    .toggleStyle(SwitchToggleStyle(tint: Color("Highlight")))
                    .padding()
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .offset(x: -5, y: 120)
            }
            .padding(5)
            ZStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 344, height: 100)
                    .background(Color("Background"))
                    .cornerRadius(15)
                TextField("Registre seu progresso aqui", text: $progresso)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(x: 20, y: -25)
                HStack {
                    Text("Páginas")
                        .foregroundColor(!isOn_two ? Color("Highlight") : Color("Hover"))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Toggle("", isOn: $isOn_two)
                        .labelsHidden()
                        .toggleStyle(SwitchToggleStyle(tint: Color("Highlight")))
                    
                    Text("Porcentagem")
                        .foregroundColor(!isOn_two ? Color("Hover") : Color("Highlight"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .scaleEffect(0.9)
                .padding()
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
                .offset(y:23)
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Base"))
    }
}

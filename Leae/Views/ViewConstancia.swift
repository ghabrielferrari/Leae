import SwiftUI

struct ViewConstancia: View {
    @State private var showSheet = false
    
    var body: some View {
        Button("Progresso") {
            showSheet = true
        }
        .background( ConstanciaPresenter(isPresented: $showSheet) {CustomConstanciaView(showSheet: $showSheet)} )
    }
}

struct ConstanciaPreviews: PreviewProvider {
    static var previews: some View {
        ViewConstancia()
    }
}

struct ConstanciaPresenter<Content: View>: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    var content: () -> Content
    
    class Coordinator {
        var parent: ConstanciaPresenter
        weak var presentedVC: UIViewController?
        
        init(parent: ConstanciaPresenter) {
            self.parent = parent
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
                parent.isPresented = false
                presentedVC = nil
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


struct CustomConstanciaView: View {
    @Binding var showSheet: Bool
    
    @State private var dom: Bool = false
    @State private var seg: Bool = false
    @State private var ter: Bool = false
    @State private var qua: Bool = false
    @State private var qui: Bool = false
    @State private var sex: Bool = false
    @State private var sab: Bool = false
    
    @State private var resultado_rdc: String = "000"
    @State private var resultado_rsc: String = "000"
    @State private var resultado_dc: String = "000"
    @State private var resultado_sc: String = "000"
    
    @State private var recorde_sem: String = "6 de junho - 2 de setembro"
    @State private var recorde_dias: String = "6 de junho - 4 de setembro"
    
    var body: some View {
        VStack{
            HStack(alignment: .center, spacing: 0) {
                Text("Constância")
                    .font(
                        Font.custom("SF Pro Text", size: 20)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("Highlight"))
                    .frame(maxWidth: 344, alignment: .center)
                    .offset(y: 15)
            }
            .frame(width: .infinity, height: 30, alignment: .center)
            .padding(5)
            VStack{
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 344, height: 140)
                        .background(Color("Background"))
                        .cornerRadius(10)
                        .padding()
                    VStack {
                        HStack{
                            VStack {
                                if dom {
                                    Image("Streak")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .offset(y: 20)
                                    Text("Dom")
                                        .font(Font.custom("SF Pro Text", size: 20))
                                        .foregroundColor(Color("Highlight"))
                                        .offset(y: 15)
                                } else {
                                    Image("NoStreak")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .offset(y: 20)
                                    Text("Dom")
                                        .font(Font.custom("SF Pro Text", size: 20))
                                        .foregroundColor(Color("Highlight"))
                                        .offset(y: 20)
                                }
                            }
                            VStack {
                                if seg {
                                    Image("Streak")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .offset(y: 20)
                                    Text("Seg")
                                        .font(Font.custom("SF Pro Text", size: 20))
                                        .foregroundColor(Color("Highlight"))
                                        .offset(y: 15)
                                } else {
                                    Image("NoStreak")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .offset(y: 20)
                                    Text("Seg")
                                        .font(Font.custom("SF Pro Text", size: 20))
                                        .foregroundColor(Color("Highlight"))
                                        .offset(y: 20)
                                }
                            }
                            VStack {
                                if ter {
                                    Image("Streak")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .offset(y: 20)
                                    Text("Ter")
                                        .font(Font.custom("SF Pro Text", size: 20))
                                        .foregroundColor(Color("Highlight"))
                                        .offset(y: 15)
                                } else {
                                    Image("NoStreak")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .offset(y: 20)
                                    Text("Ter")
                                        .font(Font.custom("SF Pro Text", size: 20))
                                        .foregroundColor(Color("Highlight"))
                                        .offset(y: 20)
                                }
                            }
                            VStack {
                                if qua {
                                    Image("Streak")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .offset(y: 20)
                                    Text("Qua")
                                        .font(Font.custom("SF Pro Text", size: 20))
                                        .foregroundColor(Color("Highlight"))
                                        .offset(y: 15)
                                } else {
                                    Image("NoStreak")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .offset(y: 20)
                                    Text("Qua")
                                        .font(Font.custom("SF Pro Text", size: 20))
                                        .foregroundColor(Color("Highlight"))
                                        .offset(y: 20)
                                }
                            }
                            VStack {
                                if qui {
                                    Image("Streak")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .offset(y: 20)
                                    Text("Qui")
                                        .font(Font.custom("SF Pro Text", size: 20))
                                        .foregroundColor(Color("Highlight"))
                                        .offset(y: 15)
                                } else {
                                    Image("NoStreak")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .offset(y: 20)
                                    Text("Qui")
                                        .font(Font.custom("SF Pro Text", size: 20))
                                        .foregroundColor(Color("Highlight"))
                                        .offset(y: 20)
                                }
                            }
                            VStack {
                                if sex {
                                    Image("Streak")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .offset(y: 20)
                                    Text("Sex")
                                        .font(Font.custom("SF Pro Text", size: 20))
                                        .foregroundColor(Color("Highlight"))
                                        .offset(y: 15)
                                } else {
                                    Image("NoStreak")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .offset(y: 20)
                                    Text("Sex")
                                        .font(Font.custom("SF Pro Text", size: 20))
                                        .foregroundColor(Color("Highlight"))
                                        .offset(y: 20)
                                }
                            }
                            VStack {
                                if sab {
                                    Image("Streak")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .offset(y: 20)
                                    Text("Sab")
                                        .font(Font.custom("SF Pro Text", size: 20))
                                        .foregroundColor(Color("Highlight"))
                                        .offset(y: 15)
                                } else {
                                    Image("NoStreak")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .offset(y: 20)
                                    Text("Sab")
                                        .font(Font.custom("SF Pro Text", size: 20))
                                        .foregroundColor(Color("Highlight"))
                                        .offset(y: 20)
                                }
                            }
                        }
                        .padding()
                    }
                    Text("Esta Semana")
                        .font(
                            Font.custom("SF Pro Text", size: 20)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("Highlight"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(x: 30, y: -40)
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 344, height: 300)
                        .background(Color("Background"))
                        .cornerRadius(10)
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width:  148, height: 150)
                            .background(Color("SecundaryDefault"))
                            .cornerRadius(10)
                            .offset(x: -83, y: 50)
                        Text("Semanas Consecutivas")
                            .font(
                                Font.custom("SF Pro Text", size: 16)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("Highlight"))
                            .frame(maxWidth: 148, alignment: .center)
                            .offset(x: -85, y: 10)
                        Text("\(resultado_sc)")
                            .font(
                                Font.custom("SF Pro Text", size: 64)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("Highlight"))
                            .frame(maxWidth: 130, alignment: .center)
                            .offset(x: -85, y: 75)
                    }
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width:  148, height: 150)
                            .background(Color("SecundaryDefault"))
                            .cornerRadius(10)
                            .offset(x: 83, y: 50)
                        Text("Dias Consecutivos")
                            .font(
                                Font.custom("SF Pro Text", size: 16)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("Highlight"))
                            .frame(maxWidth: 130, alignment: .center)
                            .offset(x: 85, y: 10)
                        Text("\(resultado_dc)")
                            .font(
                                Font.custom("SF Pro Text", size: 64)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("Highlight"))
                            .frame(maxWidth: 130, alignment: .center)
                            .offset(x: 85, y: 75)
                    }
                    Image("Streak")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .offset(y: -110)
                    Text("Ofensivas Atuais")
                        .font(
                            Font.custom("SF Pro Text", size: 32)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("Highlight"))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .offset(y: -65)
                }
            }
            Spacer().frame(height: 20)
            ScrollView(.horizontal){
                HStack{
                    Spacer().frame(width: 10)
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 324, height: 185)
                            .background(Color("Background"))
                            .cornerRadius(10)
                            .padding(5)
                        Text("Recorde de Semanas")
                            .font(
                                Font.custom("SF Pro Text", size: 28)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("Highlight"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(x: 25, y: -60)
                        Text("Consecutivas")
                            .font(
                                Font.custom("SF Pro Text", size: 28)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("Highlight"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(x: 25, y: -30)
                        Text(resultado_rsc)
                            .font(
                                Font.custom("SF Pro Text", size: 64)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("Highlight"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(x: 25, y: 15)
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 324, height: 45)
                                .background(Color("SecundaryDefault"))
                                .cornerRadius(10)
                                .padding(5)
                                .offset(y:70)
                            Text(recorde_sem)
                                .font(
                                    Font.custom("SF Pro Text", size: 20)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color("Highlight"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .offset(x: 25, y: 68)
                        }
                    }
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 324, height: 185)
                            .background(Color("Background"))
                            .cornerRadius(10)
                        Text("Recorde de Dias")
                            .font(
                                Font.custom("SF Pro Text", size: 28)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("Highlight"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(x: 25, y: -60)
                        Text("Consecutivos")
                            .font(
                                Font.custom("SF Pro Text", size: 28)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("Highlight"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(x: 25, y: -30)
                        Text(resultado_rdc)
                            .font(
                                Font.custom("SF Pro Text", size: 64)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("Highlight"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(x: 25, y: 15)
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 324, height: 45)
                                .background(Color("SecundaryDefault"))
                                .cornerRadius(10)
                                .padding(5)
                                .offset(y:70)
                            Text(recorde_dias)
                                .font(
                                    Font.custom("SF Pro Text", size: 20)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color("Highlight"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .offset(x: 25, y: 68)
                        }
                    }
                }
            }
            Spacer()
        }
        .padding(10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Base"))
        Spacer()
    }
}

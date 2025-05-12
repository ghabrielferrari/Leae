import Foundation

class ViewModelComentario: ObservableObject {
    @Published var comentarios: [Comentario]

    init(comentarios: [Comentario]) {
        self.comentarios = comentarios
    }

    func adicionarComentario(_ comentario: Comentario) {
        comentarios.append(comentario)
    }

    func removerComentario(_ comentario: Comentario) {
        if let index = comentarios.firstIndex(where: { $0 === comentario }) {
            comentarios.remove(at: index)
        }
    }

    func atualizarComentario(at index: Int, com novoComentario: Comentario) {
        if index >= 0 && index < comentarios.count {
            comentarios[index] = novoComentario
        }
    }

    func quantidadeDeComentarios() -> Int {
        return comentarios.count
    }
}

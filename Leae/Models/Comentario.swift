import Foundation

class Comentario {
    
    private var _livro: Livro
    private var _usuario: Usuario
    private var _curtidas: Int
    private var _comentarios: [Comentario]
    private var _texto: String
    

    init(livro: Livro, usuario: Usuario, texto: String, curtidas: Int = 0, comentarios: [Comentario] = []) {
        self._livro = livro
        self._usuario = usuario
        self._texto = texto
        self._curtidas = curtidas
        self._comentarios = comentarios
    }
    
    var livro: Livro {
        get { return _livro }
        set { _livro = newValue }
    }
    
    var usuario: Usuario {
        get { return _usuario }
        set { _usuario = newValue }
    }
    
    var curtidas: Int {
        get { return _curtidas }
        set { _curtidas = newValue }
    }
    
    var comentarios: [Comentario] {
        get { return _comentarios }
        set { _comentarios = newValue }
    }
    
    var texto: String {
        get { return _texto }
        set { _texto = newValue }
    }
    
    
    // Função para adicionar um comentário à lista de comentários
    func adicionarComentario(_ comentario: Comentario) {
        _comentarios.append(comentario)
    }
    
    // Função para aumentar a quantidade de curtidas
    func curtir() {
        _curtidas += 1
    }
    
    // Função para diminuir a quantidade de curtidas
    func descurtir() {
        if _curtidas > 0 {
            _curtidas -= 1
        }
    }
}

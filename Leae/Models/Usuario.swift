import Foundation

class Usuario {
    
    private var _foto: String
    private var _apelido: String
    private var _nome: String
    private var _email: String
    private var _senha: String
    private var _comentarios: [Comentario]
    private var _livroAtual: Livro
    private var _gruposUsuario: [Grupo]
    private var _missoes: [Missao]
    
    init(foto: String, apelido: String, nome: String, email: String, senha: String, livroAtual: Livro, gruposUsuario: [Grupo], missoes: [Missao], comentarios: [Comentario]) {
        self._foto = foto
        self._apelido = apelido
        self._nome = nome
        self._email = email
        self._senha = senha
        self._livroAtual = livroAtual
        self._gruposUsuario = gruposUsuario
        self._missoes = missoes
        self._comentarios = comentarios
    }
    
    var foto: String {
        get { return _foto }
        set { _foto = newValue }
    }

    var apelido: String {
        get { return _apelido }
        set { _apelido = newValue }
    }

    var nome: String {
        get { return _nome }
        set { _nome = newValue }
    }
    
    var email: String {
        get { return _email }
        set { _email = newValue }
    }
    
    var senha: String {
        get { return _senha }
        set { _senha = newValue }
    }
    
    var livroAtual: Livro {
        get { return _livroAtual }
        set { _livroAtual = newValue }
    }
    
    var gruposUsuario: [Grupo] {
        get { return _gruposUsuario }
        set { _gruposUsuario = newValue }
    }
    
    var missoes: [Missao] {
        get { return _missoes }
        set { _missoes = newValue }
    }
    
    var comentarios: [Comentario] {
        get { return _comentarios }
        set { _comentarios = newValue }
    }
}

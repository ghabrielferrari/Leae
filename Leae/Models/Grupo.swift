import Foundation

class Grupo {
    
    private var _livroGrupo: Livro
    private var _usuariosGrupo: [Usuario]
    private var _missao: [Missao]
    
    init(livroGrupo: Livro, usuariosGrupo: [Usuario], missao: [Missao]) {
        self._livroGrupo = livroGrupo
        self._usuariosGrupo = usuariosGrupo
        self._missao = missao
    }
    
    var livroGrupo: Livro {
        get { return _livroGrupo }
        set { _livroGrupo = newValue }
    }
    
    var usuariosGrupo: [Usuario] {
        get { return _usuariosGrupo }
        set { _usuariosGrupo = newValue }
    }
    
    var missao: [Missao] {
        get { return _missao }
        set { _missao = newValue }
    }
}

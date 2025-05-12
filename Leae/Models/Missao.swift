class Missao {
    
    private var _descricao: String
    private var _pontuacao: String
    private var _tipo: String
    private var _progresso: Int
    private var _meta: Int
    
    init(descricao: String, pontuacao: String, tipo: String, meta: Int, progresso: Int = 0) {
        self._descricao = descricao
        self._pontuacao = pontuacao
        self._tipo = tipo
        self._meta = meta
        self._progresso = progresso
    }
    
    var descricao: String {
        get { return _descricao }
        set { _descricao = newValue }
    }
    
    var pontuacao: String {
        get { return _pontuacao }
        set { _pontuacao = newValue }
    }
    
    var tipo: String {
        get { return _tipo }
        set { _tipo = newValue }
    }
    
    var progresso: Int {
        get { return _progresso }
        set { _progresso = max(0, newValue) } // impede progresso negativo
    }
    
    var meta: Int {
        get { return _meta }
        set { _meta = newValue }
    }
    
    // Método para adicionar progresso
    func adicionarProgresso(_ valor: Int) {
        _progresso += valor
    }
    
    // Método para checar se a missão está concluída
    func estaConcluida() -> Bool {
        return _progresso >= _meta
    }
}

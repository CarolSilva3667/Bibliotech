const livros = require("../data/conection");

const listar = (req, res) => {
    res.status(200).send(livros).end();
};

const buscar = (req, res) => {
    const idlivros = req.params.id;

    var user = "não encontrado";

    livros.forEach((livro, index) => {
        if(livro.id === idlivros) {
            user = livro;
        }
    });

    res.send(user).end();
};

const cadastrar = (req, res) => {
    const novolivro = req.body;
    livros.push(novolivro);
    res.status(201).send("Cadastrado com Sucesso !").end();
}; 

const apagar = (req, res) => {
    const idlivros = req.params.id;

    var indice = -1;

    livros.forEach((livro, index) => {
        if(livro.id === idlivros) {
            indice = index;
        }
    });

    if(indice === -1) {
        res.status(404).end();
    }
    else{
        livros.splice(indice, 1);
        res.status(204).end();
    }
};

const alterar = (req, res) => {
    const livroalterado = req.body;

    livros.forEach((livro, index) => {
        if(livro.id === livroalterado.id) {
            livros[index] = livroalterado;
            encontrei = true;
        }
    });

    if(encontrei === false) {
        res.status(404).end();
    }
    else {
        res.status(201).end();
    }
};

const atualizar = (req, res) => {
    const idlivros = req.params.id;
    const novosdados = req.body;

    var indice = -1;

    livros.forEach((livro, index) => {
        if(livro.id === idlivros) indice = index;
    });

    if(indice === -1) {
        res.status(404).end();
    }
    else {
        Object.keys(novosdados).forEach((key) => {
        livros[indice][key] = novosdados[key];
    });
    res.status(204).end();
    }

};

module.exports = {
    listar,
    buscar,
    cadastrar,
    apagar,
    alterar,
    atualizar
};
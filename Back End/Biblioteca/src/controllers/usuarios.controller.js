const usuarios = require("../data/conection");

//req -> Request(Requisição)
//res -> Response(Resposta)
const listar = (req, res) => {
    res.status(200).send(usuarios).end();
};

const buscar = (req, res) => {
    //  /usuarios/id
    const idusuario = req.params.id;

    var user = "não encontrado";

    usuarios.forEach((usuario, index) => {
        if(usuario.id === idusuario) {
            user = usuario;
        }
    });

    res.send(user).end();
};

const cadastrar = (req, res) => {
    const novousuario = req.body;
    usuarios.push(novousuario);
    res.status(201).send("Cadastrado com Sucesso !").end();
};

const apagar = (req, res) => {
    //usuarios.id -> parametro
    const idusuario = req.params.id;

    var indice = -1;

    usuarios.forEach((usuario, index) => {
        if(usuario.id === idusuario) {
            indice = index;
        }
    });

    if(indice === -1) {
        res.status(404).end();
    }
    else{
        usuarios.splice(indice, 1);
        res.status(204).end();
    }
};

const alterar = (req, res) => {
    const usuarioalterado = req.body;

    usuarios.forEach((usuario, index) => {
        if(usuario.id === usuarioalterado.id) {
            usuarios[index] = usuarioalterado;
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
    const idusuario = req.params.id;
    const novosdados = req.body;

    var indice = -1;

    usuarios.forEach((usuario, index) => {
        if(usuario.id === idusuario) indice = index;
    });

    if(indice === -1) {
        res.status(404).end();
    }
    else {
        Object.keys(novosdados).forEach((key) => {
        usuarios[indice][key] = novosdados[key];
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
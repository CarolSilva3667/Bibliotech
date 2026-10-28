const prisma = require("../data/prisma");
const jwt = require("jsonwebtoken");

const cadastrar = async (req, res) => {

    const data = req.body;

    const item = await prisma.usuarios.create({
        data
    });

    res.status(201).json(item);
};


const listar = async (req, res) => {

    const lista = await prisma.usuarios.findMany();

    res.status(200).json(lista);
};


const buscar = async (req, res) => {

    const { id } = req.params;

    const item = await prisma.usuarios.findUnique({
        where: {
            id: Number(id)
        }
    });

    res.status(200).json(item);
};


const atualizar = async (req, res) => {

    const { id } = req.params;
    const dados = req.body;

    const item = await prisma.usuarios.update({
        where: {
            id: Number(id)
        },
        data: dados
    });

    res.status(200).json(item);
};


const excluir = async (req, res) => {

    const { id } = req.params;

    const item = await prisma.usuarios.delete({
        where: {
            id: Number(id)
        }
    });

    res.status(200).json(item);
};

const login = async (req, res) => {

    try {

        const { usuario, senha, tipo } = req.body;

        const usuarioEncontrado = await prisma.usuarios.findFirst({
            where: {
                usuario: usuario
            }
        });

        if (!usuarioEncontrado) {
            return res.status(401).json({
                mensagem: "Usuário ou senha incorretos."
            });
        }

        if (usuarioEncontrado.senha !== senha) {
            return res.status(401).json({
                mensagem: "Usuário ou senha incorretos."
            });
        }

        if (usuarioEncontrado.tipo !== tipo) {
            return res.status(401).json({
                mensagem: "Tipo de usuário incorreto."
            });
        }

        const token = jwt.sign(
            {
                id: usuarioEncontrado.id,
                usuario: usuarioEncontrado.usuario,
                tipo: usuarioEncontrado.tipo
            },
            process.env.JWT_SECRET,
            {
                expiresIn: "1h"
            }
        );

        res.status(200).json({
            mensagem: "Login realizado com sucesso!",
            token: token,
            usuario: {
                id: usuarioEncontrado.id,
                nome: usuarioEncontrado.nome,
                usuario: usuarioEncontrado.usuario,
                tipo: usuarioEncontrado.tipo
            }
        });

    } catch (erro) {

        console.error(erro);

        res.status(500).json({
            mensagem: "Erro ao realizar login."
        });

    }
};


module.exports = {
    cadastrar,
    listar,
    buscar,
    atualizar,
    excluir,
    login
};
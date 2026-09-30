const db = require("../data/db");

async function login(req, res) {
    try {
        const { nome, senha } = req.body;

        if (!nome || !senha) {
            return res.status(400).json({
                mensagem: "Nome e senha são obrigatórios."
            });
        }

        const [usuarios] = await db.query(
            "SELECT * FROM usuarios WHERE nome = ? AND senha = ?",
            [nome, senha]
        );

        if (usuarios.length === 0) {
            return res.status(401).json({
                mensagem: "Nome ou senha incorretos."
            });
        }

        const usuario = usuarios[0];

        res.json({
            mensagem: "Login realizado com sucesso!",
            usuario: {
                id: usuario.id,
                nome: usuario.nome,
                tipo: usuario.tipo
            }
        });

    } catch (error) {
        console.error(error);

        res.status(500).json({
            mensagem: "Erro ao realizar login."
        });
    }
}

async function listarUsuarios(req, res) {
    try {
        const [usuarios] = await db.query(
            "SELECT id, nome, tipo FROM usuarios"
        );

        res.json(usuarios);

    } catch (error) {
        console.error(error);

        res.status(500).json({
            mensagem: "Erro ao buscar usuários."
        });
    }
}

async function atualizarUsuario(req, res) {
    try {
        const { id } = req.params;
        const { nome, senha, tipo } = req.body;

        if (!nome || !senha || !tipo) {
            return res.status(400).json({
                mensagem: "Nome, senha e tipo são obrigatórios."
            });
        }

        const [resultado] = await db.query(
            `UPDATE usuarios
            SET nome = ?, senha = ?, tipo = ?
            WHERE id = ?`,
            [nome, senha, tipo, id]
        );

        if (resultado.affectedRows === 0) {
            return res.status(404).json({
                mensagem: "Usuário não encontrado."
            });
        }

        res.json({
            mensagem: "Usuário atualizado com sucesso!"
        });

    } catch (error) {
        console.error(error);

        res.status(500).json({
            mensagem: "Erro ao atualizar usuário."
        });
    }
}

async function excluirUsuario(req, res) {
    try {
        const { id } = req.params;

        const [resultado] = await db.query(
            "DELETE FROM usuarios WHERE id = ?",
            [id]
        );

        if (resultado.affectedRows === 0) {
            return res.status(404).json({
                mensagem: "Usuário não encontrado."
            });
        }

        res.json({
            mensagem: "Usuário excluído com sucesso!"
        });

    } catch (error) {
        console.error(error);

        res.status(500).json({
            mensagem: "Erro ao excluir usuário."
        });
    }
}

module.exports = {
    login,
    listarUsuarios,
    atualizarUsuario,
    excluirUsuario
};
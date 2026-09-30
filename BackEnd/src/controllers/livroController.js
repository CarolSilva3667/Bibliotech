const db = require("../data/db");

async function listarLivros(req, res) {
    try {
        const [livros] = await db.query(
            "SELECT * FROM livro"
        );

        res.json(livros);

    } catch (error) {
        console.error(error);

        res.status(500).json({
            mensagem: "Erro ao buscar livros."
        });
    }
}


async function buscarLivro(req, res) {
    try {
        const { id } = req.params;

        const [livros] = await db.query(
            "SELECT * FROM livro WHERE id = ?",
            [id]
        );

        if (livros.length === 0) {
            return res.status(404).json({
                mensagem: "Livro não encontrado."
            });
        }

        res.json(livros[0]);

    } catch (error) {
        console.error(error);

        res.status(500).json({
            mensagem: "Erro ao buscar livro."
        });
    }
}


async function cadastrarLivro(req, res) {
    try {
        const {
            titulo,
            descricao,
            genero,
            imagem
        } = req.body;

        if (!titulo || !genero) {
            return res.status(400).json({
                mensagem: "Título e gênero são obrigatórios."
            });
        }

        const [resultado] = await db.query(
            `INSERT INTO livro
            (titulo, descricao, genero, imagem)
            VALUES (?, ?, ?, ?)`,
            [
                titulo,
                descricao || null,
                genero,
                imagem || null
            ]
        );

        res.status(201).json({
            mensagem: "Livro cadastrado com sucesso!",
            id: resultado.insertId
        });

    } catch (error) {
        console.error(error);

        res.status(500).json({
            mensagem: "Erro ao cadastrar livro."
        });
    }
}


async function atualizarLivro(req, res) {
    try {
        const { id } = req.params;

        const {
            titulo,
            descricao,
            genero,
            imagem,
            status
        } = req.body;

        const [resultado] = await db.query(
            `UPDATE livro
            SET titulo = ?,
                descricao = ?,
                genero = ?,
                imagem = ?,
                status = ?
            WHERE id = ?`,
            [
                titulo,
                descricao,
                genero,
                imagem,
                status,
                id
            ]
        );

        if (resultado.affectedRows === 0) {
            return res.status(404).json({
                mensagem: "Livro não encontrado."
            });
        }

        res.json({
            mensagem: "Livro atualizado com sucesso!"
        });

    } catch (error) {
        console.error(error);

        res.status(500).json({
            mensagem: "Erro ao atualizar livro."
        });
    }
}


async function excluirLivro(req, res) {
    try {
        const { id } = req.params;

        const [resultado] = await db.query(
            "DELETE FROM livro WHERE id = ?",
            [id]
        );

        if (resultado.affectedRows === 0) {
            return res.status(404).json({
                mensagem: "Livro não encontrado."
            });
        }

        res.json({
            mensagem: "Livro excluído com sucesso!"
        });

    } catch (error) {
        console.error(error);

        res.status(500).json({
            mensagem: "Erro ao excluir livro."
        });
    }
}


module.exports = {
    listarLivros,
    buscarLivro,
    cadastrarLivro,
    atualizarLivro,
    excluirLivro
};
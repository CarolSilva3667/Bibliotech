const db = require("../data/db");

async function realizarEmprestimo(req, res) {
    try {
        const { livroId, usuarioId } = req.body;

        console.log("livroId:", livroId);
        console.log("usuarioId:", usuarioId);

        if (!livroId || !usuarioId) {
            return res.status(400).json({
                mensagem: "Livro e usuário são obrigatórios."
            });
        }

        const [livros] = await db.query(
            "SELECT * FROM livro WHERE id = ?",
            [livroId]
        );

        if (livros.length === 0) {
            return res.status(404).json({
                mensagem: "Livro não encontrado."
            });
        }

        if (livros[0].status === "Emprestado") {
            return res.status(400).json({
                mensagem: "Este livro já está emprestado."
            });
        }

        const [usuarios] = await db.query(
            "SELECT * FROM usuarios WHERE id = ?",
            [usuarioId]
        );

        if (usuarios.length === 0) {
            return res.status(404).json({
                mensagem: "Usuário não encontrado."
            });
        }

        const dataEmprestimo = new Date();

        const dataDevolucao = new Date();
        dataDevolucao.setDate(dataDevolucao.getDate() + 14);

        const formatarData = (data) => {
            return data.toISOString().split("T")[0];
        };

        await db.query(
            `INSERT INTO emprestimos
            (livroId, usuarioId, dataEmprestimo, dataDevolucao, status)
            VALUES (?, ?, ?, ?, 'Emprestado')`,
            [
                livroId,
                usuarioId,
                formatarData(dataEmprestimo),
                formatarData(dataDevolucao)
            ]
        );

        await db.query(
            "UPDATE livro SET status = 'Emprestado' WHERE id = ?",
            [livroId]
        );

        res.status(201).json({
            mensagem: "Livro emprestado com sucesso!"
        });

    } catch (error) {
        console.error(error);

        res.status(500).json({
            mensagem: "Erro ao realizar empréstimo."
        });
    }
}

async function listarEmprestimos(req, res) {
    try {
        const [emprestimos] = await db.query(`
            SELECT
                emprestimos.id,
                livro.titulo AS livro,
                usuarios.nome AS aluno,
                emprestimos.dataEmprestimo,
                emprestimos.dataDevolucao,
                emprestimos.status
            FROM emprestimos
            INNER JOIN livro ON emprestimos.livroId = livro.id
            INNER JOIN usuarios ON emprestimos.usuarioId = usuarios.id
            ORDER BY emprestimos.id DESC
        `);

        res.json(emprestimos);

    } catch (error) {
        console.error(error);

        res.status(500).json({
            mensagem: "Erro ao buscar empréstimos."
        });
    }
}

async function devolverEmprestimo(req, res) {
    try {
        const { id } = req.params;

        const [emprestimos] = await db.query(
            "SELECT * FROM emprestimos WHERE id = ?",
            [id]
        );

        if (emprestimos.length === 0) {
            return res.status(404).json({
                mensagem: "Empréstimo não encontrado."
            });
        }

        const emprestimo = emprestimos[0];

        await db.query(
            `UPDATE emprestimos
            SET status = 'Devolvido'
            WHERE id = ?`,
            [id]
        );

        await db.query(
            `UPDATE livro
            SET status = 'Disponível'
            WHERE id = ?`,
            [emprestimo.livroId]
        );

        res.json({
            mensagem: "Livro devolvido com sucesso!"
        });

    } catch (error) {
        console.error(error);

        res.status(500).json({
            mensagem: "Erro ao devolver livro."
        });
    }
}

module.exports = {
    realizarEmprestimo,
    listarEmprestimos,
    devolverEmprestimo
};
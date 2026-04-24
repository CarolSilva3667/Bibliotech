const db = require("../data/connection");

const listarAlunos = async (req, res) => {
    try {
        const [alunos] = await db.query("SELECT * FROM alunos");
        res.json(alunos);
    } catch (error) {
        console.error("Erro ao listar alunos:", error);
        res.status(500).json({msg: "Erro ao buscar alunos"});
    }
};

const cadastrarAluno = async (req, res) => {
    const {nome, idade, serie, rm} = req.body;

    try {
        const [result] = await db.query("INSERT INTO alunos (nome, idade, serie, rm) VALUES (?, ?, ?, ?)",[nome, idade, serie, rm]);

        const novoAluno = {
            id: result.insertId,
            nome,
            idade,
            serie,
            rm
        };

        res.status(201).json(novoAluno);
    }catch(error) {
        console.error("Erro ao cadastrar aluno:", error);
        res.status(500).json({ msg: "Erro ao cadastrar aluno" });
    }
};

module.exports = {
    listarAlunos,
    cadastrarAluno
};
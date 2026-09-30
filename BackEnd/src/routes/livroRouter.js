const express = require("express");

const router = express.Router();

const {
    listarLivros,
    buscarLivro,
    cadastrarLivro,
    atualizarLivro,
    excluirLivro
} = require("../controllers/livroController");

router.get("/livros", listarLivros);
router.get("/livros/:id", buscarLivro);
router.post("/livros", cadastrarLivro);
router.put("/livros/:id", atualizarLivro);
router.delete("/livros/:id", excluirLivro);

module.exports = router;
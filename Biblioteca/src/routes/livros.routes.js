const express = require("express");
const router = express.Router();

const livroscontroller = require("../controllers/livros.controller");

router.get("/livros", livroscontroller.listar);
router.get("/livros/:id", livroscontroller.buscar);
router.post("/livros", livroscontroller.cadastrar);
router.delete("/livro/:id", livroscontroller.apagar);
router.put("/livro", livroscontroller.alterar);
router.patch("/livro/:id", livroscontroller.atualizar);

module.exports = router;
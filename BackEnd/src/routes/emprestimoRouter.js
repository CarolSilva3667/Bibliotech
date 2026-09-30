const express = require("express");

const router = express.Router();

const {
    realizarEmprestimo,
    listarEmprestimos,
    devolverEmprestimo
} = require("../controllers/emprestimoController");

router.post("/emprestimos", realizarEmprestimo);
router.get("/emprestimos", listarEmprestimos);
router.put("/emprestimos/:id/devolver", devolverEmprestimo);

module.exports = router;
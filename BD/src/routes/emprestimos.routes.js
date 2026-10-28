
const express = require("express");
const { validarToken } = require("../middlewares/auth");
const { validarCargo } = require("../middlewares/auth2");
const router = express.Router();

const {
    cadastrar,
    listar,
    buscar,
    atualizar,
    excluir
} = require("../controllers/emprestimos.controller");

router.post("/cadastrar", cadastrar);
router.get("/listar", listar);
router.get("/buscar/:id", buscar);
router.put("/atualizar/:id", validarToken, validarCargo, atualizar);
router.delete("/excluir/:id", validarToken, validarCargo, excluir);

module.exports = router;
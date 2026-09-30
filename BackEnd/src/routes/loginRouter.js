const express = require("express");

const router = express.Router();

const {
    login,
    listarUsuarios,
    atualizarUsuario,
    excluirUsuario
} = require("../controllers/loginController");

router.post("/login", login);
router.get("/usuarios", listarUsuarios);
router.put("/usuarios/:id", atualizarUsuario);
router.delete("/usuarios/:id", excluirUsuario);

module.exports = router;
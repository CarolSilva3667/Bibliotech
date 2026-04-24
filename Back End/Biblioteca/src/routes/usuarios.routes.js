const express = require("express");
const router = express.Router();

const usuarioscontroller = require("../controllers/usuarios.controller");

router.get("/usuarios", usuarioscontroller.listar);
router.get("/usuarios/:id", usuarioscontroller.buscar);
router.post("/usuarios", usuarioscontroller.cadastrar);
router.delete("/usuario/:id", usuarioscontroller.apagar);
router.put("/usuario", usuarioscontroller.alterar);
router.patch("/usuarios/:id", usuarioscontroller.atualizar);

module.exports = router;
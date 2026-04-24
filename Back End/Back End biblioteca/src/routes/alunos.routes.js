const express = require("express");
const router = express.Router();

const alunosController = require("../controllers/alunos.controller");

router.get("/", alunosController.listarAlunos);
router.post("/", alunosController.cadastrarAluno);

module.exports = router;
const express = require('express');
const cors = require('cors');
const app = express();

const alunosRoutes = require("./src/routes/alunos.routes");

app.use(cors());
app.use(express.json());
app.use('/alunos', alunosRoutes);

app.listen(3000, () => {
    console.log("Servidor online na porta 3000");
});
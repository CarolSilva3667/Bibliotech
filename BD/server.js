require("dotenv").config();

const express = require("express");
const cors = require("cors");

const app = express();

app.use(express.json());
app.use(cors());


const emprestimosRoutes = require("./src/routes/emprestimos.routes");

app.use("/emprestimos", emprestimosRoutes);


const livrosRoutes = require("./src/routes/livros.routes");

app.use("/livros", livrosRoutes);


const usuariosRoutes = require("./src/routes/usuarios.routes");

app.use("/usuarios", usuariosRoutes);


const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {

  console.log(`Servidor rodando na porta ${PORT}`);

});
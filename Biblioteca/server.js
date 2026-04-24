const express = require("express"); //Importa um Modulo.
const cors = require("cors");

usuariosRouter = require("./src/routes/usuarios.routes");
livrosRouter = require("./src/routes/livros.routes");

const app = express();

app.use(express.json()); //Habilita comunicação via JSON
app.use(cors()); //Habilita requisição local

//Importar as rotas configuradas
app.use(usuariosRouter);
app.use(livrosRouter);

app.listen(3000,() => {
    console.log("Servidor online na porta 3000");
});
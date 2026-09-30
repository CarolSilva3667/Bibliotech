const express = require("express");
const cors = require("cors");

const app = express();

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
    res.json({
        mensagem: "API da Biblioteca Virtual funcionando!"
    });
});

const loginRouter = require("./src/routes/loginRouter");
const livroRouter = require("./src/routes/livroRouter");
const emprestimoRouter = require("./src/routes/emprestimoRouter");

app.use("/", loginRouter);
app.use("/", livroRouter);
app.use("/", emprestimoRouter);

const PORT = 3000;

app.listen(PORT, () => {
    console.log(`Servidor rodando em http://localhost:${PORT}`);
});
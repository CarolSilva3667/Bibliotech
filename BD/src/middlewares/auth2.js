const validarCargo = (req, res, next) => {
    if (!req.usuario || !req.usuario.cargo) {
        return res.status(403).json({
            mensagem: "Cargo do usuário não informado."
        });
    }

    const { cargo } = req.usuario;

    if (!["bibliotecario", "aluno"].includes(cargo)) {
        return res.status(403).json({
            mensagem: "Você não tem permissão para acessar esta rota."
        });
    }

    next();
};

module.exports = {validarCargo}
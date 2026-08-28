function verificarLogin() {

    const usuario = localStorage.getItem("usuario");
    const tipo = localStorage.getItem("tipoUsuario");

    return {
        usuario: usuario,
        tipo: tipo
    };

}


function protegerBibliotecario() {

    const tipo = localStorage.getItem("tipoUsuario");

    if (tipo !== "bibliotecario") {

        alert("Acesso permitido apenas para bibliotecários.");

        window.location.href = "login.html";

    }

}


function atualizarMenu() {

    const tipo = localStorage.getItem("tipoUsuario");

    const links = document.querySelectorAll(
        ".somente-bibliotecario"
    );

    links.forEach(function (link) {

        if (tipo === "bibliotecario") {

            link.style.display = "";

        } else {

            link.style.display = "none";

        }

    });

}


function pegarLivrosEmprestados() {

    return JSON.parse(
        localStorage.getItem("livrosEmprestados") || "[]"
    );

}


function salvarLivrosEmprestados(livros) {

    localStorage.setItem(
        "livrosEmprestados",
        JSON.stringify(livros)
    );

}


function emprestarLivro(id, nome) {

    const usuario = localStorage.getItem("usuario");
    const tipo = localStorage.getItem("tipoUsuario");

    if (!usuario) {

        alert("Você precisa fazer login para emprestar um livro.");

        window.location.href = "login.html";

        return;

    }

    if (tipo !== "aluno") {

        alert("Apenas alunos podem realizar empréstimos.");

        return;

    }


    let livros = pegarLivrosEmprestados();


    const jaEmprestado = livros.some(function (livro) {

        return Number(livro.id) === Number(id);

    });


    if (jaEmprestado) {

        alert("Este livro já está emprestado.");

        return;

    }


    const hoje = new Date();

    const devolucao = new Date();

    devolucao.setDate(
        devolucao.getDate() + 14
    );


    const novoEmprestimo = {

        id: Number(id),

        livro: nome,

        aluno: usuario,

        dataEmprestimo:
            hoje.toLocaleDateString("pt-BR"),

        dataDevolucao:
            devolucao.toLocaleDateString("pt-BR"),

        status: "Emprestado"

    };


    livros.push(novoEmprestimo);

    salvarLivrosEmprestados(livros);


    alert("Livro emprestado com sucesso! 📚");

    location.reload();

}


function devolverLivro(id) {

    const tipo = localStorage.getItem("tipoUsuario");

    if (tipo !== "bibliotecario") {

        alert("Apenas bibliotecários podem registrar devoluções.");

        return;

    }


    let livros = pegarLivrosEmprestados();


    livros = livros.filter(function (livro) {

        return Number(livro.id) !== Number(id);

    });


    salvarLivrosEmprestados(livros);


    alert("Livro devolvido com sucesso! 📖");

    location.reload();

}


function livroEstaEmprestado(id) {

    const livros = pegarLivrosEmprestados();

    return livros.some(function (livro) {

        return Number(livro.id) === Number(id);

    });

}


function configurarCatalogo() {

    const cards = document.querySelectorAll(
        "#catalogo .card"
    );


    cards.forEach(function (card, index) {

        const imagem =
            card.querySelector("img");

        const titulo =
            card.querySelector("h3");

        const botao =
            card.querySelector("button");


        if (!titulo) {
            return;
        }


        const nome =
            titulo.innerText.trim();


        let id =
            card.dataset.id;


        if (!id && imagem) {

            const caminho =
                imagem.getAttribute("src");


            const resultado =
                caminho.match(/Livro\s*(\d+)/i);


            if (resultado) {

                id = resultado[1];

            }

        }


        if (!id) {

            id = index + 1;

        }


        id = Number(id);


        card.dataset.id = id;
        card.dataset.nome = nome;


        if (livroEstaEmprestado(id)) {

            marcarComoEmprestado(card);

        } else {

            marcarComoDisponivel(
                card,
                id,
                nome
            );

        }


        if (botao && !livroEstaEmprestado(id)) {

            botao.onclick = function () {

                emprestarLivro(
                    id,
                    nome
                );

            };

        }

    });

}


function marcarComoEmprestado(card) {

    card.classList.add("emprestado");


    let status =
        card.querySelector(".status");


    if (!status) {

        status =
            document.createElement("span");

        status.className = "status";

        status.innerText =
            "EMPRESTADO";

        card.prepend(status);

    }


    const botao =
        card.querySelector("button");


    if (botao) {

        botao.style.display = "none";

        botao.onclick = null;

    }


    const paragrafos =
        card.querySelectorAll("p");


    paragrafos.forEach(function (p) {

        if (
            p.innerText.includes("Status:")
        ) {

            p.innerHTML =
                "<strong>Status:</strong> 🔴 Emprestado";

        }

    });

}


function marcarComoDisponivel(
    card,
    id,
    nome
) {

    card.classList.remove("emprestado");


    const status =
        card.querySelector(".status");


    if (status) {

        status.remove();

    }


    const botao =
        card.querySelector("button");


    if (botao) {

        botao.style.display = "";

        botao.innerText =
            "Emprestar";


        botao.onclick = function () {

            emprestarLivro(
                id,
                nome
            );

        };

    }


    const paragrafos =
        card.querySelectorAll("p");


    paragrafos.forEach(function (p) {

        if (
            p.innerText.includes("Status:")
        ) {

            p.innerHTML =
                "<strong>Status:</strong> 🟢 Disponível";

        }

    });

}


document.addEventListener(
    "DOMContentLoaded",
    function () {

        atualizarMenu();


        if (
            document.querySelector("#catalogo")
        ) {

            configurarCatalogo();

        }

    }
);

document.addEventListener("DOMContentLoaded", function () {
    const tipoUsuario =
        localStorage.getItem("tipoUsuario");
    
    const linksBibliotecario =
        document.querySelectorAll(
            ".somente-bibliotecario"
        );


    linksBibliotecario.forEach(function (link) {

        if (tipoUsuario !== "bibliotecario") {

            link.style.display = "none";

        }

    });


    function pegarEmprestimos() {

        return JSON.parse(
            localStorage.getItem("livrosEmprestados") || "[]"
        );

    }


    function salvarEmprestimos(emprestimos) {

        localStorage.setItem(
            "livrosEmprestados",
            JSON.stringify(emprestimos)
        );

    }

    function cadastrarEmprestimosIniciais() {

        let emprestimos =
            pegarEmprestimos();


        const livrosIniciais = [

            {
                id: 5,
                livro: "Chama de Ferro",
                aluno: "Maria Oliveira",
                dataEmprestimo: "08/08/2026",
                dataDevolucao: "22/08/2026"
            },

            {
                id: 7,
                livro: "A Paciente Silenciosa",
                aluno: "Ana Costa",
                dataEmprestimo: "20/07/2026",
                dataDevolucao: "03/08/2026"
            },

            {
                id: 14,
                livro: "Conflitos de Sangue",
                aluno: "Pedro Lima",
                dataEmprestimo: "16/08/2026",
                dataDevolucao: "30/08/2026"
            },

            {
                id: 16,
                livro: "Casamento Perfeito",
                aluno: "João Silva",
                dataEmprestimo: "08/08/2026",
                dataDevolucao: "22/08/2026"
            }

        ];


        livrosIniciais.forEach(function (livroInicial) {

            const existe =
                emprestimos.some(function (emprestimo) {

                    return Number(emprestimo.id) ===
                        Number(livroInicial.id);

                });


            if (!existe) {

                emprestimos.push({

                    id: livroInicial.id,

                    livro: livroInicial.livro,

                    aluno: livroInicial.aluno,

                    dataEmprestimo:
                        livroInicial.dataEmprestimo,

                    dataDevolucao:
                        livroInicial.dataDevolucao,

                    status: "Emprestado"

                });

            }

        });


        salvarEmprestimos(emprestimos);

    }


    function deixarEmprestado(card) {

        card.classList.add("emprestado");


        const botao =
            card.querySelector(".btn-emprestar");


        if (botao) {

            botao.style.display = "none";

        }


        const status =
            card.querySelector(".status-livro");


        if (status) {

            status.innerHTML =
                "<strong>Status:</strong> 🔴 Emprestado";

        }


        let etiqueta =
            card.querySelector(".status");


        if (!etiqueta) {

            etiqueta =
                document.createElement("span");

            etiqueta.className = "status";

            etiqueta.innerText =
                "EMPRESTADO";

            card.prepend(etiqueta);

        }

    }


    function deixarDisponivel(card) {

        card.classList.remove("emprestado");


        const etiqueta =
            card.querySelector(".status");


        if (etiqueta) {

            etiqueta.remove();

        }


        const botao =
            card.querySelector(".btn-emprestar");


        if (botao) {

            botao.style.display = "";

        }


        const status =
            card.querySelector(".status-livro");


        if (status) {

            status.innerHTML =
                "<strong>Status:</strong> 🟢 Disponível";

        }

    }


    function configurarLivros() {

        const emprestimos =
            pegarEmprestimos();


        const cards =
            document.querySelectorAll("#listaLivros .card");


        cards.forEach(function (card) {

            const id =
                Number(card.dataset.id);


            const titulo =
                card.querySelector("h3").innerText.trim();


            const botao =
                card.querySelector(".btn-emprestar");


            const emprestimo =
                emprestimos.find(function (item) {

                    return Number(item.id) === id;

                });


            if (emprestimo) {

                deixarEmprestado(card);

            } else {

                deixarDisponivel(card);


                if (botao) {

                    botao.onclick = function () {

                        const usuario =
                            localStorage.getItem("usuario");


                        const tipo =
                            localStorage.getItem("tipoUsuario");


                        if (!usuario) {

                            alert(
                                "Você precisa fazer login para emprestar um livro."
                            );

                            window.location.href =
                                "login.html";

                            return;

                        }


                        if (tipo !== "aluno") {

                            alert(
                                "Apenas alunos podem realizar empréstimos."
                            );

                            return;

                        }

                        let lista =
                            pegarEmprestimos();

                        const jaExiste =
                            lista.some(function (item) {

                                return Number(item.id) === id;

                            });


                        if (jaExiste) {

                            alert(
                                "Este livro acabou de ser emprestado."
                            );

                            configurarLivros();

                            return;

                        }

                        const hoje =
                            new Date();


                        const devolucao =
                            new Date();


                        devolucao.setDate(
                            devolucao.getDate() + 14
                        );


                        const novoEmprestimo = {

                            id: id,

                            livro: titulo,

                            aluno: usuario,

                            dataEmprestimo:
                                hoje.toLocaleDateString("pt-BR"),

                            dataDevolucao:
                                devolucao.toLocaleDateString("pt-BR"),

                            status: "Emprestado"

                        };


                        lista.push(
                            novoEmprestimo
                        );


                        salvarEmprestimos(
                            lista
                        );


                        alert(
                            "Livro emprestado com sucesso! 📚"
                        );


                        configurarLivros();

                    };

                }

            }

        });

    }

    cadastrarEmprestimosIniciais();

    configurarLivros();

    const busca =
        document.getElementById("campoBusca");


    const cards =
        document.querySelectorAll(
            "#listaLivros .card"
        );


    busca.addEventListener(
        "keyup",
        function () {

            const valor =
                busca.value.toLowerCase();


            cards.forEach(function (card) {

                const texto =
                    card.innerText.toLowerCase();


                if (
                    texto.includes(valor)
                ) {

                    card.style.display = "";

                } else {

                    card.style.display = "none";

                }

            });

        }
    );

});
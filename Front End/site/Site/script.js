async function realizarLogin(nome, senha) {
    try {
        const resposta = await fetch("http://localhost:3000/login", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                nome: nome,
                senha: senha
            })
        });

        if (!resposta.ok) {
            const erro = await resposta.json();
            alert(erro.mensagem || "Falha ao realizar login.");
            return;
        }

        const dados = await resposta.json();

        console.log("DADOS DO LOGIN:", dados);

        localStorage.setItem("usuario", dados.usuario.nome);
        localStorage.setItem("tipoUsuario", dados.usuario.tipo);
        localStorage.setItem("usuarioId", dados.usuario.id);

        if (dados.token) {
            localStorage.setItem("token", dados.token);
        }

        alert("Login realizado com sucesso!");
        window.location.href = "catalogo.html";
    } catch (erro) {
        console.error("Erro no login:", erro);
        alert("Erro ao conectar com o servidor.");
    }
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
    const links = document.querySelectorAll(".somente-bibliotecario");

    links.forEach(function(link) {
        if (tipo === "bibliotecario") {
            link.style.display = "";
        } else {
            link.style.display = "none";
        }
    });
}

function pegarLivrosEmprestados() {
    return JSON.parse(localStorage.getItem("livrosEmprestados") || "[]");
}

function salvarLivrosEmprestados(livros) {
    localStorage.setItem("livrosEmprestados", JSON.stringify(livros));
}

function livroEstaEmprestado(id) {
    const livros = pegarLivrosEmprestados();
    return livros.some(function(livro) {
        return Number(livro.id) === Number(id);
    });
}

async function emprestarLivro(id, nome) {
    const usuario = localStorage.getItem("usuario");
    const tipo = localStorage.getItem("tipoUsuario");
    const token = localStorage.getItem("token");

    if (!usuario) {
        alert("Você precisa fazer login para emprestar um livro.");
        window.location.href = "login.html";
        return;
    }

    if (tipo !== "aluno") {
        alert("Apenas alunos podem realizar empréstimos.");
        return;
    }

    console.log("LIVRO ID:", id);
    console.log("USUÁRIO ID:", localStorage.getItem("usuarioId"));

    try {
        const resposta = await fetch("http://localhost:3000/emprestimos", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                livroId: id,
                usuarioId: localStorage.getItem("usuarioId")
            })
});

        if (!resposta.ok) {
            const erro = await resposta.json();
            alert(erro.mensagem || "Não foi possível realizar o empréstimo.");
            return;
        }

        alert("Livro emprestado com sucesso! 📚");
        location.reload(); 
    } catch (erro) {
        console.error("Erro ao efetuar empréstimo:", erro);
        alert("Erro ao se comunicar com o servidor.");
    }
}

async function devolverLivro(id) {
    const tipo = localStorage.getItem("tipoUsuario");

    if (tipo !== "bibliotecario") {
        alert("Apenas bibliotecários podem registrar devoluções.");
        return;
    }

    try {
        const resposta = await fetch(
            `http://localhost:3000/emprestimos/${id}/devolver`,
            {
                method: "PUT"
            }
        );

        const dados = await resposta.json();

        if (!resposta.ok) {
            alert(dados.mensagem || "Não foi possível devolver o livro.");
            return;
        }

        alert("Livro devolvido com sucesso! 📖");

        location.reload();

    } catch (erro) {
        console.error("Erro ao devolver livro:", erro);
        alert("Erro ao se comunicar com o servidor.");
    }
}



function cadastrarEmprestimosIniciais() {
    let emprestimos = pegarLivrosEmprestados();

    const livrosIniciais = [
        { id: 5, livro: "Chama de Ferro", aluno: "Maria Oliveira", dataEmprestimo: "08/08/2026", dataDevolucao: "22/08/2026" },
        { id: 7, livro: "A Paciente Silenciosa", aluno: "Ana Costa", dataEmprestimo: "20/07/2026", dataDevolucao: "03/08/2026" },
        { id: 14, livro: "Conflitos de Sangue", aluno: "Pedro Lima", dataEmprestimo: "16/08/2026", dataDevolucao: "30/08/2026" },
        { id: 16, livro: "Casamento Perfeito", aluno: "João Silva", dataEmprestimo: "08/08/2026", dataDevolucao: "22/08/2026" }
    ];

    livrosIniciais.forEach(function(livroInicial) {
        const existe = emprestimos.some(function(emprestimo) {
            return Number(emprestimo.id) === Number(livroInicial.id);
        });

        if (!existe) {
            emprestimos.push({
                id: livroInicial.id,
                livro: livroInicial.livro,
                aluno: livroInicial.aluno,
                dataEmprestimo: livroInicial.dataEmprestimo,
                dataDevolucao: livroInicial.dataDevolucao,
                status: "Emprestado"
            });
        }
    });

    salvarLivrosEmprestados(emprestimos);
}

async function carregarLivrosCadastrados() {
    const lista = document.getElementById("listaLivros");

    if (!lista) return;

    try {
        const resposta = await fetch("http://localhost:3000/livros");

        if (!resposta.ok) {
            throw new Error("Erro ao buscar livros");
        }

        const livros = await resposta.json();

        livros.forEach(function(livro) {
            const card = lista.querySelector(
                `.card[data-id="${livro.id}"]`
            );

            if (!card) return;

            const status = card.querySelector(".status-livro");
            const botao = card.querySelector(".btn-emprestar");

            if (livro.status === "Emprestado") {
                card.classList.add("emprestado");

                status.innerHTML =
                    "<strong>Status:</strong> 🔴 Emprestado";

                if (botao) {
                    botao.style.display = "none";
                }

            } else {
                card.classList.remove("emprestado");

                status.innerHTML =
                    "<strong>Status:</strong> 🟢 Disponível";

                if (botao) {
                    botao.style.display = "inline-block";
                }
            }
        });

    } catch (erro) {
        console.error("Erro ao carregar status dos livros:", erro);
    }
}

function marcarComoEmprestado(card) {
    card.classList.add("emprestado");

    let status = card.querySelector(".status");
    if (!status) {
        status = document.createElement("span");
        status.className = "status";
        status.innerText = "EMPRESTADO";
        card.prepend(status);
    }

    const botao = card.querySelector(".btn-emprestar");
    if (botao) {
        botao.style.display = "none";
        botao.onclick = null;
    }

    const paragrafos = card.querySelectorAll("p");
    paragrafos.forEach(function(p) {
        if (p.innerText.includes("Status:")) {
            p.innerHTML = "<strong>Status:</strong> 🔴 Emprestado";
        }
    });
}

function marcarComoDisponivel(card, id, nome) {
    card.classList.remove("emprestado");

    const status = card.querySelector(".status");
    if (status) {
        status.remove();
    }

    const botao = card.querySelector(".btn-emprestar");
    if (botao) {
        botao.style.display = "";
        botao.innerText = "Emprestar";
        botao.onclick = function() {
            emprestarLivro(id, nome);
        };
    }

    const paragrafos = card.querySelectorAll("p");
    paragrafos.forEach(function(p) {
        if (p.innerText.includes("Status:")) {
            p.innerHTML = "<strong>Status:</strong> 🟢 Disponível";
        }
    });
}

function configurarCatalogo() {
    const cards = document.querySelectorAll("#listaLivros .card");

    cards.forEach(function(card, index) {
        const imagem = card.querySelector("img");
        const titulo = card.querySelector("h3");

        if (!titulo) return;

        const nome = titulo.innerText.trim();
        let id = card.dataset.id;

        if (!id && imagem) {
            const caminho = imagem.getAttribute("src");
            const resultado = caminho.match(/Livro\s*(\d+)/i);
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
            marcarComoDisponivel(card, id, nome);
        }
    });
}

function configurarBuscaCatalogo() {
    const busca = document.getElementById("campoBusca");
    const lista = document.getElementById("listaLivros");

    if (!lista) return;

    const cards = lista.querySelectorAll(".card");
    const parametroGenero = new URLSearchParams(window.location.search).get("genero");
    const tituloCatalogo = document.querySelector("#catalogo h2");

    const nomesGeneros = {
        "romance": "Romance",
        "dark-romance": "Dark Romance",
        "fantasia": "Fantasia",
        "suspense": "Suspense"
    };

    if (parametroGenero && nomesGeneros[parametroGenero] && tituloCatalogo) {
        tituloCatalogo.innerText = "Catálogo - " + nomesGeneros[parametroGenero];
    }

    function filtrarLivros() {
        const valor = busca ? busca.value.toLowerCase().trim() : "";

        cards.forEach(function(card) {
            const texto = card.innerText.toLowerCase();
            const generoLivro = card.dataset.genero;

            const combinaBusca = texto.includes(valor);
            const combinaGenero = !parametroGenero || generoLivro === parametroGenero;

            if (combinaBusca && combinaGenero) {
                card.style.display = "";
            } else {
                card.style.display = "none";
            }
        });
    }

    filtrarLivros();

    if (busca) {
        busca.addEventListener("keyup", filtrarLivros);
    }
}

function pegarEventos() {
    return JSON.parse(localStorage.getItem("eventosCadastrados") || "[]");
}

function salvarEventos(eventos) {
    localStorage.setItem("eventosCadastrados", JSON.stringify(eventos));
}

function formatarData(data) {
    if (!data || !data.includes("-")) return data;
    const partes = data.split("-");
    return partes[2] + "/" + partes[1] + "/" + partes[0];
}

function carregarEventos() {
    const lista = document.getElementById("listaEventos");

    if (!lista) return;

    const eventos = pegarEventos();

    eventos.forEach(function(evento) {
        const card = document.createElement("div");
        card.className = "card";

        card.innerHTML = `
            <h3>📅 ${evento.nome}</h3>
            <p><strong>Data:</strong> ${formatarData(evento.data)}</p>
            <p><strong>Horário:</strong> ${evento.horaInicio} às ${evento.horaFim}</p>
        `;

        lista.appendChild(card);
    });
}

document.addEventListener("DOMContentLoaded", function() {
    atualizarMenu();

    const listaLivros = document.getElementById("listaLivros");

    if (listaLivros) {
        carregarLivrosCadastrados();
        configurarBuscaCatalogo();

        listaLivros.addEventListener("click", function(event) {
            const botao = event.target.closest(".btn-emprestar");

            if (!botao) return;

            const card = botao.closest(".card");

            if (!card) return;

            const id = Number(card.dataset.id);
            const titulo = card.querySelector("h3").innerText.trim();

            emprestarLivro(id, titulo);
        });
    }

    if (document.getElementById("listaEventos")) {
        carregarEventos();
    }
});

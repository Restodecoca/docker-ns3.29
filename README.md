# docker-ns3

Este repositório contém uma imagem Docker configurada com o **NS-3.29** (Network Simulator 3), forkeada para uso em aulas de Redes de Computadores.

A imagem permite rodar simulações de forma isolada, sem necessidade de instalar dependências diretamente no sistema operacional.

---

## 🛠️ Build da Imagem

Clone o repositório e execute:

```bash
docker build -t ryankurte/docker-ns3 .
````

> Isso criará a imagem localmente com todos os requisitos para compilar e rodar o NS-3.29.

---

## ▶️ Executar o Container

### Execução simples (sem persistência de arquivos):

```bash
docker run -it ryankurte/docker-ns3
```

> Ideal para testes rápidos. Alterações feitas no container **não serão salvas** após sair.

---

### Execução com volume (salva seus arquivos de simulação):

```bash
docker run -it \
  -v $HOME/ns3-work:/usr/ns-allinone-3.29/ns-3.29 \
  ryankurte/docker-ns3
```

> Isso permite salvar códigos, resultados e compilações em uma pasta local no host (`~/ns3-work`).

---

## 💡 Exemplo de simulação

Dentro do container:

```bash
cd /usr/ns-allinone-3.29/ns-3.29
./waf build
./waf --run "scratch/second --nCsma=5 --csmaRate=50Mbps"
```

---

## 📎 Recursos incluídos na imagem

* NS-3.29 com exemplos e testes
* G++/Clang, Python3, CMake, nano, vim
* Suporte a simulações com parâmetros via linha de comando
* Código-fonte disponível na pasta `/usr/ns-allinone-3.29/ns-3.29`

---

## 👨‍🏫 Uso educacional

Este fork foi adaptado para fins didáticos, com foco em atividades práticas de laboratório, incluindo:

* Topologias com CSMA, P2P e Wi-Fi
* Execução de scripts personalizados (`scratch/`)
* Alteração de parâmetros de rede via `CommandLine`

---

## 📂 Organização recomendada

Se quiser manter seu código separado:

```bash
mkdir -p $HOME/ns3-work/scratch
cp second.cc $HOME/ns3-work/scratch/
```

Então monte o volume como mostrado acima para garantir persistência.

---

## 🐧 Requisitos

* Docker instalado (Linux, macOS ou Windows)
* \~5 GB de espaço livre em disco

---

Para dúvidas ou sugestões, abra uma issue no repositório original ou envie um pull request.

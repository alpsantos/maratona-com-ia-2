# Maratona com IA - Event Management API

Uma API Flask moderna para gerenciamento de eventos, desenvolvida durante a maratona de programação com inteligência artificial.

## 🚀 Funcionalidades

- **API REST** para gerenciamento de eventos
- **Interface Web** para visualização e interação
- **Métricas Prometheus** para monitoramento
- **Logging estruturado** com níveis configuráveis
- **Containerização Docker** para deployment
- **Suporte Kubernetes** com manifests incluídos

## 🏗️ Arquitetura

```
src/
├── core/           # Configurações centrais (database, logging, settings)
├── models/         # Modelos SQLAlchemy
├── schemas/        # Schemas Pydantic para validação
├── services/       # Lógica de negócio
├── routers/        # Endpoints da API e páginas web
├── static/         # Arquivos estáticos (CSS, JS, imagens)
├── templates/      # Templates HTML
└── tests/          # Testes automatizados
```

## 🛠️ Tecnologias

- **Python 3.11**
- **Flask** - Framework web
- **SQLAlchemy** - ORM para banco de dados
- **Pydantic** - Validação de dados
- **PostgreSQL** - Banco de dados
- **Gunicorn** - Servidor WSGI
- **Prometheus** - Métricas e monitoramento
- **Docker** - Containerização
- **Kubernetes** - Orquestração

## 📋 Pré-requisitos

- Python 3.11+
- PostgreSQL
- Docker (opcional)
- Kubernetes (opcional)

## 🔧 Instalação

### Desenvolvimento Local

1. **Clone o repositório**
```bash
git clone <repository-url>
cd maratona-com-ia-2
```

2. **Crie um ambiente virtual**
```bash
python -m venv .venv
source .venv/bin/activate  # Linux/Mac
# ou
.venv\Scripts\activate     # Windows
```

3. **Instale as dependências**
```bash
pip install -r src/requirements.txt
```

4. **Configure as variáveis de ambiente**
```bash
# Crie um arquivo .env na raiz do projeto
cp .env.example .env
# Edite o arquivo .env com suas configurações
```

5. **Execute a aplicação**
```bash
cd src
python main.py
```

### Docker

1. **Build da imagem**
```bash
docker build -t maratona-com-ia-2 .
```

2. **Execute o container**
```bash
docker run -p 8000:8000 maratona-com-ia-2
```

### Kubernetes

1. **Deploy no cluster**
```bash
kubectl apply -f k8s/
```

## 🔌 API Endpoints

### Eventos
- `GET /api/events` - Lista todos os eventos
- `POST /api/events` - Cria um novo evento
- `GET /api/events/{id}` - Busca evento por ID
- `PUT /api/events/{id}` - Atualiza um evento
- `DELETE /api/events/{id}` - Remove um evento

### Interface Web
- `GET /` - Página principal
- `GET /events` - Lista de eventos (HTML)
- `GET /metrics` - Métricas Prometheus

## 📊 Monitoramento

A aplicação expõe métricas no formato Prometheus em `/metrics`, incluindo:
- Contadores de requisições HTTP
- Tempo de resposta
- Métricas personalizadas da aplicação
- Informações de versão

## 🧪 Testes

Execute os testes com pytest:

```bash
cd src
pytest
```

Para executar com coverage:
```bash
pytest --cov=. --cov-report=html
```

## 🔒 Variáveis de Ambiente

| Variável | Descrição | Padrão |
|----------|-----------|---------|
| `HOST` | Host da aplicação | `0.0.0.0` |
| `PORT` | Porta da aplicação | `8000` |
| `DEBUG` | Modo debug | `False` |
| `DATABASE_URL` | URL do PostgreSQL | - |
| `LOG_LEVEL` | Nível de log | `INFO` |
| `LOG_FORMAT` | Formato do log | `json` |
| `SERVICE_NAME` | Nome do serviço | `event-api` |
| `SERVICE_VERSION` | Versão do serviço | `1.0.0` |

## 📝 Como Usar

### Criando um Evento via API

```bash
curl -X POST http://localhost:8000/api/events \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Workshop Python",
    "description": "Aprendendo Python com IA",
    "date": "2024-12-01T14:00:00",
    "location": "São Paulo"
  }'
```

### Consultando Eventos

```bash
curl http://localhost:8000/api/events
```

## 🤝 Contribuindo

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/amazing-feature`)
3. Commit suas mudanças (`git commit -m 'Add some amazing feature'`)
4. Push para a branch (`git push origin feature/amazing-feature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

## 👥 Autores

- **Desenvolvido durante a Maratona com IA** - Projeto educacional

## 📞 Suporte

Para suporte, envie um email para [seu-email@exemplo.com] ou abra uma issue no GitHub.
# Estágio de build
FROM python:3.11-slim AS builder

WORKDIR /app

# Instalar dependências
COPY src/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Estágio final
FROM python:3.11-slim

# Criar um usuário não-root
RUN useradd --create-home appuser

WORKDIR /home/appuser/app

# Copiar dependências do estágio de build (bibliotecas e executáveis)
COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

# Copiar código da aplicação
COPY --chown=appuser:appuser src/ .

# Mudar para o usuário não-root
USER appuser

# Expor a porta que a aplicação vai rodar
EXPOSE 8000

# Comando para iniciar a aplicação
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "main:app"]

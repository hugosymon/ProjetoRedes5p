# ProjetoRedes5p
Repositorio do trabalho do nosso querido professor Rotier
 Infraestrutura de Redes com Docker

Este projeto simula uma infraestrutura de rede corporativa utilizando Docker e Docker Compose. Ele contém os principais serviços de rede, como DNS, DHCP, FTP, LDAP, SAMBA, Web Server, além de um roteador com firewall e um cliente para testes.

---

## 🧱 Estrutura do Projeto

- `dns/`: Servidor DNS interno (Bind9)
- `dhcp/`: Servidor DHCP para IP dinâmico
- `ftp/`: Servidor FTP com vsftpd
- `ldap/`: Servidor de diretório OpenLDAP
- `samba/`: Compartilhamento de arquivos via SAMBA
- `web/`: Servidor Web (Apache)
- `router/`: Roteador entre sub-redes, com NAT e firewall (iptables)
- `cliente/`: Máquina cliente usada para testes de conectividade
- `docker-compose.yml`: Orquestra todos os containers

---

## 🌐 Endereçamento de Rede

- **Rede de Servidores**: `172.20.1.0/24`
- **Rede de Clientes**: `172.20.2.0/24`
- **Roteador**: IPs `172.20.1.1` (interface servidor) e `172.20.2.1` (interface cliente)

---

## ⚙️ Como Executar

### Pré-requisitos

- Docker
- Docker Compose
- Sistema Linux ou WSL no Windows

### Passo a Passo

```bash
# 1. Acesse a pasta do projeto
cd /mnt/c/Users/55629/OneDrive/Documents/ProjetoRedes5p/ROTIER


# 2. (Se necessário) Renomeie o arquivo para docker-compose.yml
mv docker-compose docker-compose.yml

# 3. Suba os containers
export COMPOSE_HTTP_TIMEOUT=240
docker-compose up -d --build

# 4. Verifique se todos os serviços estão rodando
docker ps


## 🧪 Testes de Validação

1. **Entre no container cliente**:

```bash
docker exec -it cliente1 bash
```

2. **Rode o script de testes**:

```bash
bash /root/testes.sh
```

Este script realiza:

- Verificação de IP via DHCP
- Rota padrão
- Ping entre redes
- Resolução de nomes com DNS
- Acesso à página web
- Teste de porta FTP
- Consulta LDAP

---

## 🧠 Explicação dos Serviços

| Serviço   | Descrição |
|-----------|-----------|
| **DNS**   | Tradução de nomes para IPs internos |
| **DHCP**  | Entrega IPs dinâmicos aos clientes |
| **FTP**   | Transferência de arquivos pela rede |
| **LDAP**  | Diretório centralizado de usuários |
| **SAMBA** | Compartilhamento de pastas em rede |
| **Web**   | Página HTML servida via Apache |
| **Router**| Interliga sub-redes com NAT e Firewall |
| **Cliente**| Executa testes de conectividade |

---

## 🔐 Segurança

O roteador aplica regras de firewall via `iptables`, com política padrão de bloqueio e liberação controlada por portas e protocolos.

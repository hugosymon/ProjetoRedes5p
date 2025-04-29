# Projeto de Rede com Docker - Serviços Básicos (Funcional)

Este projeto implementa os serviços básicos de rede (DNS, DHCP e Roteador) utilizando Docker. Agora com configurações mais completas e um container de cliente para testes.

## Pré-requisitos

* Docker instalado
* Docker Compose instalado

## Como Executar

1.  Clone este repositório (ou crie a estrutura de arquivos acima).
2.  Navegue até o diretório raiz do projeto (`projeto-rede-docker`).
3.  Execute o seguinte comando no terminal:

    ```bash
    docker-compose up -d
    ```

## Como Testar

1.  Após a inicialização, você pode acessar o container do cliente para verificar se ele recebeu um endereço IP do servidor DHCP e se consegue resolver nomes usando o servidor DNS.

    ```bash
    docker exec -it cliente1 sh
    ```

2.  Dentro do shell do container `cliente1`:

    * **Verificar o endereço IP:**
        ```bash
        ip a
        ```
        Você deverá ver uma interface (geralmente `eth0`) com um endereço IP na faixa `192.168.2.100 - 192.168.2.200`.

    * **Verificar os servidores DNS configurados:**
        ```bash
        cat /etc/resolv.conf
        ```
        Você deverá ver `nameserver 192.168.1.10`.

    * **Testar a resolução de nomes internos:**
        ```bash
        ping -c 2 dns.intranet.local
        ping -c 2 router.intranet.local
        ```

    * **Testar a resolução de nomes externos (através do forwarder):**
        ```bash
        ping -c 2 google.com
        ```

## Próximos Passos

Continue adicionando os outros serviços (Firewall, LDAP, SAMBA, FTP, Web Server) ao seu `docker-compose.yml` e criando os respectivos `Dockerfiles` e arquivos de configuração. Lembre-se de configurar as redes corretamente e integrar os serviços.

## Observações

* O arquivo `named.conf.options` agora define o `listen-on` para o IP do container DNS e configura o encaminhamento para servidores DNS públicos.
* Os arquivos de zona DNS (`db.intranet.local` e `db.192.168.1`) contêm registros para os serviços futuros.
* O `dhcpd.conf` está configurado para fornecer IPs na sub-rede `192.168.2.0/24`, definindo o roteador como gateway e o servidor DNS interno.
* Adicionamos um container `cliente` baseado em Alpine Linux para facilitar os testes.
* O comando no container `router` agora inclui uma rota para a rede de clientes através da interface `eth1` (a interface conectada à rede `clientes`).

Agora, ao executar `docker-compose up -d`, você terá um ambiente básico funcional com DNS resolvendo nomes internos e externos, DHCP atribuindo IPs ao cliente, e um roteador conectando as duas sub-redes. Você pode entrar no container `cliente1` para verificar a configuração de rede que ele recebeu.



docker exec cliente1 ping 172.20.1.14 # Ping pelo IP
docker exec cliente1 ping web.intranet.local # Ping pelo nome (testa DNS)
docker exec cliente1 wget -O - http://172.20.1.14 # Baixar página pelo IP
docker exec cliente1 wget -O - http://web.intranet.local # Baixar página pelo nome (testa DNS)
# Mautic Security & Performance Hardening

<div align="center">
  <p>Elite B2B Security & Scaling Configurations for Mautic Automation Infrastructure.</p>
  <p>
    <a href="#english">🇺🇸 English</a> | 
    <a href="#português">🇧🇷 Português</a>
  </p>
</div>

---

<a id="english"></a>
## 🇺🇸 English

### High-Performance Mautic Marketing Automation
This repository contains the official **TAVARDT Agency** hardening templates for corporate Mautic environments. Mautic handles massive amounts of lead data and automated background jobs; these configurations ensure the platform scales without crashing the server while keeping lead data strictly secure.

### Contents
- **`.htaccess-secure`**: Apache rules to isolate the Symfony architecture, protecting configuration and log directories from public exposure.
- **`local-secure.php`**: Snippets for Mautic's local configuration, crucial for capturing accurate IPs behind reverse proxies (like Cloudflare) and restricting form submissions via CORS.
- **`mautic-cron-performance.sh`**: A highly optimized bash script to run Mautic's heavy background jobs (segments, campaigns, emails) sequentially and with batch limits, preventing CPU exhaustion and database locks.

### Implementation Guide
1. The cron script (`mautic-cron-performance.sh`) should be executed via system `crontab` every 5 or 10 minutes. Adjust the `--batch-limit` parameters based on your server's RAM and CPU capabilities.
2. The trusted proxies list in `local-secure.php` contains Cloudflare's IPv4 ranges. Ensure these are kept up to date.

### Contact & Services
Looking for elite B2B infrastructure and high-ticket digital engineering?
- **Website:** [ag.tavardt.com](https://ag.tavardt.com/)
- **Email:** contact@tavardt.com

---

<a id="português"></a>
## 🇧🇷 Português

### Segurança e Escalabilidade para Mautic
Este repositório contém os templates oficiais de "Hardening" (blindagem) da **TAVARDT** para ambientes corporativos de automação com Mautic. O Mautic processa volumes massivos de dados de *leads* e tarefas em segundo plano; estas configurações garantem que a plataforma escale sem derrubar o servidor, mantendo os dados protegidos.

### Conteúdo
- **`.htaccess-secure`**: Regras de Apache para isolar a arquitetura Symfony, protegendo diretórios de configuração e logs contra acesso público.
- **`local-secure.php`**: Trechos de configuração local, essenciais para capturar os IPs reais dos *leads* por trás de proxies (como Cloudflare) e restringir submissões de formulários via CORS.
- **`mautic-cron-performance.sh`**: Um script Bash altamente otimizado para orquestrar as pesadas tarefas em background do Mautic (segmentos, campanhas, envios de e-mail) de forma sequencial e com limites de lote, prevenindo exaustão de CPU e bloqueios no banco de dados.

### Guia de Implementação
1. O script de cron (`mautic-cron-performance.sh`) deve ser acionado pelo `crontab` do sistema a cada 5 ou 10 minutos. Ajuste os parâmetros `--batch-limit` com base nas capacidades de RAM e CPU do seu servidor.
2. A lista de proxies confiáveis no `local-secure.php` contém os intervalos IPv4 da Cloudflare. Certifique-se de mantê-los atualizados.

### Contato & Serviços
Procurando por infraestrutura B2B de elite e engenharia digital high-ticket?
- **Site:** [ag.tavardt.com/br/](https://ag.tavardt.com/br/)
- **E-mail:** contato@tavardt.com

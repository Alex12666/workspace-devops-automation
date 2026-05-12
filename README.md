🚀 Automação de Infraestrutura AWS com Docker & CI/CD Pipeline
Este projeto demonstra a implementação de uma arquitetura de deploy contínuo (CD) utilizando Terraform para provisionamento de infraestrutura na AWS e GitHub Actions para automação do ciclo de vida de containers Docker.

📋 Visão Geral
O objetivo deste laboratório foi criar um ambiente efêmero e automatizado onde qualquer alteração no código fonte dispara um processo de build, armazenamento de imagem e atualização do serviço em uma instância EC2, sem intervenção manual.

🛠️ Tecnologias Utilizadas
Cloud: AWS (EC2, ECR, VPC, Security Groups)

IaC: Terraform

Containers: Docker

CI/CD: GitHub Actions

OS: Ubuntu Server (Linux)

App: Catálogo de Carros (Frontend)

🏗️ Arquitetura do Projeto
Provisionamento: O Terraform cria a instância EC2 e o repositório ECR na AWS.

Pipeline de CI: O GitHub Actions realiza o login na AWS, constrói a imagem Docker e faz o push para o ECR.

Pipeline de CD: O GitHub Actions acessa a EC2 via SSH, baixa a nova imagem e reinicia o container.

Monitoramento: Validação via terminal utilizando comandos de observabilidade (top, docker ps, docker logs).

🚀 Como Executar
Pré-requisitos
AWS CLI configurado.

Terraform instalado.

Chave SSH (.pem) configurada.

Passo 1: Infraestrutura
Bash
cd terraform/
terraform init
terraform apply -auto-approve
Passo 2: Configuração de Segredos
No GitHub, configure as seguintes Secrets:

AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY

SSH_PRIVATE_KEY (Sua chave .pem)

EC2_HOST (IP público gerado pelo Terraform)

🧠 Desafios Superados (Troubleshooting)
Diferente de um tutorial padrão, este projeto exigiu a resolução de problemas reais de ambiente:

Gestão de Dependências no ECR: Implementação de lógica para lidar com repositórios não vazios durante a destruição da infra (force_delete).

Segurança SSH: Ajuste de permissões e automação de login em instâncias remotas via GitHub Actions.

Otimização de Imagem: Uso de boas práticas de Docker para garantir imagens leves e rápidas no deploy.

🧹 Limpeza de Recursos (FinOps)
Para garantir a economia de custos e a limpeza do ambiente, o projeto foi encerrado com:

Bash
terraform destroy -auto-approve

# 🖥️ Proyecto 01 — Servidor Ubuntu con Nginx en Azure VM

## 🎯 Objetivo
Desplegar una **máquina virtual Ubuntu** en Microsoft Azure, instalar **Nginx**, y servir una página web estática accesible desde Internet.

---

## 🧩 Tecnologías utilizadas
- **Azure Virtual Machines**
- **Ubuntu Server 22.04 LTS**
- **Nginx**
- **PowerShell / Azure CLI**
- **HTML + CSS**
- **Azure Portal / Cloud Shell**

---

## ⚙️ Pasos realizados

### 1. Crear grupo de recursos
```bash
az group create --name rg-ubuntu-web --location eastus

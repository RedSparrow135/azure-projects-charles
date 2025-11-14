#📱 Proyecto 02 — Base de Datos Centralizada + Sync para App Móvil en Azure

🎯 Objetivo  
Implementar una base de datos en una máquina virtual Ubuntu dentro de Azure y una API REST que permita sincronizar los datos de una aplicación móvil Android (con SQLite local) cada vez que haya conexión a Internet.  

Este proyecto reemplaza la necesidad de Firebase y permite controlar totalmente los datos desde Azure.

---

#🧩 Tecnologías utilizadas

- Azure Virtual Machines  
- Ubuntu Server 22.04  
- Node.js + Express (API REST)  
- SQLite (base de datos remota simple)  
- Android Studio (SQLite local en la app)  
- GitHub (repositorio del proyecto)  
- Nginx (opcional, como reverse proxy)

---

# 🏗 Arquitectura General

```text
┌─────────────────────────┐        Internet        ┌────────────────────────┐
│ Android App (SQLite)    │  ───────────────▶      │  Azure Ubuntu VM       │
│ - Base local            │                        │ - API REST (Node.js)   │
│ - Cambios locales       │  ◀───────────────      │ - SQLite/MySQL Server  │
└─────────────────────────┘   Sincronización       └────────────────────────┘

```

⚙️ Pasos realizados

### 1️⃣ Creación de la máquina virtual

### 2️⃣ Instalación del entorno en Ubuntu

```bash
sudo apt update
sudo apt install -y nodejs npm sqlite3

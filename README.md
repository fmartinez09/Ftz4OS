# Ftz4OS — Declarative NixOS System

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](./LICENSE)
[![NixOS](https://img.shields.io/badge/built%20with-NixOS-5277C3?logo=nixos)](https://nixos.org)
[![Status](https://img.shields.io/badge/status-in%20active%20use-brightgreen)](#)

---

**Ftz4OS** es un sistema NixOS declarativo y modular, diseñado para infraestructura reproducible, desarrollo de sistemas distribuidos y entornos de ingeniería avanzados.  
Basado originalmente en AlfheimOS, ahora completamente desacoplado, documentado y extendido con soporte para DB internals, clústeres y toolchains profesionales.

---

## 🚀 Características principales

- ✨ Composición declarativa mediante Flakes
- 🧠 Entornos de desarrollo para:
  - **FoundationDB, ScyllaDB, PostgreSQL**
  - **Java (OpenJDK17, GraalVM, Maven, Quarkus)**
  - **Go, Bazel, Docker, K8s, K3s**
- 🖥️ Hyprland + Stylix + pywal + swww
- 🧩 Modularización por perfiles (`desktop`, `laptop`, `work`)
- 🔐 Secrets con [`sops-nix`](https://github.com/Mic92/sops-nix)
- 🛠️ Custom overlays y paquetes locales

---

## 📂 Estructura del repo

```bash
.
├── flake.nix                  # Entrada principal declarativa
├── settings.nix               # Variables como `username`, `hostname`, etc.
├── profiles/                  # Perfiles por dispositivo (laptop, work, etc.)
│   └── laptop/
│       ├── configuration.nix  # Configuración del sistema
│       └── home.nix           # Configuración del usuario
├── system/                    # Módulos del sistema (apps, hardware, wm, etc.)
├── user/                      # Configuración del usuario: shells, apps, editors
├── shells/                    # DevShells por stack
├── themes/                    # Stylix + pywal + fondos
├── overlays/                  # Extensiones del árbol de paquetes
└── pkgs/                      # Paquetes locales y parches
```

## Instalacion
Se asume que ya instalaste NixOS (23.11 o superior) en modo UEFI.

```bash
git clone https://github.com/tuusuario/Ftz4OS.git ~/.dotfiles
cd ~/.dotfiles
```

Genera la configuración de hardware (solo una vez por máquina):
```bash
sudo nixos-generate-config --show-hardware-config > profiles/laptop/hardware-configuration.nix
```

Edita settings.nix:
```bash
{
  hostname = "ftz-laptop";
  username = "fernando";
  system = "x86_64-linux";
  profile = "laptop";
  shell = "zsh";
  ...
}
```

Construye el sistema:
```bash
sudo nixos-rebuild switch --flake .#ftz-laptop
```

 Configuración del usuario (Home Manager)
 ```bash
home-manager switch --flake .#fernando
```

DevShells
 ```bash
nix develop .#db-internals
```
Incluye toolchain para:
- FoundationDB
- ScyllaDB
- Quarkus (Java 17 + Maven + GraalVM)
- Bazel
- Go
- Docker, Helm, kubectl, k3s, k9s

## 🙏 Créditos
Inspirado por AlfheimOS, ahora desacoplado y extendido con diseño y objetivos propios.
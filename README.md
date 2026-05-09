```
██████╗ ██████╗ ██████╗ ██╗   ██╗██████╗
██╔══██╗██╔══██╗██╔══██╗██║   ██║██╔══██╗
██████╔╝██████╔╝██████╔╝██║   ██║██████╔╝
██╔══██╗██╔══██╗██╔══██╗██║   ██║██╔══██╗
██████╔╝██║  ██║██║  ██║╚██████╔╝██████╔╝
╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝
```

> **B**are-metal **R**eal-mode **R**untime **U**nder **B**IOS

> ⚠️ **Projeto em desenvolvimento ativo.** Muita coisa ainda vai mudar.

Um bootloader x86 e mini kernel escritos do zero em Assembly — 512 bytes de cada vez.

---

## 🎯 Objetivo

BRRUB é um projeto educacional de baixo nível. A ideia é entender o que acontece no computador antes do sistema operacional existir: do boot até um kernel mínimo rodando, sem frameworks, sem abstrações, sem redes de segurança.

---

## 📍 Estado atual

| Componente | Status |
|---|---|
| Stage 1 — Bootloader MBR | 🚧 Em desenvolvimento |
| Stage 2 — Carregador | 🔜 Planejado |
| Modo protegido (32-bit) | 🔜 Planejado |
| Mini Kernel | 🔜 Planejado |

---

## 🗺️ Roadmap

- [ ] Stage 1 — bootloader que cabe em 512 bytes com assinatura `0xAA55`
- [ ] Imprimir mensagem via BIOS (`int 0x10`)
- [ ] Carregar Stage 2 do disco (`int 0x13`)
- [ ] Configurar a GDT e entrar em modo protegido
- [ ] Mini kernel com output em VGA modo texto
- [ ] Tratamento básico de interrupções (IDT)

---

## 🚀 Como rodar (quando estiver pronto)

### Dependências

```bash
# Ubuntu / Debian
sudo apt install nasm qemu-system-x86

# Arch
sudo pacman -S nasm qemu
```

### Build e execução

```bash
make
make run
```

---

## 🧠 Conceitos que o projeto vai cobrir

- Modo real x86 (16-bit) e interrupções do BIOS
- Segmentação de memória e registradores de segmento
- Global Descriptor Table (GDT) e modo protegido
- Linha A20
- VGA modo texto (`0xB8000`)
- Interrupt Descriptor Table (IDT)

---

## 📖 Referências

- [OSDev Wiki](https://wiki.osdev.org)
- *Writing a Simple Operating System from Scratch* — Nick Blundell (PDF gratuito)
- *Programming from the Ground Up* — Jonathan Bartlett (PDF gratuito)
- [Godbolt.org](https://godbolt.org)

---

## 👥 Autores

- Matheus Dos Santos
- Victor Mendes

---

## 📄 Licença

MIT

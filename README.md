# Temas de Cursor para COSMIC

Um app simples (Python + GTK4/libadwaita) para trocar o tema do cursor do mouse no
desktop **COSMIC** do Pop!_OS.

## Recursos

- Lista todos os temas de cursor instalados em `~/.local/share/icons`, `~/.icons`,
  `/usr/local/share/icons` e `/usr/share/icons`
- Miniaturas de cada tema (seta, mão, texto e "carregando")
- Passe o mouse sobre um tema para testá-lo antes de aplicar
- Escolha do tamanho do cursor (16 a 96 px)

## Instalação

Requer `python3-gi`, GTK 4 e libadwaita, que já vêm no Pop!_OS 24.04.

```bash
git clone https://github.com/DanielRib03/cosmic-cursor-switcher.git
cd cosmic-cursor-switcher
./install.sh
```

Para remover: `./install.sh --uninstall`

## Como funciona

Ao clicar em **Aplicar**, o tema e o tamanho são gravados em:

| Onde | Para quê |
|---|---|
| `~/.config/environment.d/cursor.conf` | `XCURSOR_THEME`/`XCURSOR_SIZE`, lidos pelo cosmic-comp ao iniciar a sessão |
| `~/.icons/default/index.theme` | Tema padrão para apps X11/Xwayland |
| `gsettings org.gnome.desktop.interface` | Apps GTK abertos mudam na hora |
| Ambiente do systemd/D-Bus | Apps abertos a partir de agora |

O COSMIC só lê o tema do cursor no início da sessão, então o sistema inteiro só muda
depois de encerrar a sessão. O app oferece um botão **Encerrar sessão** logo após aplicar.

# LaTeX Templates

A collection of LaTeX templates.

## Editor Preparation ([screenshot](#screenshot))

### 1. Install VS Code and Extensions

**Visual Studio Code** is strongly recommended as editor for LaTeX projects. You can download and install it from the official site [https://code.visualstudio.com](https://code.visualstudio.com).

Recommended extensions:

- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop): boost LaTeX typesetting efficiency with preview, compile, autocomplete, colorize, and more.
- [Local History](https://marketplace.visualstudio.com/items?itemName=xyz.local-history): maintain local history of files.
- [Bracket Pair Colorizer 2](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2): colorize matching brackets.

You can find them in Visual Studio Code Marketplace (`Ctrl / Cmd + Shift + X`).

### 2. Setup Editor for LaTeX Projects

```bash
# clone this repository
git clone https://github.com/XuehaiPan/LaTeX-Templates.git

# open the project with vscode
code LaTeX-Templates
```

Then install recommended extensions in [`".vscode/extensions.json"`](.vscode/extensions.json), and copy the settings in [`".vscode/settings.json"`](.vscode/settings.json) to your user settings. Refer to [XuehaiPan/OS-Setup/my-vscode-settings](https://github.com/XuehaiPan/OS-Setup/blob/master/my-vscode-settings/settings.json) as a reference.

## Usage

### 3. Compile and Preview with LaTeX Workshop

```bash
code --new-window Assignment   # open a template folder using vscode
```

Open the `main.tex` file in vscode tab, then compile it with LaTeX-Workshop extension tool in the left panel, or use keyboard shortcut: `Ctrl / Cmd + Alt + B`. Get more about the extension features from [wiki](https://github.com/James-Yu/LaTeX-Workshop/wiki).

Useful keyboard shortcuts (may be overridden by keymap settings):

- Build with last used recipe (`Ctrl / Cmd + Alt + B`)
- Clean up auxiliary files (`Ctrl / Cmd + Alt + C`)
- SyncTeX from TeX to PDF (`Ctrl / Cmd + Alt + J`)
- SyncTeX from PDF to TeX (hold `Ctrl` key and click the PDF in the preview panel)
- Format source files using LaTeXIndent (`Ctrl / Cmd + Shift + I`)

### * Manual Compilation

```bash
cd Assignment   # to a template folder
```

#### Compile with Latexmk (Recommended)

```bash
latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape main
```

- clean up auxiliary files

```bash
latexmk -c
```

- build and do cleanup if failed

```bash
latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape main || latexmk -c
```

#### Compile with XeLaTeX and Biber

```bash
# XeLaTeX ➞ Biber ➞ XeLaTeX × 2
xelatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape main
biber main
xelatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape main
xelatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape main
```

## Screenshot

![screenshot](https://user-images.githubusercontent.com/16078332/100626383-bb77ce00-3360-11eb-9b63-ba5769dcd882.png)

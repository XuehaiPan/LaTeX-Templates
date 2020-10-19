# LaTeX Templates

A collection of LaTeX templates.

## Editor Preparation ([screenshot](#screenshot))

### 1. Install VS Code and Extensions

**Visual Studio Code** is strongly recommended as editor for LaTeX projects. You can download and install it from the official site [https://code.visualstudio.com](https://code.visualstudio.com).

Recommended extensions:

- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop): boost LaTeX typesetting efficiency with preview, compile, autocomplete, colorize, and more.
- [Local History](https://marketplace.visualstudio.com/items?itemName=xyz.local-history): maintain local history of files.
- [Bracket Pair Colorizer 2](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2): colorize matching brackets.

You can find them in Visual Studio Code Marketplace (`ctrl / cmd + shift + X`).

### 2. Setup Editor for LaTeX Projects

```shellscript
# clone this repository
git clone https://github.com/XuehaiPan/LaTeX-Templates.git

# open the project with vscode
code LaTeX-Templates
```

Then install recommended extensions in [`".vscode/extensions.json"`](.vscode/extensions.json), and copy the settings in [`".vscode/settings.json"`](.vscode/settings.json) to your user settings. Refer to [XuehaiPan/OS-Setup/my-vscode-settings](https://github.com/XuehaiPan/OS-Setup/blob/master/my-vscode-settings/settings.json) as a reference.

## Usage

### 3. Compile and Preview with LaTeX Workshop

```shellscript
code --new-window Assignment   # open a template folder using vscode
```

Open the `main.tex` file in vscode tab, then compile it with LaTeX-Workshop extension tool in the left panel, or use keyboard shortcut: `ctrl / cmd + alt + B`. Get more about the extension features from [wiki](https://github.com/James-Yu/LaTeX-Workshop/wiki).

Useful keyboard shortcuts (may be override by keymap settings):

- Build with last used recipe (`ctrl / cmd + alt + B`)
- Clean up auxiliary files (`ctrl / cmd + alt + C`)
- SyncTeX from tex to pdf (`ctrl / cmd + alt + J`)
- SyncTeX from pdf to tex (hold `ctrl` key and click the pdf in the preview panel)
- Format source files using LaTeXIndent (`ctrl / cmd + shift + I`)

### * Manual Compilation

```shellscript
cd Assignment   # to a template folder
```

Compile with LaTeXmk (Recommended)

```shellscript
latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape main
```

Compile with XeLaTeX and Biber

```shellscript
# XeLaTeX ➞ Biber ➞ XeLaTeX × 2
xelatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape main
biber main
xelatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape main
xelatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape main
```

## Screenshot

![screenshot](./assets/screenshot.png)

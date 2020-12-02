# LaTeX Templates

A collection of LaTeX templates. ([screenshots](#screenshots))

## Editor Preparation

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

# open the project with VS Code
code LaTeX-Templates
```

Then install recommended extensions in [`".vscode/extensions.json"`](.vscode/extensions.json), and copy the settings in [`".vscode/settings.json"`](.vscode/settings.json) to your user settings. Refer to [XuehaiPan/OS-Setup/my-vscode-settings](https://github.com/XuehaiPan/OS-Setup/blob/master/my-vscode-settings/settings.json) as a reference.

## Usage

### 3. Compile and Preview with LaTeX Workshop

```bash
code --new-window Assignment   # open a template folder using VS Code
```

Open the `main.tex` file in a VS Code tab, then compile it with LaTeX-Workshop extension tool in the left panel, or use keyboard shortcut: `Ctrl / Cmd + Alt + B`. Get more about the extension features from [wiki](https://github.com/James-Yu/LaTeX-Workshop/wiki).

Useful keyboard shortcuts (may be overridden by keymap settings):

- View LaTeX PDF file (`Ctrl / Cmd + Alt + V`)
- Build with last used recipe (`Ctrl / Cmd + Alt + B`)
- Clean up auxiliary files (`Ctrl / Cmd + Alt + C`)
- SyncTeX from cursor in TeX file to PDF (`Ctrl / Cmd + Alt + J`)
- SyncTeX from PDF to TeX file (hold `Ctrl / Cmd` key and click on PDF in the preview panel)
- Format source files using latexindent (`Ctrl / Cmd + Shift + I`)

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

## Screenshots

### Templates

---

<table>
  <tr>
    <td align="center">Assignment</td>
    <td align="center">Essay</td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://user-images.githubusercontent.com/16078332/100871042-90b18500-34da-11eb-8ca4-9982e2df2a62.gif">
    </td>
    <td align="center">
      <img src="https://user-images.githubusercontent.com/16078332/100871056-9313df00-34da-11eb-849f-7958169efe39.gif">
    </td>
  </tr>
  <tr>
    <td align="center">Presentation</td>
    <td align="center">NeurIPS 2020</td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://user-images.githubusercontent.com/16078332/100871065-95763900-34da-11eb-9d5a-1a1bb197478b.gif">
    </td>
    <td align="center">
      <img src="https://user-images.githubusercontent.com/16078332/100871069-96a76600-34da-11eb-87c8-63460d878e6b.gif">
    </td>
  </tr>
</table>

### Workspace

---

- set `"latex-workshop.view.pdf.viewer": "tab"`
<p align="center">
  <img src="https://user-images.githubusercontent.com/16078332/100730349-ea478000-3404-11eb-8e7c-31407980eefa.png">
  View PDF in a VS Code tab.
</p>

- set `"latex-workshop.view.pdf.viewer": "external" // or "browser"`

<p align="center">
  <img src="https://user-images.githubusercontent.com/16078332/100730404-f92e3280-3404-11eb-9f7b-72f2727905bf.png">
  View PDF in the external viewer or web browser (for multiple monitor setup).
</p>

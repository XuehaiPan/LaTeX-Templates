# LaTeX Templates

A collection of LaTeX templates in English / Chinese, with VS Code settings for LaTeX Workshop. ([screenshots](#screenshots))

### Table of Contents  <!-- omit in toc -->

- [Editor Preparation](#editor-preparation)
  - [1. Preliminaries](#1-preliminaries)
  - [2. Install VS Code and Extensions](#2-install-vs-code-and-extensions)
  - [3. Setup Editor for LaTeX Projects](#3-setup-editor-for-latex-projects)
- [Usage](#usage)
  - [4. Compile and Preview with LaTeX Workshop](#4-compile-and-preview-with-latex-workshop)
  - [* Manual Compilation](#-manual-compilation)
    - [Compile with Latexmk (Recommended)](#compile-with-latexmk-recommended)
    - [Compile with XeLaTeX and Biber](#compile-with-xelatex-and-biber)
- [Screenshots](#screenshots)

## Editor Preparation

### 1. Preliminaries

Download and install a TeX distribution (e.g., [TeX Live](https://www.tug.org/texlive/)) on your device.

#### Install TeX Live  <!-- omit in toc -->

**Windows:** download and invoke the TeX Live installer [install-tl-windows.exe](http://mirror.ctan.org/systems/texlive/tlnet/install-tl-windows.exe). Or install TeX Live using [Chocolatey](https://chocolatey.org):

```powershell
choco install texlive --params="'/scheme:full'"
```

**macOS:** install MacTeX using [Homebrew](https://brew.sh):

```bash
brew install --cask mactex
```

**Linux:** manual installation:

```bash
wget -O - http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz |
    tar -xz --strip-components=1 --one-top-level=install-tl-unx &&
    cd install-tl-unx &&
    sudo ./install-tl
```

#### (Optional) Install dependencies for `minted` and `latexindent`  <!-- omit in toc -->

```bash
# Install Pygments for code highlighting with minted in LaTeX
pip3 install Pygments  # for Windows / macOS / Linux
brew install pygments  # for macOS

# Install dependencies for latexindent
cpan -i -T File::HomeDir Log::Log4perl Log::Dispatch::File \
        YAML::Tiny Unicode::GCString
```

### 2. Install VS Code and Extensions

**Visual Studio Code** is strongly recommended as the editor for LaTeX projects. You can download and install it from the official site at [https://code.visualstudio.com](https://code.visualstudio.com).

Recommended extensions:

- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop): boost LaTeX typesetting efficiency with preview, compile, autocomplete, colorize, and more.
- [LaTeX Utilities](https://marketplace.visualstudio.com/items?itemName=tecosaur.latex-utilities): An add-on to LaTeX Workshop that provides some fancy features.
- [Local History](https://marketplace.visualstudio.com/items?itemName=xyz.local-history) (optional): maintain local history of files.

You can find them in Visual Studio Code Marketplace (shortcut: <kbd>Ctrl / Cmd + Shift + X</kbd>).

### 3. Setup Editor for LaTeX Projects

```bash
# Clone this repository
git clone --depth=1 https://github.com/XuehaiPan/LaTeX-Templates.git

# Open the project with VS Code
code LaTeX-Templates
```

Then install recommended extensions in [`".vscode/extensions.json"`](.vscode/extensions.json), and copy the settings in [`".vscode/settings.json"`](.vscode/settings.json) to your user settings. Refer to [XuehaiPan/Dev-Setup/my-vscode-settings](https://github.com/XuehaiPan/Dev-Setup/blob/master/my-vscode-settings/settings.json) as a reference.

## Usage

### 4. Compile and Preview with LaTeX Workshop

```bash
code --new-window Assignment   # open a template folder using VS Code
```

Open the `main.tex` file in a VS Code tab, then compile it with LaTeX-Workshop extension tool in the left panel, or use keyboard shortcut <kbd>Ctrl / Cmd + Alt + B</kbd>. See the [wiki](https://github.com/James-Yu/LaTeX-Workshop/wiki) page of LaTeX-Workshop for more details about the extension features.

Some useful keyboard shortcuts (may be overridden by keymap settings):

- View LaTeX PDF file (<kbd>Ctrl / Cmd + Alt + V</kbd>)
- Build with last used recipe (<kbd>Ctrl / Cmd + Alt + B</kbd>)
- Clean up auxiliary files<sup>[*](#note)</sup> (<kbd>Ctrl / Cmd + Alt + C</kbd>)
- SyncTeX from cursor in TeX file to PDF (<kbd>Ctrl / Cmd + Alt + J</kbd>)
- SyncTeX from PDF to TeX file (hold the <kbd>Ctrl / Cmd</kbd> key and click on the PDF in the preview panel)
- Format source files using `latexindent` (<kbd>Ctrl / Cmd + Shift + I</kbd>)

  <a name="note">*</a> *You don't need to do cleanup frequently, please do it only when necessary (e.g., **on build failed**). (Keep these auxiliary files can speed up the next compilation.)*

### * Manual Compilation

```bash
cd Assignment  # navigate to a template folder first
```

#### Compile with Latexmk (Recommended)

```bash
latexmk -xelatex -synctex=1 -shell-escape \
    -interaction=nonstopmode -file-line-error \
    -output-directory=out main
```

- clean up auxiliary files<sup>[*](#note)</sup>

  ```bash
  latexmk -c -output-directory=out
  ```

- build and do cleanup if failed

  ```bash
  latexmk -xelatex -synctex=1 -shell-escape \
      -interaction=nonstopmode -file-line-error \
      -output-directory=out main ||
      latexmk -c -output-directory=out
  ```

#### Compile with XeLaTeX and Biber

Execute `xelatex` multiple times to resolve cross-references in the document.

```bash
# XeLaTeX ➞ Biber ➞ XeLaTeX × 2
xelatex -synctex=1 -shell-escape \
    -interaction=nonstopmode -file-line-error \
    -output-directory=out main
biber --output-directory=out main
xelatex -synctex=1 -shell-escape \
    -interaction=nonstopmode -file-line-error \
    -output-directory=out main
xelatex -synctex=1 -shell-escape \
    -interaction=nonstopmode -file-line-error \
    -output-directory=out main
```

## Screenshots

### Templates  <!-- omit in toc -->

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
    <td align="center">NeurIPS 2021</td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://user-images.githubusercontent.com/16078332/111862242-0dd00f80-898f-11eb-8df2-d57fdbac2d1b.gif">
    </td>
    <td align="center">
      <img src="https://user-images.githubusercontent.com/16078332/100871069-96a76600-34da-11eb-87c8-63460d878e6b.gif">
    </td>
  </tr>
</table>

### Workspace  <!-- omit in toc -->

---

- set `"latex-workshop.view.pdf.viewer": "tab"`

<p align="center">
  <img src="https://user-images.githubusercontent.com/16078332/111870724-51437180-89c1-11eb-842c-6302b31a6a96.png">
  View PDF in a VS Code tab.
</p>

- set `"latex-workshop.view.pdf.viewer": "external" // or "browser"`

<p align="center">
  <img src="https://user-images.githubusercontent.com/16078332/111870727-53a5cb80-89c1-11eb-96e4-dcff0e0de78b.png">
  View PDF in the external viewer or a web browser (for multi-monitor setup).
</p>

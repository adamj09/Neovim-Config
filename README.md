# **Installation**
Perform a clean installation of Neovim. Then, just clone the repo into *%USERPROFILE%\AppData\Local* for Windows, 
and *~/.config* for Linux. Change name of the folder "Neovim-Config" to "nvim". Upon launching Neovim, the configuration
should automatically install.

For Java support you will need to change some paths defined in the *../ftplugin/java.lua* file.
The paths needed to be changed are indicated in the file.

# **Requirements**
- [Neovim](https://neovim.io/) version >= 0.9.0
- [Git](https://git-scm.com/)
- [Ripgrep](https://github.com/BurntSushi/ripgrep)
- [Any Nerd font](https://www.nerdfonts.com/)
- [Python 3](https://www.python.org/downloads/) (for clang-format installation)
- [JDK](https://www.oracle.com/ca-en/java/technologies/downloads/#java22) version 17 or greater (for Java support)
- [JDT Language Server](https://github.com/eclipse-jdtls/eclipse.jdt.ls)
- [java-debug](https://github.com/microsoft/java-debug) (follow the installation instructions [here](https://github.com/mfussenegger/nvim-jdtls#java-debug-installation))
- [vscode-java-test](https://github.com/microsoft/vscode-java-test) (follow the installation instructions [here](https://github.com/mfussenegger/nvim-jdtls?tab=readme-ov-file#vscode-java-test-installation))
- [Node.js](https://nodejs.org/en)

# **Notes**
Personally, this config looks better with a transparent terminal, since the background for the installed colourscheme is
turned off by default (you can change this in *../lua/plugins/toykonight.lua* by passing an empty setup function.

Here are the colourscheme and opacity settings I use in Windows Terminal:
- Foreground colour: #FFFFFF 
- Background colour: #1A1B26
- Cursor colour: #FFFFFF
- Selection background colour: #292E42
- Opacity: 90%

# My emacs.d
私が使っているemacsの設定です。
- [anything](http://www.emacswiki.org/emacs/anything)
- [arduino-mode](http://wikemacs.org/wiki/Arduino-mode)
- [auto-complete](http://cx4a.org/software/auto-complete/index.ja.html)
- [linenumbers](http://www.emacswiki.org/emacs/LineNumbers)
- [markdown-mode](http://jblevins.org/projects/markdown-mode/)
- [minimap](http://www.emacswiki.org/emacs/MiniMap)
- [emacs-color-themes](https://github.com/owainlewis/emacs-color-themes#contributors)
- [yaml-mode](https://github.com/yoshiki/yaml-mode)
- [auto-complete-latex](http://www.emacswiki.org/emacs/auto-complete-latex.el)
- neo tree
- magit
- hs-tiggle-hiding
- cua-mode
が含まれています。

#####動作環境
OS      :  Ubuntu 14.04 LTS  
Version :  GNU Emacs 24.3.1

##インストール
ホームディレクトリ直下で、```git clone```を使ってダウンロードしてください。
```
cd ~/
git clone https://github.com/shimoe/.emacs.d
```
これだけでも使えますが、byte-compileを行うと、起動がほんの少し早くなります。（多分...）
```
cd ~/.emacs.d/
emacs -batch -f batch-byte-compile Makefile
```

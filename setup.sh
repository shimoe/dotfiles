#!/bin/bash

dotfiles=$(cd "$(dirname $0)"; pwd)

 for file in $dotfiles/.??*
 do
     test $file = $dotfiles/.git && continue
     test $file = $dotfiles/.gitignore && continue
     ln -sf $file $HOME
 done

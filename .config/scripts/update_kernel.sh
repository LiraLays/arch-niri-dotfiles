#!/bin/bash

KERNEL=linux-zen # измени это на linux-lts или linux-zen, если используешь их

yay -Syu --noconfirm # замени `pacman -Syu` на `yay` , если используешь yay
if [ $? == 1 ]; then
  exit
fi

uname -r | grep -q $(pm -Q $KERNEL | awk '{print $2}')
if [ $? == 1 ]; then
  notify-send 'Ядро обновлено!' 'Требуется перезагрузка.'
fi

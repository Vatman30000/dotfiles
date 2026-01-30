#!/bin/bash

DIR="/home/alexandr/Videos/wallpapers" # папка с видео
HWDEC="vaapi"                          # hwdec для mpv (auto/vaapi/nvdec и т.п.)
INTERVAL=$((10 * 60))                  # 10 минут в секундах

while true; do
  # выбираем случайное видео из папки (только файлы)
  FILE="$(find "$DIR" -maxdepth 1 -type f | shuf -n 1)"

  # если ничего не нашли — подождать и попробовать ещё раз
  [ -z "$FILE" ] && sleep 10 && continue

  echo "Запускаю обои: $FILE"

  # убиваем предыдущий xwinwrap (если был)
  killall xwinwrap 2>/dev/null

  # запускаем новый xwinwrap + mpv
  xwinwrap -fs -ni -b -s -st -sp -nf -- mpv --vf=fps=12 \
    --wid=%WID --vo=gpu --profile=low-latency --scale=bilinear --no-audio --screen=1 --no-osc --no-osd-bar --loop-file=inf \
    --title=mpv-wallpaper \
    --x11-name=mpv-wallpaper \
    --hwdec="$HWDEC" "$FILE" &

  # ждём нужный интервал
  sleep "$INTERVAL"
done

# -*- coding: utf-8 -*-
# Лёгкий конфиг для слабых машин
config.load_autoconfig()
c = c  # объект конфига уже есть в окружении qutebrowser

# --- Рендеринг / Qt ---
# Использовать GPU, не форсить софт-рендеринг
c.qt.force_software_rendering = 'none'  # вместо 'software' или 'qt'

# Меньше анимаций интерфейса Qt
c.qt.args = [
    'disable-smooth-scrolling',
    'disable-gpu-vsync',
]

# --- Кэш и история ---
# Ограничить размер дискового кэша
c.content.cache.size = 50 * 1024 * 1024  # 50 МБ
# Ограничить историю автодополнения
c.completion.web_history.max_items = 100

# --- Реклама и трекеры ---
# Включаем блокировку рекламы (не забудь :adblock-update)
c.content.blocking.enabled = True
c.content.blocking.method = 'both'  # hosts + adblock

# --- JS и тяжёлые функции ---
# WebGL часто жрёт память → отключаем
c.content.webgl = False
# Автоплей медиа отключаем
c.content.autoplay = False
# Видеодекодинг: запретить картинки-видео в фоне
c.content.prefers_reduced_motion = True

# --- Упрощение UI ---
# Не грузим лишнее в статусбаре
c.statusbar.show = 'in-mode'
# Не рисуем вкладки, если используешь буфер/команды
# (если вкладки нужны — закомментируй строку)
c.tabs.show = 'never'

# --- Прочее для снижения «шума» ---
# Меньше запросов к сайтам
c.content.notifications.enabled = False
c.content.cookies.accept = 'no-3rdparty'

# --- Поведение вкладок ---
# Новые вкладки в фоне, чтобы не спамить рендерингом
c.tabs.background = True
# Закрывать всплывающие пустые вкладки
c.tabs.last_close = 'close'
c.tabs.position = "right"  # left / right / top / bottom
config.bind('xt', 'config-cycle tabs.show always never')


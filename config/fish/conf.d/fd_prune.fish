# ~/.config/fish/conf.d/fd_prune.fish
# Shared exclusions for interactive pickers (fe, fcd).
# Leading / = anchored to the search root. No slash = matches at any depth.
set -g fd_prune \
    --exclude /Library \
    --exclude '/Calibre Library' \
    --exclude /Movies \
    --exclude /Music \
    --exclude /Pictures \
    --exclude /Applications \
    --exclude /Public \
    --exclude .Trash \
    --exclude .git \
    --exclude .cache \
    --exclude node_modules \
    --exclude .venv \
    --exclude '*.app' \
    --exclude '*.photoslibrary' \
    --exclude '*.imovielibrary' \
    --exclude '*.tvlibrary'

### The repository is on the official overlay website now.

## Add overlay with `eselect-repository`
```sh
eselect repository enable jabuxas
```
## To add manually:

```sh
[jabuxas]
location = /var/db/repos/jabuxas
sync-type = git
sync-uri = https://github.com/jabuxas/overlay.git
priority = 100
```
Sync with `emaint sync -r jabuxas`

## Packages
- [path-of-building](https://pathofbuilding.community/): offline path of exile build planner
- [kami](https://github.com/mrfluffy-dev/kami): favorite webnovel reader
- [amberol](https://apps.gnome.org/app/io.bassi.Amberol/): gui music player (I also mantain it on GURU)
- [redshift](http://jonls.dk/redshift/): night light but wayland fork
- [wshowkeys](https://sr.ht/~sircmpwn/wshowkeys/): fork that should work with modern wlroots
- [linux wallpaper engine](https://github.com/Almamu/linux-wallpaperengine): wallpaper engine for linux 

## As of writing this repository is not yet added to the Trusted List on Portage Overlay.

# Add overlay
```sh
eselect repository add jabuxas git https://github.com/jabuxas/overlay.git
emaint sync -r jabuxas
```
# To add manually:

```sh
[jabuxas]
location = /var/db/repos/jabuxas
sync-type = git
sync-uri = https://github.com/jabuxas/overlay.git
priority = 100
```
Sync with `emaint sync -r jabuxas`

# Packages
- [path-of-building](https://pathofbuilding.community/) offline path of exile build planner
- [kami](https://github.com/mrfluffy-dev/kami) favorite webnovel reader
- [amberol](https://apps.gnome.org/app/io.bassi.Amberol/) gui music player
- [redshift](http://jonls.dk/redshift/) night light but wayland fork
- [wshowkeys](https://sr.ht/~sircmpwn/wshowkeys/) fork that should work with modern wlroots

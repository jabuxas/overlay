** As of writing this repository is not yet added to the Trusted List on Portage Overlay.

*** To add via eselect repository:

#+begin_src bash
eselect repository add jabuxas git https://github.com/jabuxas/overlay.git
emaint sync -r jabuxas
#+end_src

*** To add manually:

#+begin_src bash
[jabuxas]
location = /var/db/repos/jabuxas
sync-type = git
sync-uri = https://github.com/jabuxas/overlay.git
priority = 100
#+end_src

Sync with ~emaint sync -r jabuxas~

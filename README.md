This is a very preliminary Fuse .ux and .uno filetype plugin for VIM.

This it what it do:

* Introduces new filetypes uno and xml
* Uses cs syntax, indent rules etc for .uno files
* Uses xml syntax, and indent rules for .ux files
* Add syntastic support for .ux files, by ignoring ux: namespace errors
* Syntastic support for .uno files
  - NOTE: Depends on `uno lint` command, which is available in Fuse 0.27+

Yeah, it's not much. But it will hopefully become more interesting later..


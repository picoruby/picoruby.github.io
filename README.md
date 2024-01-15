# picoruby.github.io

## Web site

https://picoruby.github.io/

## First time setup

```console
rake setup
```

## Generating document process

1. `rake s` starts jelyll local server (Open Then open http://localhost:4000)
1. Edit `picoruby/mrbgems/picoruby-*/sig/*.rbs`
1. `rake`
1. `lib/rbc_doc.rb` is loaded
1. `RBSDoc::Generator` instance collects RBS info
1. Markdown files are generated in `pages/rbs_doc/`
1. Jekyll process automatically generates html

## Files to be patched

### Generator

`lib/rbs_doc/**/*`

### RBSs

Generally in `picoruby/mrbgems/picoruby-*/sig/*.rbs`

#### Annotation

(We need to detail more)

- Sidebar: @sidebar [builtin|io_peripheral|prk_firmware|hardware_device]
- Extension: @added_by [gem name]

### HTML layouts and partials

`_layouts/*.html` and `_includes/*.html`


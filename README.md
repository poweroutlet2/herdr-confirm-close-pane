# herdr-confirm-close-pane

A [herdr](https://github.com/ogulcancelik/herdr) plugin that asks for
confirmation before closing a pane, just like tmux's `prefix+x`
`confirm-before` prompt.

Press your chosen key (defaults to `prefix+x`) and a small overlay asks:

```
Close pane 1-2? (y/n):
```

Press `y` to close the pane, or anything else / `Esc` to cancel. The overlay
disappears either way.

## Requirements

- herdr **0.7.0** or newer.
- Linux or macOS. Not supported on Windows.

## Install

```sh
herdr plugin install poweroutlet2/herdr-confirm-close-pane
```

Then add the keybinding to your herdr config (e.g.
`~/.config/herdr/config.toml` on Linux, or
`~/Library/Application Support/herdr/config.toml` on macOS).

First disable the built-in `prefix+x` close so the confirmed version can take
the key, then map that key to the plugin action:

```toml
[keys]
close_pane = ""

[[keys.command]]
key = "prefix+x"
command = "confirm-close-pane.confirm-close-pane"
type = "plugin_action"
description = "Close pane (with confirmation)"
```

Reload herdr (`prefix+shift+r`, or restart). You can confirm the action is
registered:

```sh
herdr plugin list
```

## Use a different key

To keep the default close and pick another key, e.g. `prefix+shift+x`:

```toml
[[keys.command]]
key = "prefix+shift+x"
command = "confirm-close-pane.confirm-close-pane"
type = "plugin_action"
```

## Uninstall

```sh
herdr plugin uninstall confirm-close-pane
```
and remove the `[[keys.command]]` block from your config.

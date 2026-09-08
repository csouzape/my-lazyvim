# my-lazyvim

Just another Neovim config installer. Nothing fancy, nothing revolutionary,
just a script that gets LazyVim set up the way I like it without me having
to remember the steps every time I reinstall my system.

There's an `install.sh` that does the actual work.

## What it actually does

It's a 68-line bash script, so let's not pretend this is some elaborate
framework. It does exactly four things:

- If you already have a `~/.config/nvim`, it backs it up to
  `~/.config/nvim.backup.<timestamp>` instead of just nuking it. I've
  clobbered my own config often enough to know better.
- Clones the [LazyVim starter](https://github.com/LazyVim/starter), because
  writing your own plugin manager in 2026 is not a good use of anyone's
  time.
- Strips the `.git` directory from the clone, because you don't want
  somebody else's commit history sitting in your own dotfiles repo.
- Copies the repository's `lua/plugins/colorscheme.lua` into the installed
  Neovim configuration.
- Drops in a `colorscheme.lua` for Catppuccin Mocha with a transparent
  background applied across the usual suspects: `Normal`, `NormalNC`,
  `SignColumn`, `StatusLine`, `LineNr`, `WinSeparator`, and so on.

That's it. No plugin bloat added on top of what LazyVim starter already
ships with.

## Installing it

```bash
git clone https://github.com/csouzape/my-lazyvim.git
cd my-lazyvim
chmod +x install.sh
./install.sh
```

Then open `nvim` and let lazy.nvim pull down the plugins on first run. Don't
panic if it takes a minute, it's downloading things, not being slow for fun.

## Requirements

- A reasonably recent Neovim. If yours is ancient, that's not this script's
  problem.
- `git`, obviously, since that's how the starter gets cloned.
- A terminal that actually supports transparency, configured at the
  compositor/WM level. If your background isn't see-through after running
  this, the `colorscheme.lua` isn't the thing to blame — your terminal
  emulator or compositor setup is.

## Will this wreck my existing config?

No. Anything already in `~/.config/nvim` gets moved out of the way into a
timestamped backup before anything is touched. If something still goes
wrong, the backup is sitting right there. That said, read the script before
running it if you don't trust me — that's just good sense regardless of
whose script it is.

## Contributing

Bug reports need actual information: what you ran, what you expected, what
happened instead. "It doesn't work" tells me nothing. Small, focused PRs
are welcome. Giant PRs bundling five unrelated changes will get bounced
back until you split them up.

## License

MIT. Do what you want with it. Just don't come complaining if you ran it
without reading it first and it ate something you cared about.

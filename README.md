# homebrew-skip (Vindhya Data Science)

Homebrew tap for the Vindhya Data Science build of the [Skip](https://skip.dev) CLI.
The `skip` cask installs `skip-macos.zip` from a
[vindhyadatascience/skipstone](https://github.com/vindhyadatascience/skipstone/releases)
release (AGPL-3.0; the matching tag in that repository is the corresponding source).
`skip version` reports the VDS version, for example `Skip version 1.9.19-vds.7`.

It replaces the stock `skiptools/skip` cask, so remove that first:

```shell
brew uninstall --cask skip
brew tap vindhyadatascience/skip
brew install --cask vindhyadatascience/skip/skip
skip version
```

macOS only. The cask follows the structure of
[skiptools/homebrew-skip](https://github.com/skiptools/homebrew-skip)'s `Casks/skip.rb`.

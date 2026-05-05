# homebrew-chunghwa

Homebrew tap for [ChungHwa](https://github.com/ChloePike/chunghwa) — a
native macOS mihomo client.

## Install

```sh
brew tap chloepike/chunghwa
brew install --cask chunghwa
```

After install:

- `ChungHwa.app` lives in `/Applications/`.
- The cask runs `xattr -dr com.apple.quarantine` on the bundle so macOS
  Gatekeeper doesn't block the first launch (ChungHwa is unsigned).

## Update

```sh
brew upgrade --cask chunghwa
```

## Uninstall

```sh
brew uninstall --cask chunghwa
brew uninstall --zap --cask chunghwa   # also wipes Application Support / prefs / caches
```

## Notes

- Apple Silicon and Intel both supported — Homebrew picks the matching
  slice automatically (`arm64` vs `x86_64`).
- Updates here lag the upstream GitHub Release by however long it takes
  to bump the cask's `version` and SHA256s. If you want the absolute
  latest, grab the DMG from
  [Releases](https://github.com/ChloePike/chunghwa/releases) directly.

## License

The cask formula is MIT. ChungHwa itself is GPL v3.

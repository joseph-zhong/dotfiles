# dotfiles
.

## Installation

```
git clone git@github.com:joseph-zhong/dotfiles.git --recursive
cd dotfiles
./update.sh
```

## TODO

- [ ] Add update script that auto-commits any local changes and updates to
  latest private aliases
- [ ] Fixes a bug in the update script which creates an erroneous symblink
  to the same parent dir, e.g. (.private_aliases/ will have an additional
  .private_aliases/.private_aliases)

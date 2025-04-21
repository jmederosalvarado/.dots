# My dotfiles

```sh
sh ./setup.sh
```

## Tips

### Touch ID for Sudo

In order to allow touch id to be used instead of sudo password in the terminal. Create or modify file `etc/pam.d/sudo_local` to contain the following line:
```
auth         sufficient         pam_tid.so
```

There is a template for this file shipped with macos at `/etc/pam.d/sudo_local.template`.

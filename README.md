# arch-repo

Repo for arch packages. Provides the following packages:

* `eupnea-utils`: Packaged eupnea scripts from the [utils](https://github.com/eupnea-project/eupnea-utils) repo.
* `eupnea-system`: Does not install anything per se, but instead includes a postinstall hook which
  executes [system-update.py](https://github.com/eupnea-project/system-update) to upgrade between Depthboot/EupneaOS
  versions.
* `eupnea-mainline-kernel` + `modules` + `headers`: Mainline eupnea kernel, modules and headers.
  See [eupnea-mainline-kernel](https://eupnea-project.github.io/docs/project/kernels#mainline-eupnea-kernel)
* `eupnea-chromeos-kernel` + `modules` + `headers`: ChromeOS eupnea kernel, modules and headers.
  See [eupnea-chromeos-kernel](https://eupnea-project.github.io/docs/project/kernels#chromeos-eupnea-kernel)
* `cgpt-vboot-utils`: Repackaged Ubuntu debs for cgpt and vboot-utils.
* `keyd`: A key remapping daemon for linux, made by rvaiya. See [keyd](https://github.com/rvaiya/keyd)
* `depthboot-logo`: [Alpine busybox-static](https://dl-cdn.alpinelinux.org/alpine/v3.17/main/x86_64/busybox-static-1.35.0-r29.apk) +
  Depthboot logo boot splash systemd service.

# Add to system

```
# create local master key if it doesn't exist yet
sudo pacman-key --init
# download and import public eupnea key
curl -L https://eupnea-project.github.io/pkg-repo/public_key.gpg | sudo gpg --homedir /etc/pacman.d/gnupg --import
# sign public key
sudo pacman-key --lsign-key 4F8A31EAADF1588D0B45A0DAAC87331A20A7250A
# add repo to pacman.conf
echo -e "[eupnea]"$'\n'"Server = https://eupnea-project.github.io/pkg-repo/repodata/\$arch" | sudo tee -a /etc/pacman.conf
# refresh all repos and update system
sudo pacman -Syyu
```

# Forking this repo

1. Fork only the main branch.
2. Create your own public/private key pair for signing packages with gpg: `gpg --full-gen-key`. This repo uses an rsa4096
   key, but you can probably use whatever you want. Make sure the key doesn't expire.
3. Export your public key: `gpg --export --armor <key-id>` and add it as a secret variable called `PUBLIC` to your repo.
4. Export your private key: `gpg ---export-secret-keys --armor <key-id>` and add it as a secret variable
   called `PRIVATE` to your repo.
5. Run any action.`
6. Set up pages in the repo settings. Select from branch: `gh-pages` and folder: `/(root)`.
7. Wait for GitHub to finish deploying the page.

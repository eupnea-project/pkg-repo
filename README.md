# arch-repo

Repo for arch packages. Provides the following packages:

* `eupnea-utils`: Packaged eupnea scripts from the [utils](https://github.com/eupnea-linux/eupnea-utils)
  and [audio](https://github.com/eupnea-linux/audio-scripts/) repos.
* `eupnea-system`: Does not install anything per se, but instead includes a postinstall hook, which
  executes [system-update.py](https://github.com/eupnea-linux/system-update) to upgrade between Depthboot/EupneaOS
  versions.
* `eupnea-mainline-kernel` + `modules` + `headers`: Mainline kernel, modules and headers.
  See [eupnea-mainline-kernel](https://eupnea-linux.github.io/docs/project/kernels#mainline-eupnea-kernel)
* `eupnea-chromeos-kernel` + `modules` + `headers`: ChromeOS kernel, modules and headers.
  See [eupnea-chromeos-kernel](https://eupnea-linux.github.io/docs/project/kernels#chromeos-eupnea-kernel)
* `cgpt-vboot-utils`: Repackaged Ubuntu debs for cgpt and vboot-utils.
* `keyd`: A key remapping daemon for linux, made by rvaiya. See [keyd](https://github.com/rvaiya/keyd)
* `depthboot-logo`: [Alpine busybox-static](https://dl-cdn.alpinelinux.org/alpine/v3.17/main/x86_64/busybox-static-1.35.0-r29.apk) +
  Depthboot logo boot splash systemd service.

# Add to system

```
wget -O /tmp/eupnea.key https://eupnea-linux.github.io/arch-repo/public_key.gpg
sudo pacman-key --add /tmp/eupnea.key
sudo pacman-key --lsign-key 94EB01F3608D3940CE0F2A6D69E3E84DF85C8A12
echo "[eupnea]"$'\n'"Server = https://eupnea-linux.github.io/arch-repo/repodata/$arch" | sudo tee -a /etc/pacman.conf
sudo pacman -Syy
sudo pacman -S eupnea-utils eupnea-system cgpt-vboot-utils
```

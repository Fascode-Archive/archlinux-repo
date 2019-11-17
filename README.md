# pacman-repo
ArchISOで使用するためのリポジトリです。  
pacman.confに以下を追加することで利用できます。

```
[hayao]
Server = https://hayao0819.github.io/pacman-repo/repo/$arch
SigLevel = Optional TrustAll
```

# このリポジトリのパッケージをすべて入れる

```
sudo cat << EOF >> /etc/pacman.conf
[hayao]
Server = https://hayao0819.github.io/pacman-repo/repo/$arch
SigLevel = Optional TrustAll
EOF
sudo pacman -Ss | grep hayao | awk '{print $1}' | sudo pacman -S -
```
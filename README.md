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
sudo echo -e "
[hayao]\n
Server = https://hayao0819.github.io/pacman-repo/repo/$arch\n
SigLevel = Optional TrustAll\n
" >> /etc/pacman.conf
sudo pacman -Ss | grep hayao | awk '{print $1}' | sudo pacman -S -
```
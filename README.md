# This repository is currently unmaintained.
I used to publish the Arch Linux repository using GitHub Pages, but I stopped using it because it is not the correct way to use Git.  
This repository is now published on a different URL. If you have already registered in `pacman.conf`, please use the new URL.  
Also, most of the packages published in this repository are registered in the Alter Linux repository.  
You also need to add an AlterLinux keyring to any repository.  
  
# このリポジトリは現在メンテナンスされていません
以前はGitHub Pagesを使用してArch Linuxリポジトリを公開していましたが、Gitの本来の正しい使用方法ではないため、使用を中止しました。  
このリポジトリは現在は別のURL上で公開されています。既に`pacman.conf`に登録している方は新しいURLを使用して下さい。  
また、このリポジトリに公開されているパッケージの大部分はAlterLinuxのリポジトリに登録されています。そちらをご利用ください。  
また、どのリポジトリでもAlterLinuxのキーリングを追加する必要があります。  

# Add keyring
```
curl -L -o "/tmp/fascode.pub" "https://xn--d-8o2b.com/repo/fascode.pub"
pacman-key -a "/tmp/fascode.pub"
pacman-key --lsign-key development@fascode.net
rm -f "/tmp/fascode.pub"
```

# New URL

```
[hayao]
Server = https://xn--d-8o2b.com/repo/$repo/$arch
```

# AlterLinux Repository
```
[alter-stable]
Server = https://xn--d-8o2b.com/repo/$repo/$arch

[alter-testing]
Server = https://xn--d-8o2b.com/repo/$repo/$arch

[alter-kernel]
Server = https://xn--d-8o2b.com/repo/$repo/$arch
```
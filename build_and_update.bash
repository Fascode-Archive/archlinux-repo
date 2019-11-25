#!/usr/bin/env bash

## 変数
add_pkg_aur=($@)
repo_name=hayao
working_directory=/tmp/build_aur
number_of_pkg_aur=${#add_pkg_aur[*]}
export_directory=$(pwd)


## Rootチェック
if [[ $UID = 0 ]]; then
    echo "Rootで実行しないでください。"
    exit 1
fi


# 引数チェック
if [[ -z $@ ]]; then
    echo "何も指定されていません。"
    exit 1
fi


## Gitチェック
if [[ -z $( pacman -Q | awk '{print $1}' | grep -x "git" ) ]]; then
    sudo pacman -Syy
    sudo pacman -S git
fi


# 作業ディレクトリ作成
if [[ ! -d $working_directory ]]; then
    mkdir -p $working_directory
fi


# 出力先ディレクトリ
export_directory=$(pwd)/repo/x86_64


## ビルド
if [[ ! $1 = "update_db" ]]; then
    for (( i=0; i<number_of_pkg_aur ; i++ )); do
        # Clone
        git clone https://aur.archlinux.org/${add_pkg_aur[$i]}.git $working_directory/${add_pkg_aur[$i]}
        # ビルド
        cd $working_directory/${add_pkg_aur[$i]}
        makepkg -s
        # 移動
        if [[ -w $export_directory ]]; then
            mv *.pkg.tar.xz $export_directory
        else
            echo "[$(basename ${BASH_SOURCE[0]})] 出力先に書き込み権限がありません。"
        fi
        cd - >> /dev/null
        # 削除
        rm -rf $working_directory/${add_pkg_aur[$i]}
    done
fi


## データーベース作成と作業ディレクトリ削除
cd $(pwd)/repo/x86_64
if [[ -f $(pwd)/repo/x86_64/${repo_name}.db.tar.gz ]]; then
    rm ${repo_name}.db
    rm ${repo_name}.db.tar.gz
    rm ${repo_name}.files
    rm ${repo_name}.files.tar.gz
fi
repo-add ${repo_name}.db.tar.gz *.pkg.tar.xz
rm -r $working_directory
cd - > /dev/null
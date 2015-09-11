title: AnsibleとPackerでDockerの自動セットアップと我が家の活用例
author:
  name: m-nagai
  url: http://quartet-communications.com
style: style.css
output: 20150911-docker.html
controls: true

--

# たつきち(さん)に<br />Dockerを教える会
<br />
## 20150911 @kuartet-communications

--

# AnsibleとPackerで<br />Dockerをセットアップする<br />＆<br />我が家の活用例

--

### 本日のメニュー

* Docker
* Packer
* Ansible
* 我が家の活用例

--

# Docker

--

### Docker

# "Dockerコンテナは<br />バイナリである"

--

# 以上
## 細かい説明は他の人にお任せます

--

# Packer

--

### Packer

- 仮想マシンのイメージを色々作ってくれるツール
- 設定ファイルはJSON形式
    - Builder
    - Provisoner
    - Post Processor

--

### Packer:Builder

- イメージ自体を作成する
- 対応している主なイメージ
    - Amazon EC2 (AMI)
    - DigialOcean
    - Docker
    - Google Compute Engine
    - QEMU
    - VirtualBox
    - VMWare

※他にもいくつかあります

--

### Packer:Provisoner

- イメージの中身をセットアップする
- いろんなツールが使える
    - Shell
    - Ansible
    - Chef
    - Puppet
    - Salt

※他にもいくつかあります

--

### Provisoning Tool

- 過去の遺産を流用できるか
- 冪等性が必要かどうか
  - Immutable Infrastructure
- サーバ構築の際のポリシー
  - Python or Ruby or PHP or Shell?

--

### Ansible Provisioner

- ansible-local
  - イメージ内にAnsibleをインストール
  - イメージ内にPlayBooksをコピー
  - Ansibleの実行！
- ansible-localを実行させる前にAnsibleが動くようにセットアップしてあげないといけない
- 余分なものがインストールされないAnsibleの良さが無くなっているが、今後に期待

--

# Ansible

--

### Installing Docker

- 色々パッケージをインストール
    - Docker
    - Docker-Compose
    - Packer
    - Supervisor
- Packerを使ってDockerイメージを作成＆インポート
    - ここでAnsible(ansible-local)を使っている
- Supervisor越しにDocker-Composeを使ってDockerを立ち上げ

これでサーバ起動時に自動でDockerが立ち上がります

--

### Relationship

- Supervisor
    - Docker-Compose
      - Docker(1)
      - Docker(2)
      - Docker(3)

Supervisorを利用する事例が多い

--

# 我が家の活用例

--

### VPS上で利用

- さくらのVPS上に構築
- 勉強目的
- Dockerイメージはどこにもホスティングしていない（経済的な理由）
  - Docker Hub
  - Tutum
- Dockerで動かしているのは以下のサーバ
  - Nginx 
  - OpenVPN
  - Gate (Google認証なhttpdでリバースプロキシ)
- ストレージ用のコンテナは用意していない
- ログ等も外出ししていない

--

### 構成図

![network](https://cloud.githubusercontent.com/assets/13129570/9778609/b033891a-57ad-11e5-8253-ac5b66858f04.png)

--

### 目的

- 勉強目的
- インストールの簡易化
  - 自動化
  - 時間短縮
  - Dockerイメージの転用
- ホストOSがクリーン

Dockerイメージをホスティングしてないので  
勉強目的がメインになっている

--

# 終わり

title: Nagai Go #02
author:
  name: qcmnagai
  url: http://quartet-communications.com
style: style.css
output: index.html
controls: true

--

# Nagai Go #02
<br />
## 20160226 @社内勉強会

--

# <span style="color: #008080;">Goroutin</span>と<span style="color: #008080;">channel</span>を使った並列処理

<div style="text-align: center; margin-top: 50px;">
![gopher_head](https://cloud.githubusercontent.com/assets/13129570/12286122/b02913d6-ba04-11e5-8e2a-941e5fa38832.png)
</div>

--

# Goroutineって何？

--

### Goroutineとは

* Goが管理している軽量スレッド（らしい）
* スレッドに近いがスレッドではない（らしい）
* main()もGoroutineで呼ばれている（らしい）
* マルチコアCPUに対応！ (`GOMAXPROCS`)

--

# 構文が簡単

--

### Goroutineの書き方

```
go function()
```

--

### Goroutineの書き方

```
go function()
```

# なんかカッコイイ！
--

# Goroutine非同期で処理されるけど、処理結果はどうやって受け取るのですか？

--

# channelを使おう！

--

### channel

* Goroutine間のやりとりをするもの
* やりとりする内容の型を決められる
* やりとりするキューの数を決められる

--

### channelの書き方

```
# 定義
ch := make(chan int, 5)

# 値を送信
ch <- 1

# 値を受信
hoge := <- ch
```

--

# サンプル1<br />クラスの人数点呼

--

### サンプル1仕様

1. 複数クラスの人数を点呼する
1. 点呼には1人1秒かかる

--

### サンプル1の見所

1. Goroutineとchannel
1. 並列処理による時間の短縮

--

# サンプル1実演

<center>-> [source code](https://github.com/qcmnagai/go-samples/blob/master/roll-call/roll-call.go)</center>

--

# サンプル2<br />ダチョウ倶楽部のあのネタ

--

### サンプル2仕様

1. 上島以外が「やります」という
1. 上島が「やります」という
1. 上島以外が「どうぞどうぞ」という

--

### サンプル2の見所

1. syncパッケージによる簡単な制御
1. 絶妙な間の取り方

--

# サンプル2実演

<center>-> [source code](https://github.com/qcmnagai/go-samples/blob/master/ostrich/ostrich.go)</center>


--


--

### まとめ

* 並列処理が比較的簡単な構文でかける！
* マルチコア対応でCPUの性能を使い切れる！
* 画像や動画の編集処理や時間が掛かる処理に最適！
* Lisketならreportbaseのマイニング処理早く出来そう！

--

# 終わり

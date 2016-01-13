title: Nagai Go #01
author:
  name: qcmnagai
  url: http://quartet-communications.com
style: style.css
output: 20160115-nagai-go-01.html
controls: true

--

# Nagai Go #01
<br />
## 20160115 @社内勉強会

--

# <span style="color: #008080;">Nagai</span>が<span style="color: #008080;">Go</span>を使った感想

--

# Golangって何？

--

# Hello World

--

### Hello World

```
package main

import "fmt"

func main() {
    fmt.Print("Hello, world\n")
}
```

--

### Golang

* 2009年生まれ
* 生みの親はGoogle
* 2016年1月時点で最新バージョンは1.5
* 近年いろんなところで使われ始めている
* マスコットはGopher(ゴーファー)
<div style="text-align: center; margin-top: 50px;">
![gopher_head](https://cloud.githubusercontent.com/assets/13129570/12286122/b02913d6-ba04-11e5-8e2a-941e5fa38832.png)
</div>

--

# コンパイルする言語

--

### コンパイルする言語

* 安心感
* 早い
* ビルドって言いたい
* 実行ファイル１つで完結

--

# クロスコンパイル

--

### クロスコンパイル

* 簡単に様々な環境で動く実行ファイルが作成可能
  * Windows
  * Mac
  * Linux
* CIツールと連動して、Githubのリリース用ファイルを自動生成とかカッコイイ(gox + ghr)

--

# 静的型付言語

--

### 静的型付言語

* 型を意識しないと動かない
    * 実際やってみると面倒
* Struct（構造体）
* なんかカッコイイ

--

### 例：構造体

```
type User struct {
  name string
  age int
}
```

--

### 例：関数

```
func sum(a int, b int) (int) {
    c := a + b

    return c
}
```

---

# 並列処理がサポートされている

--

### 並列処理がサポートされている


* Goroutine - 並列実行
* channel - 並列処理間のやりとり

楽しい

--

# 用途を限定するような設計

--

### 用途を限定するような設計

* 例外がない
* クラスがない

制約を付与する機能が少ない

--

# 学習方法

--

### 学習方法

* A Tour of Go
* The Go Playground

ブラウザ上で試せる

--

### まとめ

* コンパイル言語
* クロスコンパイル
* 静的型付言語
* 並列処理がサポートされている
* 用途を限定するような設計
* 学習方法
* 使いどころ
    * ミドルウェア(APIサーバ)
    * CLIツール
    * qcmnagai / git-pr

--

# 次回予告

--

# Nagai Go #2

## Goroutinとchannelを使った並列処理

--

# 終わり

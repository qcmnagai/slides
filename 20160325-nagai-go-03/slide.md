title: "Nagai Go #03"
author:
  name: qcmnagai
  url: http://quartet-communications.com
style: style.css
output: index.html
controls: true

--

# Nagai Go #03
<br />
## 20160325 @社内勉強会

--

# <span style="color: #008080;">Golang</span>と<span style="color: #003366;">データベース</span>

<div style="text-align: center; margin-top: 50px;">
![gopher_head](https://cloud.githubusercontent.com/assets/13129570/12286122/b02913d6-ba04-11e5-8e2a-941e5fa38832.png)
</div>

--

# RDB

--

### 主なDrivers

* MySQL
* Oracle
* PostgreSQL
* SQLite
* MS SQL Server

基本的なデータベースドライバは有志によって用意されている

--

# database/sql Package

--

### database/sql Package

* 公式で用意されているライブラリ
* 基本的には接続してSQLを発行するのみ
* プリペアドステートメントはある
* 構造体とのマッピングは手動でOK

--

### database/sql Package

```go
// get results as *sql.Rows
rows := db.Query("SELECT code, name FROM company")
for rows.Next() {
    var name string
    var code string
    err := rows.Scan(&code, &name)
    if err != nil {
        log.Fatal(err)
    }
    fmt.Println(code, name)
}
```

--

# サードパーティ製

--

### サードパーティ製

* sqirrel (SQLビルダー)
* gorp (SQLビルダー+Structマッパー)
* gorm (ORM)

--

### sqirrel

```go
import sq "github.com/Masterminds/squirrel"

users := sq.Select("*").From("users")
active := users.Where(sq.Eq{"deleted_at": nil})
sql, args, err := active.ToSql()

sql == "SELECT * FROM users WHERE deleted_at IS NULL"
```

--

### gorp

```go
import "github.com/go-gorp/gorp"

type Hoge struct {
    Id   int    `db:"id"`
    Hoge string `db:"string"`
}

m := new(Hoge)
_, err := dbmap.Get(m, 1)
if err != nil {
    return err
}

// m == &Hoge{Id: 1, Hoge: "hogehoge"}
```

--

### gorm

```go
import (
    "github.com/jinzhu/gorm"
)

type Product struct {
  gorm.Model
  Code string
  Price uint
}

// Read
var product Product
db.First(&product, "code = ?", "L1212")
```

--

### gorm (2)

```go
// User has many emails, UserID is the foreign key
type User struct {
    gorm.Model
    ID       int64
    Emails   []Email
}

type Email struct {
    gorm.Model
    Email   string
    UserID  uint
}

var emails []Email
db.Model(&user).Related(&emails)
```

--

# 組み込みKVS

--

### 組み込みKVS

- boltdb
- goleveldb

importするだけで使える（他のミドルウェアに依存しない）

--

### boltdb

- KVS
- LMDBにインスパイアされた（よくわからない）
- readは並列実行可能＆writeは直列化される（goroutineで使っても安心）
- bucket（テーブル）みたいなものがある
- prefix scanが出来る
- 実行速度はそれほど速くない

--

### goleveldb

- KVS
- leveldb(from Google)をgolangへportしたもの
- ソートが得意（昇順降順切り替え可能）
- とにかく速いらしい
- アーキテクチャが面白い

--

### leveldbアーキテクチャ

![leveldb](https://cloud.githubusercontent.com/assets/13129570/14013819/0375971a-f1f2-11e5-9885-0d6415585461.jpg)

--

### ブルームフィルタ

![bloom-filter](https://cloud.githubusercontent.com/assets/13129570/14014040/54be38ec-f1f3-11e5-8246-bf9953c7d792.png)

--

### まとめ

- データベース周りは結構貧弱
- テーブル定義がコロコロ変わるようなところだと、辛いかも
- 組み込みKVSなどは結構豊富
- ポータビリティが高い
- 独自のストレージソフトを作成するのに向いているかも

--

## 参考資料

- [LevelDB入門 (基本編)](http://yosuke-furukawa.hatenablog.com/entry/2014/05/05/095207)
- [ブルームフィルタ](https://ja.wikipedia.org/wiki/%E3%83%96%E3%83%AB%E3%83%BC%E3%83%A0%E3%83%95%E3%82%A3%E3%83%AB%E3%82%BF)

--

# 終わり

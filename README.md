# FreedomFrontline

## 製品概要

### 混雑 × Tech

混雑からの解放 "FreedomFrontline"

### 背景(製品開発のきっかけ、課題等）

昼休み前には満員になってしまう学食。
そんなのしんどすぎると言うことで混雑の状況が分かれば行くかいかないか決められたら
嬉しいと考えたことがきっかけです。


### 製品説明（具体的な製品の説明）

senderとreceiverがあり、
receiver側がsender側からのBluetooth接続を確認して、
そこに今どれくらいの人がいるのかをwebsocketを通じてサーバーにアップロードする。
sender側はreceiver側が送ったデータを取ってきて、その数に応じてsender側の画面の表示を変えます。

### 特長

#### 1. リモートで混雑状況がわかる

その場に行かなくても、どれくらいのひとがいるのかわかる。

#### 2. 導入をもっと簡単に

wifiを導入しようとすると手間とコストがかかってしまいます。
しかしibeaconで検知することで
どこでも手軽に導入することができます。

#### 3. スライド操作できる人を制限できる

本システムでは同時にスライド操作できる人を制限しています。
これは仮に参加者全員のスマートフォンからスライド切り替え可能だと、押し間違いによる予期せぬスライド操作が懸念されるためです。
現在のスピーカーが次のスピーカーに**ポインタ渡し**することで、ユーザが安心してプレゼンテーションを行えるよう設計しました。

### 解決出来ること

遠くにいても特定の場所の混雑状況がわかる。
wifiを導入することよりもコストの削減ができる。

### 今後の展望

* バックグラウンド実行
    * アプリを使用していないといけないと言うことがネックなので、バックグラウンドで行うことができれば解決できると考えられます。
* 学食以外での実装
    * 学食以外でもオフィス内やトイレなどに導入できればさらにいいものとして使うことができると考えられる、

### 注力したこと（こだわり等）

* websocketを導入したことでリアルタイムで混雑度がわかるようにしたこと

## 開発技術

### 活用した技術

#### フレームワーク・ライブラリ・モジュール

* sender画面
    * Flutter
    * Dart
* receiver画面
    * iBeacon
    * Flutter
    * Dart

#### 備考

こちらのリポジトリはsenderのリポジトリであり、receiver側やserver側のリポジトリを分けて作成したので
そちらもご確認よろしくお願いいたします。

receiver : (https://github.com/mommom111/D_2207)
server : (https://github.com/mommom111/ServerHACKS)

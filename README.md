# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# アプリケーションの概要

・ワインの投稿アプリ

# アプリケーションの機能一覧

・ユーザー新規登録機能
・ユーザーログイン/ログアウト機能
・マイページ表示機能
・ワイン投稿/編集機能
・いいね機能
・ワインのカテゴリー登録機能
・カテゴリー検索機能

# アプリケーション内で使用している技術一覧

|種別|名称|
|---|----|
|開発言語|Ruby(ver 2.5.1)|
|フレームワーク|Ruby on Rails(ver 5.2.3)|
|マークアップ|HTML(Haml),CSS(Sass)|
|フロントエンド|JavaScript(jQuery)|
|DB|MySQL|
|本番環境|AWS ES2|
|Webサーバー|Nginx|
|applicationサーバー|Unicorn|
|画像アップロード|carrierwave, AWS S3|
|自動デプロイ|capistrano|
|ユーザー管理|devise|

# データベース

## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|phone_number|string|null: false|

### Association
- has_many :wines
- has_many :favorites
- has_many :features, through: :users_features_tags
- has_many :users_features_tags
- has_one :profile

## Profilesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_katakana|string|null: false|
|last_name_katakana|string|null: false|
|birthday|string|null: false|

### Association
- belong_to :user

## Winesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
|comment|text||
|shop_name|text||

### Association
- has_many :wines_images
- has_many :users, through: :favorites
- has_many :features, through: :wines_features_tags
- has_many :wines_features_tags

## Wines_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|wine_id|reference|foreign_key: true|
|image|string|null: false|

### Association
- belong_to :wine

## Favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
|wine_id|reference|foreign_key: true|

### Association
- belong_to :user
- belong_to :wine

## Featuresテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
|name|string|null: false|

### Association
- has_many :users, through: :users_features_tags
- has_many :wines, through: :wines_features_tags
- has_many :users_features_tags
- has_many :wines_features_tags


## Users_features_tagsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
|features_id|reference|foreign_key: true|

### Association
- belong_to :user

## Wines_features_tagsテーブル

|Column|Type|Options|
|------|----|-------|
|wine_id|reference|foreign_key: true|
|features_id|reference|foreign_key: true|

### Association
- belong_to :wine
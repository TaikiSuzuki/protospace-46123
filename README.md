# README

# テーブル設計
| テーブル名   | 概要                                    |
| :----------- | :--------------------------------------|
| `users`      | ユーザー情報を管理する                  |
| `prototypes` | プロフィールを管理する |
| `comments`   | コメント情報を管理する                  |


## usersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false                    |
| name                | string     | null: false                    |
| profile             | text       | null: false                    |
| occupation          | text       | null: false                    |
| position            | text       | null: false                    |

### Association

- has_many :prototypes
- has_many :comments

## prototypesテーブル

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| catch_copy          | text       | null: false                    |
| concept             | text       | null: false                    |
| user                | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- has_many :comments


## commentsテーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| content    | text       | null: false                    |
| prototype  | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |


### Association
- belongs_to :users
- belongs_to :prototypes

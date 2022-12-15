# データベース設計

## usersテーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| body_height        | float  |                           |
| body_weight        | float  |                           |
| self_introduction  | text   |                           |

### Association

- has_many :posings
- has_many :comments
- has_many :likes

## posingsテーブル

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| group_id    | integer    | null: false                    |
| category_id | integer    | null: false                    |
| type_id     | integer    | null: false                    |
| body_weight | float      |                                |
| remarks     | text       |                                |
| user        | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user

##　 commentsテーブル 

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| posing  | references | null: false, foreign_key: true |

### Association

- has_many :likes
- belongs_to :user
- belongs_to :posing

## likesテーブル

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| posing | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :comment
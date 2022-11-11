## users table


| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| name               | string              | null; false               |
| katakana_name      | string              | null: false               |
| birthday           | date                | null: false               |

### Association

* has_many :items
* has_many :purchases


## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| title                               | string     | null: false                    |
| explanation                         | text       | null: false                    |
| price                               | integer    | null: false                    |
| category_id                         | integer    | null: false                    |
| situation_id                        | integer    | null: false                    |
| cost_id                             | integer    | null: false                    |
| days_to_ship_id                     | integer    | null: false                    |
| prefecture_id                       | integer    | null: false                    |
| user                                | references | null: false, foreign_key: true |  

### Association

- belongs_to :user
- has_one :purchase

## purchase table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one : home_address


## home address


| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| post_code        | string     | null: false                    |
| prefectures_id   | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| purchase         | reference  | null: false, foreign_key: true |



### Association

- belongs_to :purchase
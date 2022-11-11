## users table


| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| name               | string              | null; false               |
| birthday           | integer            | null: false               |

### Association

* has_many :items
* has_many :purchase


## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| title                               | string     | null: false                    |
| explanation                         | text       | null: false                    |
| price                               | integer    | null: false                    |
| category                            | integer    | null: false,                   |
| situation                           | integer    | null: false                    |
| cost                                | integer    | null: false                    |
| date                                | integer    | null: false                    |
| sender                              | integer    | null: false                    |
| user                                | reference  | null: false, foreign_key: true |  

### Association

- belongs_to :user
- has_one :purchase

## purchase 

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one : home address


## home address


| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| post_code        | string     | null: false                    |
| prefectures      | string     | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | integer    | null: false                    |


### Association

- belongs_to :purchase
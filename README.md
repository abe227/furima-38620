## users table


| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| name               | string              | null: false               |

### Association

* has_many :items
* has_one :purchase


## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| title                               | string     | null: false                    |
| explanation                         | text       | null: false                    |
| price                               | string     | null: false                    |
| category                            |            | null: false,                   |
| situation                           |            | null: false                    |
| cost                                |            | null: false                    |
| date                                |            | null: false                    |
| user                                | reference  | null: false, foreign_key: true |  

### Association

- belongs_to :user
- has_one :purchase

## purchase 

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| items       | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user


## home address


| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| post code        | string     | null: false                    |
| prefectures      |            | null: false                    |
| municiparities   |            | null: false                    |
| address          |            | null: false                    |
| phone number     | string     | null: false                    |


### Association

- belongs_to :purchase
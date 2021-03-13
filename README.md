# README
## usersテーブル
| Column             | Type    | Option      |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_kana    | string  | null: false |
| last_name_kana     | string  | null: false |
| birthday           | date    | null: false |

### Association
- has_many : items
- has_many : buyers

## itemsテーブル
| Column               | Type       | Option            |
| -------------------- | ---------- | ----------------- |
| product_name         | string     | null: false       |
| explanatory_text     | text       | null: false       |
| category_id          | integer    | null: false       |
| product_condition_id | integer    | null: false       |
| delivery_fee_id      | integer    | null: false       |
| shipment_id          | integer    | null: false       |
| date_pf_shipment_id  | integer    | null: false       |
| price                | integer    | null: false       |
| user                 | references | foreign_key: true |

### Association
- belongs_to : user
- has_one  : buyers

### buyersテーブル
| Column    | Type       | Option            |
| --------- | ---------- | ----------------- |
| user      | references | foreign_key: true |
| item      | references | foreign_key: true |

### Association
- belongs_to : user
- belongs_to : item
- has_one : address

### addressテーブル
| Column         | Type       | Option            |
| -------------- | ---------- | ----------------- |
| postal_code    | string     | null: false       |
| prefectures_id | string     | null: false       |
| municipalities | string     | null: false       |
| address        | string     | null: false       |
| building       | string     |                   |
| phone_number   | integer    | null: false       |
| buyer          | string     | foreign_key: true |

### Association
- belongs_to : buyer
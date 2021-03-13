# README
## usersテーブル
| Column             | Type    | Option                         |
| ------------------ | ------- | ------------------------------ |
| nickname           | string  | null: false                    |
| email              | string  | null: false, foreign_key: true |
| encrypted_password | string  | null: false                    |
| first_name         | string  | null: false                    |
| last_name          | string  | null: false                    |
| first_name_kana    | string  | null: false                    |
| last_name_kana     | string  | null: false                    |
| birth_year_id      | integer | null: false                    |
| birth_month_id     | integer | null: false                    |
| birth_day_id       | integer | null: false                    |

### Association
- has_many : items
- has_many : comments through : items
- has_one  : buyers
- has_one  : address

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
- belongs_to : users
- has_many : comments through : users
- has_one  : buyers

## commentsテーブル
| Column    | Type       | Option            |
| --------- | ---------- | ----------------- |
| text      | text       | null: false       |
| user      | references | foreign_key: true |
| item      | references | foreign_key: true |

### Association
- belongs_to : users
- belongs_to : prototypes

### buyersテーブル
| Column    | Type       | Option            |
| --------- | ---------- | ----------------- |
| user      | references | foreign_key: true |
| item      | references | foreign_key: true |

### Association
- belongs_to : users
- belongs_to : items
- has_one : address

### addressテーブル
| Column    | Type       | Option            |
| --------- | ---------- | ----------------- |
| address   | text       | null: false       |
| user      | references | foreign_key: true |
| buyer     | references | foreign_key: true |

### Association
- belongs_to : users
- belongs_to : buyers
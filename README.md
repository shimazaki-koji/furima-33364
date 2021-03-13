# README
## usersテーブル
| Column     | Type   | Option      |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |

### Association
- has_many : items
- has_many : comments through : items
- has_one  : buyers
- has_one  : address

## itemsテーブル
| Column       | Type       | Option      |
| ------------ | ---------- | ----------- |
| product_name | string     | null: false |
| category     | text       | null: false |
| price        | text       | null: false |
| text         | text       | null: false |
| image        |            |             |
| user         | references |             |

### Association
- belongs_to : users
- has_many : comments through : users
- has_one  : buyers

## commentsテーブル
| Column    | Type       | Option      |
| --------- | ---------- | ----------- |
| text      | text       | null: false |
| user      | references |             |
| item      | references |             |

### Association
- belongs_to : users
- belongs_to : prototypes

### buyersテーブル
| Column    | Type       | Option      |
| --------- | ---------- | ----------- |
| user      | references |             |
| item      | references |             |

### Association
- belongs_to : users
- belongs_to : items
- has_one : address

### addressテーブル
| Column    | Type       | Option      |
| --------- | ---------- | ----------- |
| address   | text       | null: false |
| user      | references |             |
| buyer     | references |             |

### Association
- belongs_to : users
- belongs_to : buyers
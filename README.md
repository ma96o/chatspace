# ChatSpace

Ruby 2.2.3

Rails 5.0.1

---

## ASSOCIATION

# User  
  has_many :messages, ->{ order("created_at DESC") }
  has_many :groups, through: :users_groups


# Groups  
  has_many :messages, ->{ order("created_at DESC") }, dependent: :delete_all
  has_many :users, through: :users_groups


# Messages
  belongs_to :messagable, polymorphic: true

## DATABASE

### Users
| column   | type    | NULL | default value | information   |
|:---------|:--------|:-----|:--------------|:--------------|
| id       | integer | NO   |               | 主キー        |
| avatar   | string  |      |               | PF画像        |

### Massages
| column          | type    | NULL | default value | information                       |
|:----------------|:--------|:-----|:--------------|:----------------------------------|
| id              | integer | NO   |               | 主キー                             |
| user_id         | integer | NO   |               | 投稿したユーザのID (外部キー)         |
| messagable_type | string  | NO   |               | Group or User (index)              |
| messagable_id   | integer | NO   |               | 送り先のuser_id or group_id (index) |
| text            | text    |      |               | 内容                               |
| image           | text    |      |               | 画像                               |

### UsersGroups
| column   | type    | NULL | default value | information        |
|:---------|:--------|:-----|:--------------|:-------------------|
| id       | integer | NO   |               | 主キー              |
| user_id  | integer | NO   |               | 外部キー            |
| group_id | integer | NO   |               | 外部キー            |
| status   | integer | NO   | 0             | 0->招待中, 1->参加済 |

### Groups
| column | type    | NULL | default value | information |
|:-------|:--------|:-----|:--------------|:------------|
| id     | integer | NO   |               | 主キー       |
| name   | string  | NO   |               | グループ名    |

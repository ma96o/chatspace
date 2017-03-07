# ChatSpace

Ruby 2.3.1

Rails 5.0.1

---

## ASSOCIATION

### User  
```
  has_many :messages, as: :messageable, ->{ order("created_at DESC") }  
  has_many :groups, through: :users_groups
```

### Group  
```
  has_many :messages, as:messageable, dependent: :delete_all  
  has_many :users, through: :users_groups
```

### Message  
```
  belongs_to :messagable, polymorphic: true
```

### UsersGroup  
```
  belongs_to :user  
  belongs_to :group
```
---

## DATABASE

### Users
(created by devise & CarrierWave)

| column   | type    | NULL | default value | information   |
|:---------|:--------|:-----|:--------------|:--------------|
| id       | integer | FALSE|               | 主キー         |
| name     | string  | FALSE|               | ユーザ名       |

### Massages
| column          | type    | NULL | default value | information                       |
|:----------------|:--------|:-----|:--------------|:----------------------------------|
| id              | integer | FALSE|               | 主キー                             |
| user_id         | integer | FALSE|               | 投稿したユーザのID (外部キー)         |
| messagable_type | string  | FALSE|               | Group or User (index)              |
| messagable_id   | integer | FALSE|               | 送り先のuser_id or group_id (index) |
| text            | text    |      |               | 内容                               |
| image           | text    |      |               | 画像                               |

### UsersGroups
| column   | type    | NULL | default value | information        |
|:---------|:--------|:-----|:--------------|:-------------------|
| id       | integer | FALSE|               | 主キー              |
| user_id  | integer | FALSE|               | 外部キー            |
| group_id | integer | FALSE|               | 外部キー            |
| status   | integer | FALSE| 0             | 0->招待中, 1->参加済 |

### Groups
| column | type    | NULL | default value | information |
|:-------|:--------|:-----|:--------------|:------------|
| id     | integer | FALSE|               | 主キー       |
| name   | string  | FALSE|               | グループ名    |

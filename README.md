# DATABASE

---

### Users
| column   | type    | NULL | default value | information   |
|:---------|:--------|:-----|:--------------|:--------------|
| id       | integer | NO   |               | 主キー        |
| name     | string  | NO   |               | ユーザ名       |
| email    | string  | NO   |               | メールアドレス  |
| password | string  | NO   |               | パスワード     |
| avatar   | string  |      |               | PF画像        |
| created_at | datetime | NO | | 作成日時 |
| update_at | datetime | NO | | 更新日時 |

### Massages
| column          | type    | NULL | default value | information                       |
|:----------------|:--------|:-----|:--------------|:----------------------------------|
| id              | integer | NO   |               | 主キー                             |
| send_user_id    | integer | NO   |               | 投稿したユーザのID                   |
| messagable_type | string  | NO   |               | Group or User (index)              |
| messagable_id   | integer | NO   |               | 送り先のuser_id or group_id (index) |
| text            | text    |      |               | 内容                               |
| image           | text    |      |               | 画像                               |
| created_at | datetime | NO | | 作成日時 |
| update_at | datetime | NO | | 更新日時 |

### UsersGroups
| column   | type    | NULL | default value | information        |
|:---------|:--------|:-----|:--------------|:-------------------|
| id       | integer | NO   |               | 主キー              |
| user_id  | integer | NO   |               | 外部キー            |
| group_id | integer | NO   |               | 外部キー            |
| status   | integer | NO   | 0             | 0->招待中, 1->参加済 |
| created_at | datetime | NO | | 作成日時 |
| update_at | datetime | NO | | 更新日時 |

### Groups
| column | type    | NULL | default value | information |
|:-------|:--------|:-----|:--------------|:------------|
| id     | integer | NO   |               | 主キー       |
| name   | string  | NO   |               | グループ名    |
| created_at | NO | datetime | | 作成日時 |
| update_at | NO | datetime | | 更新日時 |

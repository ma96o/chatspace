# DATABASE

---

### Users
| column   | type | information     |
|:---------|:-----|:----------------|
| id       | integer | 主キー        |
| name     | string  | ユーザ名       |
| email    | string  | メールアドレス  |
| password | string  | パスワード     |


### Massages
| column          | type    | information                |
|:----------------|:--------|:---------------------------|
| id              | integer | 主キー                      |
| send_user_id    | integer | 投稿したユーザのID            |
| messagable_type | string  | Group or User              |
| messagable_id   | integer | 送り先のuser_id or group_id |
| text            | text    | 内容                        |

### UsersGroups
| column   | type    | information        |
|:---------|:--------|:-------------------|
| id       | integer | 主キー              |
| user_id  | integer | ユーザID            |
| group_id | integer | グループID          |
| status   | integer | 0->招待中, 1->参加済 |

### Groups
| column | type    | information |
|:-------|:--------|:------------|
| id     | integer | 主キー       |
| name   | string  | グループ名    |
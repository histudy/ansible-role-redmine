redmine
=========

[Redmine](http://www.redmine.org/)のインストールとセットアップを行います。

Role Variables
--------------

### redmine_version

インストールするRedmineのバージョンを指定します。

```yml
redmine_version: "3.4-stable"
```

### redmine_db_cfg

データベースの接続情報を指定します。

```yml
redmine_db_cfg:
  production:
    adapter: mysql2
    database: redmine
    host: localhost
    username: redmine_user
    password: redmine_password
    encoding: utf8
```

### redmine_cfg

Redmineのシステム設定を指定します。

```yml
redmine_cfg:
  default:
    email_delivery:
      delivery_method: :sendmail
    attachments_storage_path:
    autologin_cookie_name:
    autologin_cookie_path:
    autologin_cookie_secure:
    scm_subversion_command:
    scm_mercurial_command:
    scm_git_command:
    scm_cvs_command:
    scm_bazaar_command:
    scm_darcs_command:
    scm_subversion_path_regexp:
    scm_mercurial_path_regexp:
    scm_git_path_regexp:
    scm_cvs_path_regexp:
    scm_bazaar_path_regexp:
    scm_darcs_path_regexp:
    scm_filesystem_path_regexp:
    scm_stderr_log_file:
    database_cipher_key:
    rmagick_font_path: /usr/share/fonts/opentype/ipaexfont-gothic/ipaexg.ttf
```

### redmine_themes

インストールするテーマを指定します。

```yml
redmine_themes:
  - name: gitmike
    repo: "https://github.com/makotokw/redmine-theme-gitmike.git"
  - name: farend_fancy
    repo: "https://github.com/farend/redmine_theme_farend_fancy.git"
  - name: farend_basic
    repo: "https://github.com/farend/redmine_theme_farend_basic.git"
```

### redmine_plugins

インストールするプラグインを指定します。

```yml
redmine_plugins:
  # リポジトリから取得
  - name: view_customize
    repo: "https://github.com/onozaty/redmine-view-customize.git"
    # プラグインのディレクトリ名を指定
    directory: view_customize
  - name: issue_templates
    repo: "https://github.com/akiko-pusu/redmine_issue_templates.git"
  - name: dashboard
    repo: "https://github.com/jgraichen/redmine_dashboard.git"
    # 取得するバージョンまたはブランチを指定(省略時はmasterブランチの内容を取得)
    version: stable-v2
  # URLから取得
  - name: easy_gantt
    url: "http://www.easyredmine.com/packages/EasyGanttFree.zip"
  # ファイルをアップロード
  - name: agile
    file: path/to/redmine_agile-light.zip
  - name: checklists
    file: path/to/redmine_checklists-light.zip
```

### redmine_lang

Redmineの初期登録データの言語を指定します。

```yml
redmine_lang: ja
```

### redmine_send_reminders_cron_job

リマインダーメールの設定を指定します。

```yml
redmine_send_reminders_cron_job:
  enabled: no
  params:
    - 'days=7'
    # - 'tracker=1'
    # - 'users="1,23,45"'
  hour: 9
  minute: 0
```

### redmine_receive_imap_cron_job

メール(IMAP)によるチケット登録の設定を指定します。

```yml
redmine_receive_imap_cron_job:
  enabled: no
  params:
    - "username=imap_acount"
    - "password=imap_password"
    # - host=127.0.0.1
    # - port=143
    # - ssl=false
    # - folder=INBOX
  # hour: "*"
  # minute: "*/5"
```

### redmine_receive_pop3_cron_job

メール(POP3)によるチケット登録の設定を指定します。

```yml
redmine_receive_pop3_cron_job:
  enabled: no
  params:
    - "username=pop3_acount"
    - "password=pop3_password"
    # - host=127.0.0.1
    # - port=110
    # - ssl=false
  # hour: "*"
  # minute: "*/5"
```

### redmine_puma_cfg

Redmineのサービス設定を指定します。

```yml
redmine_puma_cfg:
  bind: "unix://{{ redmine_home }}/tmp/redmine.sock"
  # bind: "tcp://0.0.0.0:9292"
  pidfile: "{{ redmine_home }}/tmp/redmine.pid"
  state_path: "{{ redmine_home }}/tmp/redmine.state"
  stdout_redirect:
    stdout: "{{ redmine_home }}/log/stdout.log"
    stderr: "{{ redmine_home }}/log/stderr.log"
    append: no
  # quiet: no
  threads:
    min: 0
    max: 16
  workers: 2
  # prune_bundler: no
  preload_app: yes
```

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - role: redmine
```

License
-------

MIT

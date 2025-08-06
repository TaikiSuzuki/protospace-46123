#!/usr/bin/env bash
# コマンドが失敗したらすぐに終了する設定
set -e

# RubyGemsを最新版に更新
gem update --system

# Gemfileに記述されたgemをインストール
bundle install

# データベースを本番環境向けに移行
bundle exec rails db:migrate

# JavaScriptやCSSなどのアセットをプリコンパイル
bundle exec rails assets:precompile

# キャッシュをクリア
bundle exec rails tmp:clear
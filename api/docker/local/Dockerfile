## ビルドステージ
# 2024年5月時点の最新安定版Rubyの軽量版「alpine」
FROM ruby:3.3.1-alpine AS builder

# 環境変数
ARG RAILS_ENV
ARG BUNDLER_VERSION
ARG LANG
ARG TZ

# インストール可能なパッケージ一覧の更新
RUN apk update && \
    apk upgrade && \
    # パッケージのインストール（ビルド時のみ使う）
    apk add --virtual build-packs --no-cache \
            alpine-sdk \
            build-base \
            curl-dev \
            mysql-dev \
            tzdata

# 作業ディレクトリの指定
WORKDIR /app

# ローカルにあるGemfileとGemfile.lockを
# コンテナ内のディレクトリにコピー
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# bundlerのバージョンを固定する
RUN gem install bundler -v $BUNDLER_VERSION
RUN bundle -v

# bunlde installを実行する
RUN bundle install --jobs=4

# build-packsを削除
RUN apk del build-packs


## マルチステージビルド
# 2024年5月時点の最新安定版Rubyの軽量版「alpine」
FROM ruby:3.3.1-alpine

# 環境変数
ARG RAILS_ENV
ARG BUNDLER_VERSION
ARG LANG
ARG TZ

# インストール可能なパッケージ一覧の更新
RUN apk update && \
    apk upgrade && \
    # パッケージのインストール（--no-cacheでキャッシュ削除）
    apk add --no-cache \
            bash \
            mysql-dev \
            tzdata \
            gvim \
            # rails newでgitが必要
            git \
            # M系チップMacの場合に「gcompat」が必要
            gcompat

# 作業ディレクトリの指定
WORKDIR /api

# ビルドステージからファイルをコピー
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY . /api

# サーバー起動
EXPOSE 3010
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
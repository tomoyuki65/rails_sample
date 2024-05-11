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
    # パッケージのインストール
    apk add --virtual build-packs --no-cache \
            alpine-sdk \
            build-base \
            curl-dev \
            bash \
            mysql-dev \
            tzdata \
            gvim \
            git \
            # M系チップMacの場合に「gcompat」が必要
            gcompat

# 作業ディレクトリの指定
WORKDIR /api

# ファイルを全て作業ディレクトリにコピー
COPY . /api

# bunlde installを実行する
RUN gem install bundler -v $BUNDLER_VERSION
RUN bundle -v
RUN bundle install --jobs=4

# サーバー起動
EXPOSE 3010
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
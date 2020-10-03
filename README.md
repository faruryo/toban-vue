# toban-vue

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
## toban-apiのエンドポイントを指定
## devcontainerの場合はdevcontainer.jsonに記載する
VUE_APP_GRAPHQL_HTTP="http://toban-api.toban.room-402.faru.jp/graphql"

npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

## 参考

- [vue.js, Apollo, graphQLで名簿アプリを作成する（CRUD機能の実装サンプル） - Qiita](https://qiita.com/ryo2132/items/429234c9de1b546b3406)
- [Akryum/vue-apollo-todos: Vue Apollo GraphQL mutation examples](https://github.com/Akryum/vue-apollo-todos)
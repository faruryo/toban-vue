<template>
  <div class="tobans-container">
    <div>
      <table>
        <!-- テーブルヘッダー -->
        <thead>
          <tr>
            <th class="name">toban</th>
            <th class="button"></th>
            <th class="button"></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="toban in tobans" v-bind:key="toban.id">
            <td>{{ toban.name }}</td>
            <td class="state">
              <!-- 状態変更ボタンのモック -->
              <button v-if="toban.enabled">有効</button>
              <button v-else>無効</button>
            </td>
            <td>
              <button>削除</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <ApolloMutation
      :mutation="require('../graphql/CreateToban.gql')"
      :variables="{
        input: {
          name: newName,
          description: '概要',
          interval: 'DAILY',
          deadlineHour: 23,
          deadlineWeekDay: 'MONDAY',
          deadlineWeek: 0,
        },
      }"
      class="form"
      @done="newName = ''"
    >
      <template slot-scope="{ mutate }">
        <form v-on:submit.prevent="formValid && mutate()">
          <label for="field-toban">Toban</label>
          <input id="field-toban" v-model="newName" placeholder="Type a toban name" class="input" />
        </form>
      </template>
    </ApolloMutation>
  </div>
</template>

<script>
import GET_TOBANS from "../graphql/Tobans.gql";
import DELETE_TOBAN from "../graphql/DeleteToban.gql";

export default {
  data() {
    return {
      newName: ""
    };
  },

  apollo: {
    tobans: {
      query: GET_TOBANS
    }
  },

  computed: {
    formValid() {
      return this.newName;
    }
  },

  methods: {
    /** 
    /* 指定した当番を削除する
     */
    deleteToban: function(toban) {
      console.log(toban);
      this.$apollo
        .mutate({
          mutation: DELETE_TOBAN,
          variables: {
            id: toban.id
          }
        })
        .then(() => {
          this.$apollo.queries.tobans.refetch();
        });
    }
  }
};
</script>

<style lang="scss" scoped>
/* reset css */
button {
  border: none;
  background: none;
  cursor: pointer;
}

.input,
.apollo,
.toban {
  padding: 12px;
}

.form {
  padding: 12px;
  display: flex;
  border-top: solid 1px #888;
}

label {
  display: block;
  margin-bottom: 6px;
}

.tobans-container {
  width: 100%;
}

// ゴミ箱アイコン
// .button__delete {
//   background: url("../assets/icon/delete-24px.svg");
//   width: 24px;
//   height: 24px;

//   &:hover {
//     opacity: 0.5;
//   }
// }
</style>

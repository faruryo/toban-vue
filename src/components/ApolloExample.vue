<template>
  <div class="toban-example">
    <div>
      <table>
        <!-- テーブルヘッダー -->
        <thead>
          <tr>
            <th class="id">ID</th>
            <th class="name">名前</th>
            <th class="description">概要</th>
            <th class="button">有効</th>
            <th class="button">削除</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="toban in tobans" v-bind:key="toban.id">
            <th>{{ toban.id }}</th>
            <td>{{ toban.name }}</td>
            <td>{{ toban.description }}</td>
            <td class="state">
              <!-- 状態変更ボタンのモック -->
              <button v-if="toban.enabled">enabled</button>
              <button v-else>disabled</button>
            </td>
            <td>
              <button class="button__delete" v-on:click="deleteToban(toban)" />
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
import TOBANS from "../graphql/Tobans.gql";
import DELETE_TOBAN from "../graphql/DeleteToban.gql";

export default {
  data() {
    return {
      name: "Anne",
      newName: ""
    };
  },

  apollo: {
    tobans: {
      query: TOBANS
    }
  },

  computed: {
    formValid() {
      return this.newName;
    }
  },

  methods: {
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

.form,
.input,
.apollo,
.toban {
  padding: 12px;
}

label {
  display: block;
  margin-bottom: 6px;
}

.error {
  color: red;
}

.button__delete {
  background: url("../assets/icon/delete-24px.svg");
  width: 24px;
  height: 24px;

  &:hover {
    opacity: 0.5;
  }
}
</style>

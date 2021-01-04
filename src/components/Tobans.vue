<template>
  <div class="tobans-container">
    <ul class="toban-list">
      <li v-for="toban in tobans" v-bind:key="toban.id" class="toban-list__item">
        <div>{{ toban.name }}</div>
        <div class="toban-list__item__action">
            <button v-if="toban.enabled">有効</button>
            <button v-else>無効</button>
            <button>編集</button>
        </div>
      </li>
    </ul>

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
/* ここから reset css */
button {
  border: none;
  background: none;
  cursor: pointer;
}
ul {
  margin: 0;
  padding: 0;
}
/* ここまで reset css */

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
  padding: 16px 24px;
  box-sizing: border-box;
}

.toban-list {
  &__item {
    display: flex;  
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    margin: 8px 0;

    &__action {
      width: 100px;
      display: flex;
      flex-direction: row;
      justify-content: space-between;
    }
  }
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

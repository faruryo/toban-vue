<template>
  <div id="app">
    <h1>402 Toban</h1>
    <div class="main-tab">
      <div class="main-tab__item">Weekly</div>
      <div class="main-tab__item">Setting</div>
    </div>
    <ApolloExample msg="Welcome to Toban"/>
  </div>
</template>

<script>
import ApolloExample from './components/ApolloExample.vue'

export default {
  name: 'App',
  components: {
    ApolloExample
  }
}
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

.main-tab {
  display: flex;
  flex-direction: row;

  &__item {
    border: solid 1px #bbb;
    padding: 8px;
  }
}
</style>

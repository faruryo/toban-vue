<template>
  <div id="app">
    <h1>402 Toban</h1>
    <div class="main-tab">
      <div class="main-tab__item" @click="tabClick($event, 'weekly')">Weekly</div>
      <div class="main-tab__item on" @click="tabClick($event, 'setting')">Setting</div>
    </div>
    <Weekly v-show="tab === 'weekly'" />
    <Setting v-show="tab === 'setting'" />
  </div>
</template>

<script>
import Setting from "./components/Setting.vue";
import Weekly from "./components/Weekly.vue";

export default {
  name: "App",
  components: {
    Setting,
    Weekly
  },
  data() {
    return {
      tab: "setting"
    };
  },
  methods: {
    tabClick($event, tabName) {
      this.tab = tabName;

      const tabs = document.getElementsByClassName("main-tab__item");
      for (let i = 0; i < tabs.length; i++) {
        tabs[i].classList.remove("on");
      }

      $event.target.classList.add("on");
      console.log($event);
    }
  }
};
</script>

<style lang="scss" scoped>
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
  cursor: pointer;
  border-bottom: solid 1px #888;

  &__item {
    border: solid 1px #bbb;
        border-top-left-radius: 8px;
    border-top-right-radius: 8px;
    padding: 8px;
    background-color: #fff;
    color: #666;
  }
}

.on {
  background-color: #888;
  color: #fff;
}
</style>

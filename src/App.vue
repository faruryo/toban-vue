<template>
  <div id="app">
    <h1>402 Toban</h1>
    <div class="main-container">
      <div class="main-tab">
        <div class="main-tab__item" @click="selectTab($event, WARIATE)">わりあて</div>
        <div class="main-tab__item on" @click="selectTab($event, TOBANS)">当番一覧</div>
        <div class="main-tab__item" @click="selectTab($event, MEMBER)">メンバー</div>
      </div>
      <Wariate v-show="tab === WARIATE" />
      <Tobans v-show="tab === TOBANS" />
    </div>
  </div>
</template>

<script>
import Tobans from "./components/Tobans.vue";
import Wariate from "./components/Wariate.vue";

export default {
  name: "App",
  components: {
    Tobans,
    Wariate
  },
  data() {
    return {
      // 定数
      WARIATE: "wariate",
      TOBANS: "tobans",
      MEMBER: "member",

      // 現在選択中のタブ
      tab: null,
    };
  },
  methods: {
    selectTab($event, tabName) {
      // コンテンツ内容を切り替える
      this.tab = tabName;

      // タブの見た目を切り替える
      const tabs = document.getElementsByClassName("main-tab__item");
      for (let i = 0; i < tabs.length; i++) {
        tabs[i].classList.remove("on");
      }
      $event.target.classList.add("on");
      // console.log($event);
    }
  },
  mounted() {
    // デフォルト表示のタブ設定
    this.tab = this.TOBANS;
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

  // 画面全体の配置調整
  display: flex;
  flex-direction: column;
  align-items: center;
}

.main-container {
  width: 800px;
}

.main-tab {
  display: flex;
  flex-direction: row;
  cursor: pointer;
  border-bottom: solid 1px #888;
  width: 100%;

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

<template>
  <div id="app">
    <Title>402 Toban</Title>
    <div class="main-container">
      <Tab :selectTab="selectTab" />
      <Wariate v-show="tabState === WARIATE" />
      <Tobans v-show="tabState === TOBANS" />
    </div>
  </div>
</template>

<script>
import Title from "./components/topView/Title.vue";
import Tab from "./components/topView/Tab.vue";
import Tobans from "./components/Tobans.vue";
import Wariate from "./components/Wariate.vue";

export default {
  name: "App",
  components: {
    Title,
    Tab,
    Tobans,
    Wariate,
  },
  data() {
    return {
      // 定数
      WARIATE: "WARIATE",
      TOBANS: "TOBANS",
      MEMBER: "MEMBER",

      // 現在選択中のタブ
      tabState: null,
    };
  },
  methods: {
    selectTab($event, tabName) {
      // コンテンツ内容を切り替える
      this.tabState = tabName;

      // タブの見た目を切り替える
      const tabs = document.getElementsByClassName("main-tab__item");
      for (let i = 0; i < tabs.length; i++) {
        tabs[i].classList.remove("on");
      }
      $event.target.classList.add("on");
    }
  },
  mounted() {
    // デフォルト表示のタブ設定
    this.tabState = this.TOBANS;
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
</style>

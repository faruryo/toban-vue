<template>
  <div class="main-tab">
    <div class="main-tab__item" @click="selectTab($event, 'WARIATE')">わりあて</div>
    <div class="main-tab__item on" @click="selectTab($event, 'TOBANS')">当番一覧</div>
    <div class="main-tab__item" @click="selectTab($event, 'MEMBER')">メンバー</div>
  </div>
</template>

<script>
export default {
  data() {
    return {
    };
  },

  props: {
    selectTab: Function,
  },
  
  computed: {
  },

  methods: {
  }
};
</script>

<style lang="scss" scoped>
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

<template>
  <div class="sandbox-container">
    <div class="schedule-spot">
      <draggable tag="ul" :options="{animation:400, delay:100}" @sort="onSort">
        <li v-for="spot in scheduleSpots" :key="spot.no">{{spot.name}}</li>
      </draggable>
    </div>
    <ul class="schedule-move">
      <li v-for="move in scheduleMoves" :key="move.no">{{move.name}}</li>
    </ul>
    <button @click="isEdit=false" style="z-index:2;">リセット</button>
  </div>
</template>

<script>
import draggable from 'vuedraggable';

export default {
  components: {
    'draggable': draggable,
  },
  data() {
    return {
      schedule:[
        {no:1, type:'spot', name:'表参道駅',},
        {no:2, type:'move', name:'移動 20分'},
        {no:3, type:'spot', name:'原宿駅'},
        {no:4, type:'move', name:'移動 5分'},
        {no:5, type:'spot', name:'ラフォーレ'},
        {no:6, type:'move', name:'移動 30分'},
        {no:7, type:'spot', name:'神宮球場'},
        {no:8, type:'move', name:'移動 10分'},
        {no:9, type:'spot', name:'明治神宮'},
      ],
      isEdit: false,
    };
  },
  computed: {
    scheduleSpots: function () {
      return this.schedule.filter(function (schedule) {
        return schedule.type === 'spot';
      })
    },
    scheduleMoves: function () {
      return this.schedule.filter(function (schedule) {
        return schedule.type === 'move';
      })
    }
  },
  methods: {
    onSort() {
      this.isEdit = true;
    }
  },
  watch: {
    isEdit: function(value) {
      const moveArea = document.getElementsByClassName("schedule-move");
      if(value){
        moveArea[0].style.visibility ="hidden";
      } else {
        moveArea[0].style.visibility ="visible";
      }
    }
  }
};
</script>

<style lang="scss" scoped>
.sandbox-container {
  width: 100%;
  position: relative;
  display: flex;
  flex-direction: column;
}

.schedule-spot {
  position: absolute;
  top: 0;
  width: 100%;

  li {
    margin: 0 8px 64px 8px;
    background-color: #fff;
    width: 75vw;
    height: 64px;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 8px;
    box-shadow: 0 2px 6px 1px rgba(0,0,0,.2);
  }
}

.schedule-move {
  width: 100%;
  padding: 0;
  margin-bottom: 88px;

  li {
    margin: 64px 8px 0 8px;
    background-color: #dedede;
    width: 75vw;
    height: 64px;
    display: flex;
    justify-content: center;
    align-items: center;
  }
}

</style>

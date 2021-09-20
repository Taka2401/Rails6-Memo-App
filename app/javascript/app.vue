<template>
  <div id="app">
    <div v-for="memo in memos" :key="memo.id">
      <ul>
        <li>{{ memo.title }}: {{ memo.discription }}</li>
      </ul>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      memos: "memos"
    }
  },
   mounted () {
    this.setMemo();
  },
  methods: {
    setMemo: function () {
      axios.get('/api/memos')
      .then(response => (
        this.memos = response.data
      ))
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>

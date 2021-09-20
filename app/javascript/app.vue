<template>
  <div id="app">
    <div v-for="memo in memos" :key="memo.id">
      <ul>
        <li>{{ memo.title }}: {{ memo.discription }}</li>
      </ul>
    </div>
    <div>
      <input v-model="title" placeholder="title">
      <input v-model="discription" placeholder="discription">
    </div>
    <button @click="addMemo">メモを追加</button>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      memos: "memos",
      title: '',
      discription: '',
    }
  },
   mounted () {
    this.setMemo();
  },
  methods: {
    setMemo: function() {
      axios.get('/api/memos')
      .then(response => (
        this.memos = response.data
      ))
    },
    addMemo: function() {
      axios.post('/api/memos', {
        title: this.title,
        discription: this.discription
      })
      .then(response => (
        this.setMemo()
      ));
      this.title = ""
      this.discription = ""
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

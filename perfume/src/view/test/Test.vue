<template>
  <div id="app">
    <h1>{{msg}}</h1>
    <h1>{{count}}</h1>
    <button @click="ctrlCount">更改数据</button>
    <button @click="AsynCount">异步处理</button>
    
  </div>
</template>

<script>
export default {
  computed: {
    count(){
      return this.$store.getters.count
    }
  },
  methods:{
    ctrlCount(){
      this.$store.commit('ctrlCount')
    },
    AsynCount(){
      this.$store.dispatch('AsynCount')
    }
  },
  data () {
    return {
      msg:"这里是test.vue"
    }
  }
}
</script>

<style scoped>

</style>
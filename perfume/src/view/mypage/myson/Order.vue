<template>
  <div id="app">
    <div class="my-bar my-title" @click="prev">您的宝贝都在这<img src="../../../image/left.png"></div>
    <div class="placehold"></div>
    
  </div>  
</template>
<script>
export default {
  data(){
    return {

    }
  },
  methods: {
    prev(){
      this.$router.go(-1)
    }
  }
}  
</script>
<style scoped>
</style>
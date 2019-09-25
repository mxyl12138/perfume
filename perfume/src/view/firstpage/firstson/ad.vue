<template>
  <div id="app">
    <div class="my-bar my-title" @click="prev">我是你们最爱的广告页<img src="../../../image/left.png"></div>
    <div class="placehold"></div>
    <div>
      {{$route.query}}
    </div>
  </div>  
</template>
<script>
export default {
  data(){
    return {

    }
  },
  created(){
    document.title = "ad"
  },
  methods: {
    prev(){
      this.$router.back(-1)
    }
  }
}  
</script>
<style scoped>
#app{
  height: 667px;
  background-image: url("./../../../image/bg1.jpg");
}
</style>
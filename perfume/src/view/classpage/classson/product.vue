<template>
  <div id="app">
    <div class="my-bar my-title" @click="prev">看了不买，手都给你剁了<img src="../../../image/left.png"></div>
    <!-- <div class="placehold"></div> -->
    <div class="mylbt">
      <mt-swipe :auto="3000" :speed="1000">
        <mt-swipe-item v-for="(item,index) in list" :key="index">
          <!--<a :href="item.href" rel="external nofollow" >-->
          <img :src="item.img" class="lbt-img" @click="lbtgo(index)"/>
          <img :src="item.img" class="lbt-img" @click="lbtgo(index)"/>
          <!--<span class="desc"></span>-->
          <!--</a>-->
        </mt-swipe-item>
      </mt-swipe>
    </div>
    <div>
      <div>

      </div>
    </div>

    <div>
      <!-- 定时器 -->
    </div>

    <div class="f-flex">
      <div class="f-left">
        <div class="d1">
          <div class="t1"></div>
          <div class="font">客服</div>
        </div>
        <div class="d2">
          <div class="t2"></div>
          <div class="font">购物车</div>
        </div>
        <div class="d3">
          <div class="t3"></div>
          <div class="font">收藏</div>
        </div>
      </div>
      <div class="f-right">
        <div class="gwc">加入购物车</div>
        <div class="buy">立即购买</div>
      </div>
     
    </div>
  </div>  
</template>
<script>
export default {
  data(){
    return {
      list:[]
    }
  },
  created(){
    this.loadmore()
  },
  methods: {
    loadmore(){
      var url = "product";
      var obj = { id:this.$route.params.id };
      this.axios.get(url,{params:obj}).then(res=>{this.list = res.data.data})
    },
    prev(){
      this.$router.back(-1)
    },
    lbtgo(index){

    }
  }
}  
</script>
<style scoped>
#app{
  height: 667px;
  background-image: url("./../../../image/bg1.jpg");
}


/*轮播图 */
.mylbt {
  width: 100%;
  height: 230px;
  overflow: hidden;
  background: rgba(236, 177, 158, 0.308);
}
.lbt-img {
  width: 89%;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0px 0px 12px 1px rgba(236, 177, 158, 0.308);
}




/* 底部一排玩意儿 */
.f-flex{
  display: flex;
  position: fixed;
  text-align: center;
  bottom: 0; left: 0;
  width: 100%; height:52px; 
  justify-content: space-around;
}
.f-left{
  display: flex;
  padding: 2px;
  box-sizing: border-box;
  width: 48%; height: 52px;
  justify-content: space-around;
}
.d1{
  text-align: center;width: 33.3%;
  padding-top: 4px;
}
.d2{
  text-align: center;width: 33.3%;
  padding-top: 4px;
}
.d3{
  text-align: center;width: 33.3%;
  padding-top: 4px;
  border-right: 1px solid #cdcdcd;
}
.t1{
  background-image: url(../../../image/kf.png);
  width: 22px; height: 22px;
  background-size: cover;
  margin-left: 18px;
}
.t2{
  background-image: url(../../../image/cart.png);
  width: 25px; height: 22px;
  background-size: cover;
  margin-left: 18px;
}
.t3{
  background-image: url(../../../image/sc.png);
  width: 22px; height: 22px;
  background-size: cover;
  margin-left: 18px;
}
.font{
  color: #000;
  font-weight: bolder;
  font-size: 12px;
}
.f-right{
  text-align: center;
  line-height: 52px;
  width: 52%; height: 52px;
  display: flex;justify-content: space-around;
}
.gwc{
  width: 50%;
  color: #000;
  font-size: 15px;
  font-weight: bolder;
}
.buy{
  width: 50%;
  font-weight: bolder;
  color: #fff;
  font-size: 15px;
  background: #e9971c;
}
</style>
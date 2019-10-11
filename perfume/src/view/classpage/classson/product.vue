<template>
  <div id="app">
    <div class="my-bar my-title" @click="prev">看了不买，手都给你剁了<img src="../../../image/left.png"></div>
    <!-- <div class="placehold"></div> -->
    <div class="mylbt">
      <van-swipe @change="onChange" class="lbt-class">
        <van-swipe-item><div class="lbt1"></div></van-swipe-item>
        <van-swipe-item><div class="lbt2"></div></van-swipe-item>
        <van-swipe-item><div class="lbt3"></div></van-swipe-item>
        <van-swipe-item><div class="lbt4"></div></van-swipe-item>

        <div class="custom-indicator" slot="indicator">
          {{ current + 1 }}/4
        </div>
      </van-swipe>
    </div>
    <div class="info-side">
      <div class="product" v-for="(product,index) in list" :key="index">
        <div class="product_name">{{product.name}}</div>
        <div class="price_sell">
          <span class="product_price">￥{{product.price}}</span>
          <span class="product_sell">已售{{product.sell}}</span>
        </div>
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
      current: 0,
      list:[]
    }
  },
  created(){
    this.loadmore();
  },
  // props:['id'],
  methods: {
    loadmore(){
      var url = "product";
      var obj = { id:this.$route.params.id };
      // var obj = this.id
      this.axios.get(url,{params:obj}).then(res=>{this.list = res.data.data});
      console.log();
      
    },
    prev(){
      this.$router.back(-1)
    },
    onChange(index) {
      this.current = index;
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
.lbt-class{
  width: 100%;height: 230px;
  overflow: hidden;
  box-shadow: 0px 0px 12px 1px rgba(236, 177, 158, 0.308);
}
.custom-indicator{
  position: absolute;
  bottom: 10px;right: 10px;
}
.lbt1{
  width: 100%;height: 230px;
  background-size: cover;
  background-image: url(../../../image/2cy1.jpg)
}
.lbt2{
  width: 100%;height: 230px;
  background-size: cover;
  background-image: url(../../../image/2cy2.jpg)
}
.lbt3{
  width: 100%;height: 230px;
  background-size: cover;
  background-image: url(../../../image/2cy3.jpg)
}
.lbt4{
  width: 100%;height: 230px;
  background-size: cover;
  background-image: url(../../../image/2cy4.jpg)
}

/*info*/
.info-side {
  /* scroll-behavior: smooth; */
  width: 100%;height: 2000px;
  background: #fff;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  padding: 12px;
  overflow: scroll;
  position: relative;
}
.product {
  box-sizing: border-box;
  width: 100%;
  overflow: hidden;
}
.product_name {
  /* overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis; */
  overflow:hidden; 
  text-overflow:ellipsis;
  display:-webkit-box; 
  -webkit-box-orient:vertical;
  -webkit-line-clamp:2; 
  margin: 4px 0 4px;
  font-size: 15px;
  height: 42px;
}
.price_sell {
  font-size: 15px;
  display: flex;
  justify-content: space-between;
}
.product_price {
  color: rgb(226, 103, 103);
}
.product_sell {
  color: #7cc4ee;
  font-size: 13px;
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
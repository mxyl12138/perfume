<template>
  <div id="app">
    <div class="my-bar my-title">分类</div>
    <div>
      <img class='head-img1 head-img' src="https://6d78-mxyl-fw09z-1259665463.tcb.qcloud.la/blackhead.png?sign=e2dba7397a21d46ccf9ead14c66d7403&t=1564017947">
      <img class='head-img2 head-img' src="https://6d78-mxyl-fw09z-1259665463.tcb.qcloud.la/blackhead.png?sign=e2dba7397a21d46ccf9ead14c66d7403&t=1564017947">
      <img class='head-img3 head-img' src="https://6d78-mxyl-fw09z-1259665463.tcb.qcloud.la/blackhead.png?sign=e2dba7397a21d46ccf9ead14c66d7403&t=1564017947">
      <img class='head-img4 head-img' src="https://6d78-mxyl-fw09z-1259665463.tcb.qcloud.la/blackhead.png?sign=e2dba7397a21d46ccf9ead14c66d7403&t=1564017947">
      <img class='head-img5 head-img' src="https://6d78-mxyl-fw09z-1259665463.tcb.qcloud.la/blackhead.png?sign=e2dba7397a21d46ccf9ead14c66d7403&t=1564017947">
      <img class='head-img6 head-img' src="https://6d78-mxyl-fw09z-1259665463.tcb.qcloud.la/blackhead.png?sign=e2dba7397a21d46ccf9ead14c66d7403&t=1564017947">
    </div>
    <div class="placehold"></div>

    <div class="ad">
      <div class="ad_div"></div>
    </div>
    <!-- 广告下面联动列表 -->
    <div class="outside">
      <!-- 左边部分 -->
      <div class="outside-left">
        <ul class="left-ul">
          <a :href="jump">
            <li v-for="(name,index) in datas.lists" :key="index" class="left-li" @click="active(index)" :class="{active:currentIndex==index}">{{name}}</li>
          </a>
        </ul>
      </div>

      <!-- 右边部分 -->
      <div class="outside-right" ref="side1" @scroll="scrollEvent">  

        <div class="rq">
          <div class="rq-nav" id="jump1">人气Top</div>
          <div class="product" v-for="(product,index) in datas.products" :key="index" @click="productgo(index)">
            <div class="product_left">
              <img :src="product.img" class="product_img">
            </div>
            <div class="product_center">
              <div class="product_name">{{product.name}}</div>
              <div class="product_price">￥{{product.price}}</div>
            </div>
            <div class="product_right">
              <button class="product_btn">+</button>
            </div>
          </div>
        </div>
        <div class="rq m0">
          <div class="rq-nav" id="jump2">大师咖啡</div>
          <div class="product" v-for="(product,index) in datas.products1" :key="index" @click="productgo(index)">
            <div class="product_left">
              <img :src="product.img" class="product_img">
            </div>
            <div class="product_center">
              <div class="product_name">{{product.name}}</div>
              <div class="product_price">￥{{product.price}}</div>
            </div>
            <div class="product_right">
              <button class="product_btn">+</button>
            </div>
          </div>
        </div>
        <div class="rq m0">
          <div class="rq-nav" id="jump3">小鹿茶精品</div>
          <div class="product" v-for="(product,index) in datas.products2" :key="index" @click="productgo(index)">
            <div class="product_left">
              <img :src="product.img" class="product_img">
            </div>
            <div class="product_center">
              <div class="product_name">{{product.name}}</div>
              <div class="product_price">￥{{product.price}}</div>
            </div>
            <div class="product_right">
              <button class="product_btn">+</button>
            </div>
          </div>
        </div>
        <div class="rq m0">
          <div class="rq-nav" id="jump4">瑞纳冰</div>
          <div class="product" v-for="(product,index) in datas.products" :key="index" @click="productgo(index)">
            <div class="product_left">
              <img :src="product.img" class="product_img">
            </div>
            <div class="product_center">
              <div class="product_name">{{product.name}}</div>
              <div class="product_price">￥{{product.price}}</div>
            </div>
            <div class="product_right">
              <button class="product_btn">+</button>
            </div>
          </div>
        </div>
        <div class="rq m0">

          <!-- <div ref="scrollIny">
            <div> -->
          <div class="rq-nav" id="jump5">鲜榨果汁</div>
          <div class="product" v-for="(product,index) in datas.products" :key="index" @click="productgo(index)">
            <div class="product_left">
              <img :src="product.img" class="product_img">
            </div>
            <div class="product_center">
              <div class="product_name">{{product.name}}</div>
              <div class="product_price">￥{{product.price}}</div>
            </div>
            <div class="product_right">
              <button class="product_btn">+</button>
            </div>
          </div>
        </div>
        <div class="rq m0">
          <div class="rq-nav" id="jump6">经典饮品</div>
          <div class="product" v-for="(product,index) in datas.products2" :key="index" @click="productgo(index)">
            <div class="product_left">
              <img :src="product.img" class="product_img">
            </div>
            <div class="product_center">
              <div class="product_name">{{product.name}}</div>
              <div class="product_price">￥{{product.price}}</div>
            </div>
            <div class="product_right">
              <button class="product_btn">+</button>
            </div>
          </div>
        </div>

          <!-- </div>
        </div> -->

        <div class="rq m0">
          <div class="rq-nav" id="jump7">BOSS午餐</div>
          <div class="product" v-for="(product,index) in datas.products" :key="index" @click="productgo(index)">
            <div class="product_left">
              <img :src="product.img" class="product_img">
            </div>
            <div class="product_center">
              <div class="product_name">{{product.name}}</div>
              <div class="product_price">￥{{product.price}}</div>
            </div>
            <div class="product_right">
              <button class="product_btn">+</button>
            </div>
          </div>
        </div>

        <div class="rq m0">
          <div class="rq-nav" id="jump8">健康轻食</div>
          <div class="product" v-for="(product,index) in datas.products1" :key="index" @click="productgo(index)">
            <div class="product_left">
              <img :src="product.img" class="product_img">
            </div>
            <div class="product_center">
              <div class="product_name">{{product.name}}</div>
              <div class="product_price">￥{{product.price}}</div>
            </div>
            <div class="product_right">
              <button class="product_btn">+</button>
            </div>
          </div>
        </div>

        <div class="rq m0">
          <div class="rq-nav" id="jump9">幸运小食</div>
          <div class="product" v-for="(product,index) in datas.products1" :key="index" @click="productgo(index)">
            <div class="product_left">
              <img :src="product.img" class="product_img">
            </div>
            <div class="product_center">
              <div class="product_name">{{product.name}}</div>
              <div class="product_price">￥{{product.price}}</div>
            </div>
            <div class="product_right">
              <button class="product_btn">+</button>
            </div>
          </div>
        </div>

        <div class="rq m0">
          <div class="rq-nav" id="jump10">周边潮品</div>
          <div class="product" v-for="(product,index) in datas.products1" :key="index" @click="productgo(index)">
            <div class="product_left">
              <img :src="product.img" class="product_img">
            </div>
            <div class="product_center">
              <div class="product_name">{{product.name}}</div>
              <div class="product_price">￥{{product.price}}</div>
            </div>
            <div class="product_right">
              <button class="product_btn">+</button>
            </div>
          </div>
        </div>
        
        

        <div style="width:100%;height:60px;opacity:0"></div>
      </div>
    </div>
  </div>  
</template>
<script>
import mydata from './ClassAll.json'
// import BScroll from 'better-scroll'
export default {
  data(){
    return {
      datas: mydata,
      currentIndex: 0,
      // scrolly: 0,
      jump: ""
    }
  },
  methods:{
    productgo(index){
      // console.log(this.datas.products2[index].id);
      let id = this.datas.products2[index].id;
      this.$router.push({path:`/product/${id}`})
    },
    scrollEvent(){
    },
    active(index){
      this.currentIndex = index;
      this.jump = "#jump" + (index + 1);
    }
  },
  created(){
    
  },
  mounted() {
    document.addEventListener('scroll', () => {
      console.log(123);
    });
    
  }
}
</script>
<style scoped>
#app {
  background: rgba(255, 255, 255, 0.315);
}
.head-img{
  opacity: .7;
}
.my-bar{
  background: rgba(255, 255, 255, 0.514);
}
.ad {
  width: 100%;height: 110px;
}
.ad_div {
  background-image: url('../../image/ad1.jpg');
  height: 110px;
  /* box-shadow: 0px 0px 12px 1px rgba(78, 211, 189, 0.486); */
  background-position: 0px -30px;
  background-size: cover;
  background-repeat: no-repeat;
}

/* 广告下面联动 */
.outside{
  display: flex;
  box-sizing: border-box;
  height: calc(667px - 50px);
}
.outside-left{
  width: 25%; height: calc(667px - 107px);
  position: relative;
  z-index: 1;
}
.left-ul{
  height: calc(667px - 107px);
  border-bottom: 1px solid #cdcdcd;
  background: #f0f0f0;
  
}
.left-li{
  /* transition: all .2s linear; */
  line-height: 2.8rem;
  text-align: center;
  height: 2.8rem;
  color: #575757;
  background: #f0f0f0;
  border-bottom: 1px solid #60b6e74d;
}
.active{
  font-weight: bolder;
  border-left: 4px solid rgba(89, 171, 199, 0.753);
  color: #000;
  background: #fff;
  padding-right: 4px; 
}

/* 右边商品 */
.outside-right{
  border-top: 12px solid #ffffff;
  scroll-behavior: smooth;
  width: 75%;
  background: #fff;
  box-sizing: border-box;
  padding: 12px;
  overflow: scroll;
  position: relative;
}
.rq{
  width: 100%;
  margin-top: -12px
}
.m0{margin-top: 0px}
.rq-nav{
  font-weight: bolder;
  font-size: 13px;
  line-height: 40px;
}
/* .onscroll{
  display: block;
  position: absolute;
  top: 0;left: 106px;
  width: 257.25px;
  background: #fff;
} */

.product {
  height: 96px;
  display: flex;
  box-sizing: border-box;
  width: 100%;
  background: #fff;
  /* box-shadow: 0px 0px 12px 1px rgba(111, 139, 216, 0.719); */
  overflow: hidden;
  /* margin-top: 10px; */
  padding: 10px 0;
}
.product + .product{
  border-top: 1px solid rgba(89, 171, 199, 0.342);
}

.product_left{
  width: 30%;height: 40px;
}
.product_center{
  width: 62%;height: 40px;
}
.product_right{
   width: 8%;height: 100%;
  line-height: 125px;
}

.product_img {
  width: 75px;height: 75px;
  border-radius: 3px;
}
.product_name {
  padding: 3px 10px 10px;
  font-size: 15px;
  height: 42px;
}
.product_price {
  padding: 0px 10px 0px;
  color: rgb(226, 103, 103);
  font-size: 16px;
}
.product_btn {
  background: #82C0D5;
  border: 0;
  color: #fff;
  line-height: 20px;
  width:20px; height: 20px;
  border-radius: 100px;
  outline: none;
}
/* .product_btn :active{
  background: #F899A0
} */
article.rq-nav:target{
  padding-top:44px;
}
</style>
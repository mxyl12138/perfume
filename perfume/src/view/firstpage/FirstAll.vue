<template>
  <div id="app">
    <div style="width:100%;height:40px;opacity:0"></div>
    <div class="search_out">
      <div class="search">
        <input placeholder="宝贝/麝香" type="search" />
        <div class="sousuo">搜索</div>
      </div>
    </div>
    <!-- 轮播图 -->
    <div class="mylbt">
      <mt-swipe :auto="3000" :speed="1000">
        <mt-swipe-item v-for="(item,index) in items" :key="index" style="padding:25px 20px">
          <!--<a :href="item.href" rel="external nofollow" >-->
          <img :src="item.url" class="lbt-img" @click="lbtgo(index)" />
          <!--<span class="desc"></span>-->
          <!--</a>-->
        </mt-swipe-item>
      </mt-swipe>
    </div>
    <!-- 所有白色背景内容 -->
    <div class="body">
      <!-- 轮播图下的列表 -->
      <div class="mylists">
        <div v-for="(list,index) in lists" :key="index" class="mylist" @click="listgo(index)">
          <img :src="list.url" class="img2" />
          <div style="font-size: 13px;">{{list.name}}</div>
        </div>
      </div>
      <!-- 列表下的广告 -->
      <div class="ad" @click="adgo">
        <div class="ad_div">
          
        </div>
      </div>
      <!-- 商品列表导航栏 -->

      <div ref="scrollInX">
        <div class="product_nav">
          <span
            v-for="(nav,index) in navs"
            @click="navv(index)"
            :key="index"
            :class="{hui:(index+1)%2==0,yellow:currentIndex===index}"
          >{{nav}}</span>
        </div>
        <div class="product_nav_bottom" :style="'transfrom:translateX('+scrollX+'px)'">
          <div
            v-for="(nav,index) in navs"
            @click="navv(index)"
            :key="index"
            :class="{yellow_bg:currentIndex===index&&currentIndex%2==0}"
          ></div>
        </div>

      </div>
      
      <div class="products">
        <div class="product" v-for="(product,index) in products" :key="index" @click="productgo(index)">
          <img class="product_img" :src="product.url" />
          <div class="product_name">{{product.name}}</div>
          <div class="price_sell">
            <span class="product_price">￥{{product.price}}</span>
            <span class="product_sell">已售{{product.sell}}</span>
          </div>
        </div>
      </div>

      <mt-button size="large" @click="loadmore">加载更多</mt-button>

      <div style="width:100%;height:70px;opacity:0"></div>
    </div>
  </div>
</template>

<script>
import BScroll from "better-scroll";
export default {
  mounted(){
    this.$nextTick(() => {
      this._initScroll();
    });
  },
  created(){
    this.loadmore();
  },
  methods:{
    productgo(index){
      console.log(this.products[index].uid);
      let uid = this.products[index].uid;
      this.$router.push({path:`/product2/${uid}`})
    },
    loadmore(){
      var url="firstAll";
      this.pno++;
      var obj={pno:this.pno}
      this.axios.get(url,{params:obj}).then(res=>{this.products=this.products.concat(res.data.data)})
    },
    _initScroll(){
      this.scrollBox = new BScroll(this.$refs.scrollInX, {
        probeType: 3,
        scrollX: true,
        click: true
      });
      this.scrollBox.on("scroll", pos => {
        this.scrollX = Math.abs(Math.round(pos.x));
      });
    },
    //遍历导航条给每个标题绑定事件
    navv(index){
      console.log(this.products);
      this.currentIndex = index;
      //点击对商品列表排序
      let cindex = this.currentIndex;
      if(cindex == 4){
        // function fun(){
        this.products.sort(function(a, b) {
          if(parseInt(a.price)<parseInt(b.price)){
            return -1;
          }else if(a.price>b.price){
            return 1;
          }
        });
        for(var i = 0;i < this.products.length;i++) {
          return;
        }
        this.products = (products[i].price + "," + products[i].name + "," + products[i].sell + "," + products[i].url);
        // }
      }else if(cindex == 2){
        this.products.sort(function(a, b) {
          if(parseInt(a.sell)>parseInt(b.sell)){
            return -1;
          }else if(a.sell<b.sell){
            return 1;
          }
          return 0;
        });
        for(var i = 0;i < this.products.length;i++) {
          return;
        }
        this.products = (products[i].price + "," + products[i].name + "," + products[i].sell + "," + products[i].url);
      }else if(cindex == 6){
        this.products.sort(function(a, b) {
          if(parseInt(a.uid)<parseInt(b.uid)){
            return -1;
          }else if(a.uid>b.uid){
            return 1;
          }
          return 0;
        });
        for(var i = 0;i < this.products.length;i++) {
          return;
        }
        this.products = (products[i].price + "," + products[i].name + "," + products[i].sell + "," + products[i].url);
      }else if(cindex == 0){
        this.products.sort(function(a, b) {
          if(parseInt(a.id)<parseInt(b.id)){
            return -1;
          }else if(a.id>b.id){
            return 1;
          }
          return 0;
        });
        for(var i = 0;i < this.products.length;i++) {
          return;
        }
        this.products = (products[i].price + "," + products[i].name + "," + products[i].sell + "," + products[i].url);
      }
    },
    //轮播图点击事件
    lbtgo(index) {
      let obj = this.items[index]
      this.$router.push({
        // path: obj.href+"/"+obj.uid,
        path: obj.href,
        query:{
          title:obj.title,url:obj.url
        }
      });
    },
    //列表栏点击事件
    listgo(index) {
      this.$router.push(this.lists[index].href);
    },
    //广告栏点击事件
    adgo(){
      this.$router.push('/ad');
    }
  },
  data() {
    return {
      currentIndex1: [
        { isSelect: true },
        { isSelect: false },
        { isSelect: false },
        { isSelect: false },
      ],
      selected: "首页",
      currentIndex: 0,
      value: "",
      scrollBox: 0,
      scrollX: 0,
      navs: [
        "新品","丨","热门","丨","合辑","丨","全部","丨","新品","丨","热门","丨","合辑","丨","全部"
      ],
      items: [
        {
          uid: 'aaa',
          title: "你的名字",
          href: "/ad",
          url: "http://localhost:8000/lbt1.jpg"
        },
        {
          uid: 'bbb',
          title: "我的名字",
          href: "/ad",
          url: "http://localhost:8000/lbt2.jpg"
        },
        {
          uid: 'ccc',
          title: "我的名字",
          href: "/ad",
          url: "http://localhost:8000/lbt3.jpg"
        }
      ],
      lists: [
        {
          // href: "/CartAll",
          name: "正装香水",
          url: "http://localhost:8000/li1.png"
        },
        {
          // href: "/product",
          name: "香水常味",
          url: "http://localhost:8000/li2.png"
        },
        {
          // href: "/product",
          name: "正装线香",
          url: "http://localhost:8000/li3.png"
        },
        {
          // href: "/product",
          name: "线香常味",
          url: "http://localhost:8000/li4.png",
        },
        {
          // href: "/login",
          name: "积分商城",
          url: "http://localhost:8000/li5.png"
        },
        {
          // href: "/login",
          name: "其他商品",
          url: "http://localhost:8000/li6.png"
        },
        {
          // href: "/login",
          name: "试用",
          url: "http://localhost:8000/li7.png"
        },
        {
          // href: "/login",
          name: "游戏",
          url: "http://localhost:8000/li8.png"
        }
      ],
      pno:0,
      products: []
    };
  }
};
</script>
<style scoped>
/*底部导航栏默认文字颜色*/
.mint-tabbar > .mint-tab-item {
  color: #2e2e2e;
}
/*修改tabbar 选中文字颜色*/
.mint-tabbar > .mint-tab-item.is-selected {
  background-color: transparent;
  color: #f39c7a !important;
}

/*搜索框*/
.search_out {
  box-sizing: border-box;
  position: fixed;
  top: 0;
  width: 100%;
  height: 50px;
  background: rgba(209, 207, 208, 0.815);
  z-index: 1;
}
.search {
  /*position:absolute;
  top:50px;left:0px;*/
  position: fixed;
  top: 10px;
  box-sizing: border-box;
  width: 100%;
  height: 28px;
  padding: 0 10px;
  text-indent: 10px;
}
input[type="search"] {
  position: relative;
  width: 82%;
  height: 28px;
  border-radius: 35px;
  font-size: 15px;
  background: rgba(255, 255, 255, 0.7);
  outline: none;
  text-indent: 10px;
  border: 0;
}
.sousuo {
  position: absolute;
  top: 4px;
  right: 18px;
  color: #410f0f;
  font-size: 15px;
}

/*input[type=search]:after{
    position: absolute;
    content: 'x';
    left: 25%;
    font-size: 10px!important;
    z-index:1;
}*/

/*轮播图 */
.mylbt {
  width: 100%;
  height: 230px;
  overflow: hidden;
  /* background:rgba(173, 169, 233, 0.431); */
}
.lbt-img {
  width: 89%;
  overflow: hidden;
  box-shadow: 0px 0px 12px 1px rgba(236, 177, 158, 0.308);
}

/*轮播图下的八组列表栏*/
.mylists {
  box-sizing: border-box;
  width: 100%;
  height: 210px;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  margin-top: -10px;
  padding: 10px;
  /* background: rgba(27, 173, 71, 0.274); */
}
.mylist {
  box-sizing: border-box;
  width: 24%;
  text-align: center;
  border-radius: 5px;
  /* box-shadow: 1px 1px 12px 1px rgba(233, 141, 66, 0.144); */
}
.img2 {
  width: 60px;
  height: 60px;
  border-radius: 8px;
  margin-top: 10px;
}

.body {
  /* background: rgba(132, 127, 207, 0.431); */
}
/* 列表下的广告 */
.ad {
  width: 100%;height: 90px;
  box-sizing: border-box;
  padding: 0 20px;
  margin-top: 15px;
}
.ad_div {
  background-image: url('../../image/lbt2.jpg');
  height: 90px;
  box-shadow: 0px 0px 12px 1px rgba(61, 63, 63, 0.486);
  background-position: 0px -90px;
  background-size: cover;
  background-repeat: no-repeat;
  border-radius: 3px;
}


/* 商品列表 */
.product_nav {
  box-sizing: border-box;
  padding: 10px 20px 10px;
  width: 200%;
  display: flex;
  justify-content: space-around;
}
.product_nav > span {
  font-size: 14px;
  font-weight: bold;
}

.product_nav > .hui {
  color: #ece7e71e;
  font-weight: 100;
}

.product_nav_bottom {
  box-sizing: border-box;
  padding: 0px 25px 10px;
  width: 200%;
  height: 20px;
  display: flex;
  justify-content: space-between;
}
.product_nav_bottom > div {
  width: 15%;
  height: 4px;
  border-radius: 50px;
}
.yellow {
  color: rgb(121, 216, 233);
}
.yellow_bg {
  background-color: rgb(121, 216, 233);
}

/*底部商品列表*/
.products {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  padding: 0px 15px;
}
.product {
  box-sizing: border-box;
  width: 45.5%;
  margin: 5px 5px 15px;
  background: #fff;
  border-radius: 5px;
  box-shadow: 0px 0px 12px 1px rgba(111, 139, 216, 0.719);
  overflow: hidden;
}
.product_img {
  width:130%;height: 160px;
  margin-left: -25px;
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
  padding: 0px 10px 0px;
  font-size: 15px;
  height: 42px;
}
.price_sell {
  padding: 0px 10px 5px;
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


</style>

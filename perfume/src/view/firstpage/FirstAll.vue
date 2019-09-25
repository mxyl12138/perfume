<template>
  <div>
    <div style="width:100%;height:40px;opacity:0"></div>
    <div class="search_out">
      <div class="search">
        <input placeholder="宝贝/麝香" type="search" />
        <div class="sousuo">搜索</div>
      </div>
    </div>
    <!-- 轮播图 -->
    <div class="mylbt">
      <mt-swipe :auto="4000" :speed="1000">
        <mt-swipe-item v-for="(item,index) in items" :key="index" style="padding:20px 20px">
          <!--<a :href="item.href" rel="external nofollow" >-->
          <img :src="item.url" class="img" @click="lbtgo(index)" />
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
        <div style="display:none;position:absolute;top:520px;left:35%;font-weight: bold;color:#2e2e2e">睡你麻痹起来嗨</div>
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
        <div class="product" v-for="(product,index) in products" :key="index">
          <img class="product_img" :src="product.url" />
          <div class="product_name">{{product.name}}</div>
          <div class="price_sell">
            <span class="product_price">￥{{product.price}}</span>
            <span class="product_sell">已售{{product.sell}}</span>
          </div>
        </div>
      </div>
      <div style="width:100%;height:60px;opacity:0"></div>
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
  methods:{
    changeState(n) {
      //1:n当前按钮下标
      //2:创建循环数据
      for (var i = 0; i < this.currentIndex1.length; i++) {
        //3:如果当前下标与参数下标一致
        if(n == i){
          this.currentIndex1[i].isSelect = true;
        }else{
          this.currentIndex1[i].isSelect = false;
        }
      }
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
          return 0;
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
          url: "http://localhost:8000/lbt1.png"
        },
        {
          uid: 'bbb',
          title: "我的名字",
          href: "/ad",
          url: "http://localhost:8000/lbt2.png"
        },
        {
          uid: 'ccc',
          title: "我的名字",
          href: "/ad",
          url: "http://localhost:8000/lbt3.png"
        }
      ],
      lists: [
        {
          href: "/product",
          name: "正装香水",
          url: "http://localhost:8000/fj1.jpg"
        },
        {
          href: "/product",
          name: "香水常味",
          url: "http://localhost:8000/lbt1.png"
        },
        {
          href: "/product",
          name: "正装线香",
          url: "http://localhost:8000/fj4.jpg"
        },
        {
          href: "/product",
          name: "线香常味",
          url: "http://localhost:8000/tx1.jpg",
        },
        {
          href: "/login",
          name: "积分商城",
          url: "http://localhost:8000/tx2.jpg"
        },
        {
          href: "/login",
          name: "其他商品",
          url: "http://localhost:8000/lbt2.png"
        },
        {
          href: "/login",
          name: "试用",
          url: "http://localhost:8000/bg4.jpg"
        },
        {
          href: "/login",
          name: "游戏",
          url: "http://localhost:8000/tx3.jpg"
        }
      ],
      products: [
        {
          id: 1,
          uid: 20,
          name: "试香 YSL/圣罗兰 黑鸦片",
          price: "36.00",
          sell: "51",
          url: "http://localhost:8000/2cy1.jpg"
        },
        {
          id: 2,
          uid: 21,
          name: "试香 芦丹氏 柏林少女",
          price: "24.00",
          sell: "251",
          url: "http://localhost:8000/2cy2.jpg"
        },
        {
          id: 3,
          uid: 25,
          name: "试香 阿蒂仙 冥府之路",
          price: "88.00",
          sell: "0",
          url: "http://localhost:8000/2cy3.jpg"
        },
        {
          id: 4,
          uid: 22,
          name: "试香 三宅一生 一生之水",
          price: "22.00",
          sell: "886",
          url: "http://localhost:8000/2cy4.jpg"
        },
        {
          id: 5,
          uid: 19,
          name: "试香 欧珑 赤霞橘光",
          price: "28.00",
          sell: "281",
          url: "http://localhost:8000/2cy5.jpg"
        },
        {
          id: 6,
          uid: 23,
          name: "试香 百瑞德 无人区玫瑰 Byredo Rose Of No Man's Land",
          price: "67.00",
          sell: "0",
          url: "http://localhost:8000/2cy6.jpg"
        },
        {
          id: 7,
          uid: 24,
          name: "试香 古驰 绽放",
          price: "52.00",
          sell: "21",
          url: "http://localhost:8000/2cy7.jpg"
        },
        {
          id: 8,
          uid: 18,
          name: "试香 祖马龙 英国梨和小苍兰",
          price: "20.00",
          sell: "651",
          url: "http://localhost:8000/fj1.jpg"
        },
        {
          id: 9,
          uid: 16,
          name: "试香 桃丝熊 淘气小熊宝宝",
          price: "36.00",
          sell: "29",
          url: "http://localhost:8000/fj2.jpg"
        },
        {
          id: 10,
          uid: 14,
          name: "试香 Burberry/巴宝莉 红粉恋歌",
          price: "38.88",
          sell: "15135",
          url: "http://localhost:8000/lbt1.png"
        },
        {
          id: 11,
          uid: 17,
          name: "试香 Juicy/橘滋 脏话男士",
          price: "65.99",
          sell: "51",
          url: "http://localhost:8000/gd1.jpg"
        },
        {
          id: 12,
          uid: 15,
          name: "试香 Creed/信仰 银色山泉",
          price: "81.00",
          sell: "1",
          url: "http://localhost:8000/gd2.jpg"
        },
        {
          id: 13,
          uid: 13,
          name: "试香 Bvlgari/宝格丽白茶 ",
          price: "95.00",
          sell: "0",
          url: "http://localhost:8000/gd3.jpg"
        },
        {
          id: 14,
          uid: 12,
          name: "试香 Kenzo/高田贤三风之恋",
          price: "69.00",
          sell: "201",
          url: "http://localhost:8000/gd4.jpg"
        },
        {
          id: 15,
          uid: 11,
          name: "试香 Diptyque/蒂普提克 东京柑橘",
          price: "26.00",
          sell: "251",
          url: "http://localhost:8000/gd5.jpg"
        },
        {
          id: 16,
          uid: 8,
          name: "试香 欧珑 无极乌龙 Atelier Cologne",
          price: "68.00",
          sell: "20886",
          url: "http://localhost:8000/lbt2.png"
        },
        {
          id: 17,
          uid: 9,
          name: "试香 爱马仕 地中海花园",
          price: "58.00",
          sell: "2548",
          url: "http://localhost:8000/lbt3.png"
        },
        {
          id: 18,
          uid: 4,
          name: "试香 FM 一轮玫瑰",
          price: "150.00",
          sell: "0",
          url: "http://localhost:8000/fj3.jpg"
        },
        {
          id: 19,
          uid: 3,
          name: "试香 Ck one",
          price: "77.00",
          sell: "5",
          url: "http://localhost:8000/fj4.jpg"
        },
        {
          id: 20,
          uid: 2,
          name: "试香 宝格丽 绿茶",
          price: "53.00",
          sell: "25",
          url: "http://localhost:8000/fj5.jpg"
        },
        {
          id: 21,
          uid: 1,
          name: "试香 维多利亚秘密 性感炸弹",
          price: "75.00",
          sell: "61",
          url: "http://localhost:8000/2cy2.jpg"
        },
        {
          id: 22,
          uid: 7,
          name: "试香 Clean/洁净 雨后",
          price: "29.00",
          sell: "851",
          url: "http://localhost:8000/2cy1.jpg"
        },
        {
          id: 23,
          uid: 10,
          name: "试香 4711 白桃与芫荽",
          price: "102.00",
          sell: "1051",
          url: "http://localhost:8000/fj3.jpg"
        },
        {
          id: 24,
          uid: 6,
          name: "试香 Loewe 事后清晨",
          price: "99.00",
          sell: "121",
          url: "http://localhost:8000/fj2.jpg"
        },
        {
          id: 25,
          uid: 5,
          name: "试香YSL/圣罗兰 黑鸦片",
          price: "35.00",
          sell: "841",
          url: "http://localhost:8000/fj1.jpg"
        }
      ]
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
  background: rgba(207, 127, 165, 0.9);
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
  background: rgba(248, 223, 227, 0.7);
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
  background: rgba(236, 177, 158, 0.308);
}
.img {
  width: 89%;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0px 0px 12px 1px rgba(236, 177, 158, 0.308);
}
/*下面的两点*/
/* .mint-swipe {
  height: 100%;
  position: relative;
}
.mint-swipe-indicators {
  transform: translate(-50%, -100%) !important;
} */

/* .mint-swipe-indicator {
  width: 10px !important;
  height: 4px !important;
  border-radius: 150px !important;
  opacity: 0.8 !important;
  background: rgb(252, 250, 250) !important;
}
.mint-swipe-indicator.is-active {
  background: rgb(226, 103, 103) !important;
  width: 18px !important;
  height: 4px !important;
} */
/*
.desc{
  font-weight: 600;
  opacity: .9;
  padding: 5px;
  height: 20px;
  line-height: 20px;
  width: 100%;
  color: #fff;
  background-color: gray;
  position: absolute;
  bottom: 0;
}*/

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
  background: rgba(27, 173, 71, 0.274);
}
.mylist {
  box-sizing: border-box;
  width: 24%;
  text-align: center;
  border-radius: 5px;
  box-shadow: 1px 1px 12px 1px rgba(233, 141, 66, 0.144);
}
.img2 {
  width: 60px;
  height: 60px;
  border-radius: 8px;
  margin-top: 10px;
}

.body {
  background: rgba(132, 127, 207, 0.431);
}
/* 列表下的广告 */
.ad {
  width: 100%;height: 90px;
  box-sizing: border-box;
  padding: 0 20px;
  margin-top: 15px;
}
.ad_div {
  background-image: url('../../image/2cy1.jpg');
  height: 90px;
  box-shadow: 0px 0px 12px 1px rgba(78, 211, 189, 0.486);
  background-position: 0px -30px;
  background-size: cover;
  background-repeat: no-repeat;
  border-radius: 3px;
}

/*商品列表////////////////////////////////////////////////////////////////////*/
/* .scrollInX {
    width: 90%;
    margin: 0 auto;
    overflow: hidden;
  }
  ul.listWrap {
    list-style:none;
    width: 600px;
    display: flex;
    flex-wrap: nowrap;
    margin: 0;
    padding: 0;
  }
  li.listItem {
    flex:1;
  }
  li.listItem img {
    width: 100%;
    object-fit: cover;
  } */

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
  color: rgb(150, 190, 139);
}
.yellow_bg {
  background-color: rgb(150, 190, 139);
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
  height: 160px;
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

<template>
  <div id="app">
    <div class="my-bar my-title">购物车</div>
    <div>
      <img class='head-img1 head-img' src="https://6d78-mxyl-fw09z-1259665463.tcb.qcloud.la/blackhead.png?sign=e2dba7397a21d46ccf9ead14c66d7403&t=1564017947">
      <img class='head-img2 head-img' src="https://6d78-mxyl-fw09z-1259665463.tcb.qcloud.la/blackhead.png?sign=e2dba7397a21d46ccf9ead14c66d7403&t=1564017947">
      <img class='head-img3 head-img' src="https://6d78-mxyl-fw09z-1259665463.tcb.qcloud.la/blackhead.png?sign=e2dba7397a21d46ccf9ead14c66d7403&t=1564017947">
      <img class='head-img4 head-img' src="https://6d78-mxyl-fw09z-1259665463.tcb.qcloud.la/blackhead.png?sign=e2dba7397a21d46ccf9ead14c66d7403&t=1564017947">
      <img class='head-img5 head-img' src="https://6d78-mxyl-fw09z-1259665463.tcb.qcloud.la/blackhead.png?sign=e2dba7397a21d46ccf9ead14c66d7403&t=1564017947">
      <img class='head-img6 head-img' src="https://6d78-mxyl-fw09z-1259665463.tcb.qcloud.la/blackhead.png?sign=e2dba7397a21d46ccf9ead14c66d7403&t=1564017947">
    </div>
    
    <div class="placehold"></div>

    <div class="nocart">
      <div class="nocart-child">你的宝贝们等你到花儿都谢了！</div>
    </div>

    <div class="products-all">
      <div class="products-nav">更多推荐</div>
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
  export default {
    data(){
      return {
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
      }
    }
  }  
</script>
<style scoped>
#app {
  background: rgba(255, 255, 255, 0.315);
  /* background-image: url("./image/bg1.jpg"); */
}
/* .head-img{
  opacity: 1;
} */
.nocart{
  height: 10rem;
  line-height: 10rem;
  background: rgba(255, 255, 255, 0.171);
  border-bottom: 1px solid #cdcdcd;
}
.nocart-child{
  text-align: center;
  font-weight: bold;
}

.products-all{
  background: rgba(255, 255, 255, 0.171);
}
.products-nav{
  padding: 1.5rem 0 .5rem;
  text-indent: 1.4rem;
  font-weight: bold;
  font-size: 16px;
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
<template>
  <div id="app">
    <div class="my-bar my-title" style="color:#ffffffe5">我的</div>
    <!-- <img class='head-img1 head-img' src="https://6d78-mxyl-fw09z-1259665463.tcb.qcloud.la/greenhead.png?sign=88cd400544acd3d319a1c3fc8038ceb9&t=1564016424"> 绿色-->
    <!-- <img class='head-img1 head-img' src="https://6d78-mxyl-fw09z-1259665463.tcb.qcloud.la/blackhead.png?sign=e2dba7397a21d46ccf9ead14c66d7403&t=1564017947"> 黑色-->
    <!-- <img class='head-img1 head-img' src="https://6d78-mxyl-fw09z-1259665463.tcb.qcloud.la/redhead.png?sign=c46b15858a7ac76d8ac005bd5bb3cbaa&t=1564016710"> 橙色-->
   <img class='head-img1 head-img' src="https://6d78-mxyl-fw09z-1259665463.tcb.qcloud.la/greenhead.png?sign=88cd400544acd3d319a1c3fc8038ceb9&t=1564016424">
    <img class='head-img2 head-img' src="https://6d78-mxyl-fw09z-1259665463.tcb.qcloud.la/greenhead.png?sign=88cd400544acd3d319a1c3fc8038ceb9&t=1564016424">
    <img class='head-img3 head-img' src="https://6d78-mxyl-fw09z-1259665463.tcb.qcloud.la/greenhead.png?sign=88cd400544acd3d319a1c3fc8038ceb9&t=1564016424">
    <img class='head-img4 head-img' src="https://6d78-mxyl-fw09z-1259665463.tcb.qcloud.la/greenhead.png?sign=88cd400544acd3d319a1c3fc8038ceb9&t=1564016424">
    <img class='head-img5 head-img' src="https://6d78-mxyl-fw09z-1259665463.tcb.qcloud.la/greenhead.png?sign=88cd400544acd3d319a1c3fc8038ceb9&t=1564016424">
    <img class='head-img6 head-img' src="https://6d78-mxyl-fw09z-1259665463.tcb.qcloud.la/greenhead.png?sign=88cd400544acd3d319a1c3fc8038ceb9&t=1564016424">

    <div class="user-bar" @click="uesrgo">
      <div class="left"></div>
      <div class="right">
        {{datas.order[0].name}}
      </div>
      <div class="float"></div>
    </div>

    <div class="user-bar1">
      <div class="one">
        <div class="one-top" @click="list1go(0)">
          <div class="sp1">我的订单</div>
          <div class="sp0">
            <div class="sp2">查看全部订单</div>
            <div class="sp3"></div>
          </div>
        </div>
        <div class="one-bottom">
          <div v-for="(list,index) in datas.lists1" :key="index" class="mylist1" @click="list1go(index)">
            <img :src="list.url" class="img1" />
            <div style="font-size: 10px">{{list.name}}</div>
          </div>
        </div>
      </div>

      <div class="two">
        <div class="two-top">
          <div class="sp1">我的服务</div>
        </div>
        <div class="two-bottom">
          <div v-for="(list,index) in datas.lists2" :key="index" class="mylist2" @click="list2go(index)">
            <img :src="list.url" class="img2" />
            <div style="font-size: 10px">{{list.name}}</div>
          </div>
        </div>
      </div>

    </div>
    
  </div>  
</template>
<script>
import mydata from "./MyAll.json"
export default {
  data(){
    return {
      datas: mydata,
    }
  },
  methods: {
    uesrgo(){
      this.$router.push('/user')
    },
    list1go(index){
      this.$router.push(this.datas.lists1[index].href);
    }
    ,list2go(index){
      this.$router.push(this.datas.lists2[index].href);
    }
  }
}  
</script>
<style scoped>
#app {
  height: 667px;
  background: rgba(255, 255, 255, 0.329);
  /* background-image: url("http://localhost:8000/bg4.jpg"); */
}
.head-img{
  top:-15px;
  opacity: .15;
}
.user-bar{
  height: 11rem;
  background: rgba(22, 43, 112, 0.795);
  display: flex;
  align-items: center;
  padding: 0px 10px 0px;
}
.user-bar > .float{
  width: 20px;height: 20px;
  background-image: url(../../image/right.png);
  background-size: cover;
  margin-left: 9.8rem;
}
.user-bar> .left{
  width: 80px;height: 80px;
  border-radius: 50%;
  margin: 0px 10px 0px;
  background-image: url(../../image/tx3.jpg);
  background-size: cover;
}
.user-bar> .right{
  color: rgb(255, 255, 255);
}
/*
margin: 0px 0px 0px 0px;
padding: 0px 0px 0px 0px;
*/
.user-bar1{
  height: 23rem;
}
.user-bar1 > .one{
  height: 8rem;
  border-radius: 3px;
  margin: -20px 12px 0px;
  padding: 0px 0px 0px;
  background: rgba(255, 255, 255, 0.89);
  box-shadow: 1px 4px 12px 1px rgba(0, 0, 0, 0.521);
}
.user-bar1 > .one > .one-top{
  padding: 10px 10px;
  display: flex;
  justify-content: space-between;
  border-bottom: 1px solid #cdcdcd
}
.sp0{
  display: flex;
}
/* .sp1{}*/
.sp2{color: #52a2a3} 
.sp3{
  width: 20px;height: 20px;
  background-image: url(../../image/right.png);
  background-size: cover;
}
/**/
.one-bottom {
  box-sizing: border-box;
  width: 100%;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  margin-top: -10px;
  padding: 10px;
}
.mylist1 {
  box-sizing: border-box;
  width: 18%;
  text-align: center;
  border-radius: 5px;
}
.img1 {
  width: 40px;
  height: 40px;
  border-radius: 8px;
  margin-top: 13px;
}

/* 第二套 */
.user-bar1 >.two{
  height: 12.7rem;
  border-radius: 3px;
  margin: 15px 12px 0px;
  padding: 0px 0px 0px;
  background: rgba(255, 255, 255, 0.89);
  box-shadow: 1px 4px 12px 1px rgba(0, 0, 0, 0.521);
}
.user-bar1> .two> .two-top{
  padding: 10px 10px;
  display: flex;
  justify-content: space-between;
  border-bottom: 1px solid #cdcdcd
}
.two-bottom {
  box-sizing: border-box;
  width: 100%;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  margin-top: -10px;
  padding: 10px 0px;
}
.mylist2 {
  box-sizing: border-box;
  width: 24%;
  text-align: center;
  border-radius: 5px;
}
.img2 {
  width: 40px;
  height: 40px;
  border-radius: 8px;
  margin-top: 13px;
}
</style>
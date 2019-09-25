<template>
  <div id="app">
    <!-- 底部导航栏 -->
    <mt-tabbar v-model="selected" fixed class="mt-tabbar">
      <mt-tab-item id="首页" @click.native="changeState(0)">
        <tabbaricon
          :normalImage="require('../image/sy1.png')"
          :selectedImage="require('../image/sy2.png')"
          :focused="currentIndex1[0].isSelect"
        ></tabbaricon>首页
      </mt-tab-item>
      <mt-tab-item id="分类" @click.native="changeState(1)">
        <tabbaricon
          :normalImage="require('../image/fl1.png')"
          :selectedImage="require('../image/fl2.png')"
          :focused="currentIndex1[1].isSelect"
        ></tabbaricon>分类
      </mt-tab-item>
      <mt-tab-item id="购物车" @click.native="changeState(2)">
        <tabbaricon
          :normalImage="require('../image/gwc1.png')"
          :selectedImage="require('../image/gwc2.png')"
          :focused="currentIndex1[2].isSelect"
        ></tabbaricon>购物车
      </mt-tab-item>
      <mt-tab-item id="我的" @click.native="changeState(3)">
        <tabbaricon
          :normalImage="require('../image/wd1.png')"
          :selectedImage="require('../image/wd2.png')"
          :focused="currentIndex1[3].isSelect"
        ></tabbaricon>我的
      </mt-tab-item>
      <!-- <mt-tab-item id="详情">
      详情
    </mt-tab-item>
    <mt-tab-item id="购物车">购物车</mt-tab-item>
      <mt-tab-item id="我的">我的</mt-tab-item>-->
    </mt-tabbar>
    <!-- 子面板 -->
    <mt-tab-container v-model="selected">
      <mt-tab-container-item id="首页">
        <firstall></firstall>
      </mt-tab-container-item>

      <mt-tab-container-item id="分类">
        <classall></classall>
      </mt-tab-container-item>
        
      <mt-tab-container-item id="购物车">
        <cartall></cartall>
      </mt-tab-container-item>

      <mt-tab-container-item id="我的">
        <myall></myall>
      </mt-tab-container-item>
    </mt-tab-container>
  </div>
</template>
<script>
import TabBarIcon from "./iconpage/TabBarIcon.vue";
import FirstAll from "./firstpage/FirstAll.vue";
import ClassAll from "./classpage/ClassAll.vue";
import CartAll from "./cartpage/CartAll.vue";
import MyAll from "./mypage/MyAll.vue";
export default {
  components:{
    tabbaricon: TabBarIcon,
    firstall: FirstAll,
    classall: ClassAll,
    cartall: CartAll,
    myall: MyAll,
  },
  data() {
    return {
      currentIndex1: [
        { isSelect: false },
        { isSelect: true },
        { isSelect: false },
        { isSelect: false },
      ],
      // selected: "首页",
      selected: "分类",
      // selected: "购物车",
      // selected: "我的",
    }
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
    }
  }
}
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
.mt-tabbar{
  background: #ffffffb7;
  border-top: 1px solid #cdcdcd;
}


</style>

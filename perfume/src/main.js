import Vue from 'vue'
import App from './App.vue'
import router from './router'
//删除 line 5~ line 16
//1:引入第三方组件库 mint-ui
//1.1 完成引入所有组件
import MintUI from "mint-ui"
//1.2 单引入mint-ui样式文件
import "mint-ui/lib/style.css"
//1.3 将mint-ui 注册vue
Vue.use(MintUI)
//main.js 配置axios
//1.5:引入axios库
import axios from "axios"
//1.6:配置请求时保存session信息 
axios.defaults.withCredentials = true
//1.7:配置请求基础路径
axios.defaults.baseURL = "http://127.0.0.1:8080/"
//注意:地址栏请输必须!!!!!!!!!
//http://127.0.0.1:8080/!!!!
//如果地址  http://localhost 报错
//1.8:注册
Vue.prototype.axios = axios;


//功能:使用vuex保存共享数据
//1.9:引入第三方模块
import Vuex from "vuex"
//1.10:注册实例(先注册再创建存储对象)
Vue.use(Vuex)
//1.11:创建存储对象
const myStore = new Vuex.Store({
  state: { //集中管理数据属性
    count: 1
  },
  getters: {
    count: (state) => {return state.count}
  },
  //修改数据靠mutations属性
  mutations: {
    ctrlCount: (state) => {state.count++}
  },
  actions: {
    AsynCount: (context) => {
      setTimeout(()=>{
        context.commit('ctrlCount')
      },1500)
    }
  }
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store: myStore,
  components: { App },
  template: '<App/>'
})



<template>
  <div id="app">
    <!-- <router-link to="/TabBar" tag="button" replace active-class=active>首页</router-link> -->
    
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
* {margin:0;padding:0;}
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  margin:0;padding:0;
  width: 100%;
  font-size: 14px;
  box-sizing: border-box;
  position: relative;
  background-image: url("./image/bg1.jpg");
  background-position: top;
  background-size: contain;
  background-repeat: repeat;
  background-attachment: fixed;
  color: rgba(15, 15, 15, 0.849)
}

/* 轮播图下面点的样式 */
.mint-swipe {
  height: 100%;
  position: relative;
}
.mint-swipe-indicators {
  transform: translate(-50%, -100%) !important;
}

.mint-swipe-indicator {
  width: 10px;
  height: 4px;
  border-radius: 150px;
  opacity: 0.8;
  background: rgb(252, 250, 250);
}
.mint-swipe-indicator.is-active {
  background: rgb(226, 103, 103);
  width: 18px;
  height: 4px;
}
/* 标题公共样式 */
.my-bar{
  height: 50px;
  width: 100%;
  position: fixed;
  top: 0;
  left: 0;
	z-index: 10;
  font-family: "'Avenir', Helvetica, Arial, sans-serif";
  font-weight: bold;
}
.my-bar > img{
  position: absolute;
  top: 15px; left: 10px;
  width: 20px;height: 20px;
}
.my-title{
  text-align: center;
  line-height: 50px;
  font-size: 15px;
}
.placehold{
  width: 100%;height: 50px;
  z-index: -5;
}
@keyframes rotatefresh {
  0% {transform: translateX(0)}
  100% {transform: translateX(775px)}
}
.head-img{
  opacity: .5;
	position: fixed;
	top: 0;
	left: 0;
	width: 775px;
	height: 85px;
	animation: rotatefresh 12s infinite linear;
}
.head-img2{
	position: fixed;
	left: -775px;
}
.head-img3{
	left: -150px;
	height: 90px;
	animation: rotatefresh 8s infinite linear;
}
.head-img4{
	left: -925px;
	height: 90px;
	animation: rotatefresh 8s infinite linear;
}
.head-img5{
	left: -300px;
	height: 85px;
	animation: rotatefresh 4s infinite linear;
}
.head-img6{
	left: -1075px;
	height: 85px;
	animation: rotatefresh 4s infinite linear;
}
</style>

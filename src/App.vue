<template>
  <div id="app">
      <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: 'App' // 在进行虚拟dom对比的时候能快速查找，提高性能
}
</script>

<style lang="scss" scoped>
#app{
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  width:100%;
  height:100%;
}
body{
  margin:0;
  padding:0;
}
</style>

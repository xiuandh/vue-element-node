<template>
  <el-container style="height: 500px; border: 1px solid #eee">

    <el-header>
         <el-col :span="20" class="logo">
            <img src="@/assets/logo.png" /><span>商品管理<i class="txt">系统</i></span>
        </el-col>
        <el-col :span="4" class="userinfo">
            <el-dropdown>
                <i class="el-icon-setting" style="margin-right: 15px"></i>
                <el-dropdown-menu slot="dropdown">
                    <el-dropdown-item>查看</el-dropdown-item>
                    <el-dropdown-item>新增</el-dropdown-item>
                    <el-dropdown-item>删除</el-dropdown-item>
                </el-dropdown-menu>
            </el-dropdown>
            <span>{{sysUserName}}</span>
        </el-col>
    </el-header>

    <el-container>
        <!-- 侧边导航 -->
        <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
                <el-menu>
                    <el-submenu v-bind:index="index+''" v-for="(item,index) in items" :key="index">
                        <template slot="title" ><i class="el-icon-setting"></i>{{item.title}}</template>
                        <el-menu-item-group v-for="(nav,idx) in item.navs" :key="idx">
                            <el-menu-item v-bind:index="index+'-'+idx" @click="routerGo(nav.to)">{{nav.title}}</el-menu-item>
                        </el-menu-item-group>
                    </el-submenu>
                </el-menu>
        </el-aside>
      
    <div class="amain">
        <keep-alive>
            <router-view></router-view>
        </keep-alive>
        
    </div>

  </el-container>
        <!-- <el-main>
        <el-table :data="tableData">
          <el-table-column prop="date" label="日期" width="140">
          </el-table-column>
          <el-table-column prop="name" label="姓名" width="120">
          </el-table-column>
          <el-table-column prop="address" label="地址">
          </el-table-column>
        </el-table>
      </el-main> -->
</el-container>

</template>
<script>
export default {
    data() {
      const item = {
        date: '2016-05-02',
        name: '王小虎',
        address: '上海市普陀区金沙江路 1518 弄'
      };
      return {
        tableData: Array(20).fill(item),
        sysUserName:'王小虎',
        items:[
            {
                title:'商品管理',
                navs:[
                {title:'商品管理',to:'classify'},
                {title:'商品列表',to:'classlist'},
                ]
            },
            {
                title:'用户管理',
                navs:[
                {title:'修改密码',to:'password'},
                {title:'资料修改',to:"data"},
                ]
            },
            {
                title:'交易管理',
                navs:[
                {title:'订单列表',to:'list'}
                ]
            }
        ],
      }
    },
    methods: {
        //退出登录
        logout: function () {
            var _this = this;
            this.$confirm('确认退出吗?', '提示', {
            //type: 'warning'
            }).then(() => {
            sessionStorage.removeItem('user');
            _this.$router.push('/login');
            }).catch(() => {
                
            }); 
        },
        //跳转路由
        routerGo(ad){
            console.log(ad)
            this.$router.push({name:ad})
        }
    }
}
</script>
<style lang="scss" scoped>
  .el-header {
    background-color: #B3C0D1;
    color: #333;
    line-height: 60px;
    .logo {
        font-size: 22px;
        img {
        width: 40px;
        float: left;
        margin: 10px 10px 10px 18px;
        }
        span{
            display: block;
            text-align: left;
        }
        .txt {
        color: #20a0ff
        }
    }
  }
  
  .el-aside {
    color: #333;
  }
</style>


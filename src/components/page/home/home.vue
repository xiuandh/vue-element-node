<template>
<div>
	<div class="container">
		<el-col :span="24" class="header" fixed>
		    <el-col :span="20" class="logo">
		     <img src="@/assets/logo.png" /><span>学校管理<i class="txt">系统</i></span>
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
		</el-col>
		
		<el-col :span="6" class="main">
			<!-- 侧边栏 -->
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

			<!-- 中心表格部分内容 -->
			<!-- <app-main></app-main> -->
			<!-- <router-view></router-view> -->

		</el-col>
	</div>
	<!-- <div class=amain>
		<el-main>
	<el-table :data="tableData">
		<el-table-column prop="date" label="日期" width="140">
		</el-table-column>
		<el-table-column prop="name" label="姓名" width="120">
		</el-table-column>
		<el-table-column prop="address" label="地址">
		</el-table-column>
	</el-table>
	</el-main>
	</div> -->
</div>
</template>

<script>
// import main from '@/components/page/home/main'
   export default{
	//    components: {
		//    AppMain: main
	//    },
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
						{title:'商品管理',to:'goodsmanager'},
						{title:'商品列表',to:'goodslist'},
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
		methods:{
			onSubmit() {
				console.log('submit!');
			},
			handleopen() {
				console.log('handleopen');
			},
			handleclose() {
				console.log('handleclose');
			},
			handleselect: function (a, b) {
			},
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
<style scoped lang="scss">
.container {
	position: absolute;
	top: 0px;
	bottom: 0px;
	width: 100%;
	.header {
		height: 60px;
		line-height: 60px;
		background: #1F2D3D;
		color: #c0ccda;
		.userinfo {
				text-align: right;
				.userinfo-inner {
				color: #c0ccda;
				cursor: pointer;
				img {
				width: 40px;
				height: 40px;
				border-radius: 20px;
				margin: 10px 0px 10px 10px;
				float: right;
				}
			}
			span{
				padding-right:10px;
			}
		}
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
	.main {
		background: #324057;
		position: absolute;
		top: 60px;
		bottom: 0px;
		
	.content-container {
		background: #f1f2f7;
		position: absolute;
		right: 0px;
		top: 0px;
		bottom: 0px;
		left: 230px;
		overflow-y: scroll;
		padding: 20px;
		.breadcrumb-container {
			margin-bottom: 15px;
			.title {
				width: 200px;
				float: left;
				color: #475669;
			}
			.breadcrumb-inner {
				float: right;
			}
       }
	   .content-wrapper {
			background-color: #fff;
			box-sizing: border-box;
	    }
     }
   }
}
</style>

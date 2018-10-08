<template>
    <div class="classify">
        <!-- 面包屑列表 -->
        <el-breadcrumb separator="/" >
            <el-breadcrumb-item :to="{ path: '/home' }">主页</el-breadcrumb-item>
            <el-breadcrumb-item><a href="/">商品管理</a></el-breadcrumb-item>
            <el-breadcrumb-item>商品列表</el-breadcrumb-item>
        </el-breadcrumb>

        <div class="btns">
            <el-button type="danger" size="small" @click="addClass">添加</el-button>
        </div>

        <!-- 表格 -->
        <el-table :data="tableData3" border style="width: 100%;text-align:center;"> 
            <el-table-column prop="id" label="序列号"> </el-table-column>
            <el-table-column prop="name" label="姓名"> </el-table-column>
            <el-table-column  label="操作">
                <template slot-scope="scope">
                    <el-button type="danger" icon="el-icon-delete" class="minis" @click="removeClass($event)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
export default {
    data () {
        return {
            tableData3:[]
        }
    },
    methods: {
        addClass() {

        },
        removeClass(e) {
            console.log(e.target);
        }
    },
    created() {
        this.$axios.get("/api/classlist").then(res=>{
            this.tableData3 = res.data;
            console.log(res);
            console.log(this.tableData3);
        })
    }
}
</script>
<style lang="scss" scoped>
.classify{
    .el-breadcrumb{
        margin:10px;
    }
}

</style>



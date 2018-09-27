<template>
    <div class="classify">
        <!-- 面包屑列表 -->
        <el-breadcrumb separator="/" >
            <el-breadcrumb-item :to="{ path: '/home' }">主页</el-breadcrumb-item>
            <el-breadcrumb-item><a href="/">商品管理</a></el-breadcrumb-item>
            <el-breadcrumb-item>商品列表</el-breadcrumb-item>
        </el-breadcrumb>

        <div class="btns">
            <el-button type="danger" size="small">添加</el-button>
        </div>

        <!-- 表格 -->
        <el-table :data="tableData3" border style="width: 100%;text-align:center;"> 
            <el-table-column prop="date" label="日期"> </el-table-column>
            <el-table-column prop="name" label="姓名"> </el-table-column>
            <el-table-column prop="address" label="地址"> </el-table-column>
            <el-table-column  label="操作">
                <template slot-scope="scope">
                    <el-button type="primary" icon="el-icon-edit" class="minis">编辑</el-button>
                    <el-button type="danger" icon="el-icon-delete" class="minis">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
export default {
    data () {
        const news = {
            date: '2016-05-02',
            name: '王小虎',
            address: '上海市普陀区金沙江路 1518 弄'
        };
        return {
            tableData3: Array(10).fill(news)
        }
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



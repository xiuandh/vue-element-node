<template>
    <div class="amain">
        <!-- height="250"头部固定 -->
        <el-table :data="tableData3" height="400" border style="width: 100%">
            <el-table-column prop="date" label="日期">
                
            </el-table-column>
            <el-table-column prop="date" label="日期">

            </el-table-column>
            <el-table-column prop="date" label="日期">

            </el-table-column>
            <el-table-column prop="date" label="日期">

            </el-table-column>
            <el-table-column prop="date" label="日期">

            </el-table-column>
            <!-- fixed="right" 右边固定-->
            <el-table-column  label="操作">
                <template slot-scope="scope">
                     <el-button type="primary" icon="el-icon-edit" size="small">编辑</el-button>
                      <el-button type="danger" icon="el-icon-delete" size="small">删除</el-button>
                    <!-- <el-button @click="handleClick(scope.row)" type="text" size="small">查看</el-button> -->
                    <!-- <el-button type="text" size="small">编辑</el-button> -->
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
.amain{
    margin-left:230px;
    padding:0 50px;
}
</style>



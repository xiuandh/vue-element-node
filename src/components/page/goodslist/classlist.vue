<template>
    <div class="classlist">
        
        <el-form :inline="true" :model="formInline" class="demo-form-inline">
            <el-form-item label="关键字">
                <el-input size="small" v-model="formInline.user" placeholder="请输入商品名称"></el-input>
            </el-form-item>
            <el-form-item label="商品分类">
                <el-select size="small" v-model="formInline.region" placeholder="请选择分类">
                <el-option label="食物" value="food"></el-option>
                <el-option label="历史" value="history"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" icon="el-icon-search" size="small"></el-button>
            </el-form-item>
            
        </el-form>
        <!-- 删除添加按钮 -->
        <div class="btns">
            <el-button type="primary" size="mini">删除</el-button>
            <el-button type="primary" size="mini">添加</el-button>
        </div>

        <!-- 表格 -->
        <el-table :data="tableData3" height="400" border style="width: 100%;text-align:center">
            <el-table-column prop="" type="selection" :indeterminate="isIndeterminate" v-model="checkAll" @change="handleCheckAllChange"></el-table-column>
            <el-table-column prop="date" label="ID"></el-table-column>
            <el-table-column prop="date" label="商品分类"></el-table-column>
            <el-table-column prop="name" label="商品名称"></el-table-column>
            <el-table-column prop="address" label="价格"></el-table-column>
            <el-table-column prop="address" label="上新时间"></el-table-column>

            <el-table-column  label="发布状态">
                <template slot-scope="scope">
                    <el-button type="primary" icon="el-icon-edit" class="minis">已发布</el-button>
                </template>
            </el-table-column>

            <!-- fixed="right" 右边固定-->
            <el-table-column  label="操作"  width="160">
                <template slot-scope="scope">
                    <el-button type="primary" icon="el-icon-edit" class="minis" @click="handleEdit()">编辑</el-button>
                    <el-button type="danger" icon="el-icon-delete" class="minis">删除</el-button>
                </template>
            </el-table-column>
        </el-table>

        <!-- 弹出框内容 -->
        <el-dialog title="商品的修改" v-model="dialogFormVisible">
            <el-form :model="selectTable">
                <el-form-item label="价格" label-width="100px">
                    <el-input v-model="selectTable.name" auto-complete="off"></el-input>
                </el-form-item>
                <!-- <el-form-item label="详细地址" label-width="100px">
                    <el-autocomplete
                        v-model="address.address"
                        :fetch-suggestions="querySearchAsync"
                        placeholder="请输入地址"
                        style="width: 100%;"
                        @select="addressSelect"
                    ></el-autocomplete>
                    <span>当前城市：{{city.name}}</span>
                </el-form-item> -->
                <el-form-item label="商品名称" label-width="100px">
                    <el-input v-model="selectTable.phone"></el-input>
                </el-form-item>
                <el-form-item label="商品分类" label-width="100px">
                    <el-cascader
                        :options="categoryOptions"
                        v-model="selectedCategory"
                        change-on-select
                    ></el-cascader>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取 消</el-button>
                <el-button type="primary" @click="updateGood">确 定</el-button>
            </div>
            </el-dialog>

        <!-- 分页 -->
         <div class="block">
            <el-pagination
                @size-change="handleSizeChange"
                @current-change="handleCurrentChange"
                :current-page="currentPage4"
                :page-sizes="[5, 8, 10, 15]"
                :page-size="pageCount"
                layout="total, sizes, prev, pager, next, jumper"
                :total="totalPage">
            </el-pagination>
        </div>
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
            tableData3: Array(10).fill(news),
            formInline:{
                region:'',
                user:''
            },
            // 分页
            currentPage4: 2,
            totalPage: 30,
            pageCount: 5,
            //弹窗
            selectTable: {},
            dialogFormVisible: false,
            categoryOptions: [],
            selectedCategory: [],
            //复选框
            checked:false,
            checkAll: false,
            isIndeterminate: true,
            //表格数据
            goodlist:[]
        }
    },
    methods: {
        //分页中的方法
        handleSizeChange(val) {
            console.log(`每页 ${val} 条`);
        },
        handleCurrentChange(val) {
            this.currentPage4 = val
            // console.log(this.currentPage4);
            // console.log(`当前页: ${val}`);
        },
        handleEdit(){
            this.dialogFormVisible = true
        },
        //弹窗中按钮的方法
        updateGood(){
            console.log('官网案例使用sync？')
        },
        handleCheckAllChange() {
            //计算行中勾选是否相同，val为点击所带的参数
            // this.checkedCities = val ? cityOptions : [];
            this.isIndeterminate = false;
        },
        getData(){
            let start=this.currentPage4;
            let count=this.pageCount;
            console.log(start)
            this.$axios.get("/api/goods",{
                params : {
                    start:start,
                    count:count
                }
            }).then(res=>{
                console.log(res.data)
                return this.goodlist = res.data;
            })
        }
    },
    created(){
        this.$axios.get("/api/goods").then(res=>{
            this.totalPage = res.data.length;
        }),
        this.getData();
    }
}
</script>
<style lang="scss" scoped>

</style>




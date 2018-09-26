<template>
    <div class="pass">
        <el-form class="el-col-18">
            <el-form-item label="当前密码">
                <el-input v-model="formLabelAlign.pass1"></el-input>
            </el-form-item>
            <el-form-item label="新密码">
                <el-input v-model="formLabelAlign.pass2"></el-input>
                <span >6到16个字符</span>
            </el-form-item>
            <el-form-item label="确认密码">
                <el-input v-model="formLabelAlign.pass3"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary">确认修改</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>
<script>
export default {
    data () {
        return {
            formLabelAlign:{
                pass1:'',
                pass2:'',
                pass3:''
            }
        }
    },
    methods: {
        
    }
}
</script>


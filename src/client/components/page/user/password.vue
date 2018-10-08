<template>
    <div class="password">
        <el-form class="el-col-14 form"  v-model="labelPosition" :model="ruleForm3" ref="ruleForm3" status-icon :rules="rules3" label-width='100px'>
            <el-form-item label="当前密码" prop="currentPass">
                <el-input v-model="ruleForm3.currentPass" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="新密码" prop="newPass">
                <el-input v-model="ruleForm3.newPass" autocomplete="off"></el-input>
                <span class="span">6到16个字符</span>
            </el-form-item>
            <el-form-item label="确认密码" prop="confirmPass">
                <el-input v-model="ruleForm3.confirmPass" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="confirmchange('ruleForm3')">确认修改</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>
<script>
export default {
    data() {
        // 密码为长度6-10长的不包含空格的字段
        var validateNewPass = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入密码'));
            } else if(!/^\S{6,10}$/.test(value)) {
                callback(new Error('输入的密码格式不对'));
            } else {
                if(this.ruleForm3.confirmPass !== ''){
                    this.$refs.ruleForm3.validateField('validateConfirmPass');
                }
                callback();
            }
        }
        var validateConfirmPass = (rule, value, callback) => {
            if (value === '') {
            callback(new Error('请再次输入密码'));
            } else if (value !== this.ruleForm3.newPass) {
            callback(new Error('两次输入密码不一致!'));
            } else {
            callback();
            }
        }
        return {
            ruleForm3: {
                currentPass: '',
                newPass: '',
                confirmPass: ''
            },
            labelPosition:'right',
            rules3: {
                currentPass: [
                    {  trigger: 'blur' }
                ],
                newPass: [
                    // validator自定义方法表单验证
                    { validator: validateNewPass, trigger: 'blur' }
                ],
                confirmPass: [
                    { validator: validateConfirmPass, trigger: 'blur' }
                ],
            }
        };
    },
    methods: {
        // 确认修改密码
        confirmchange (formName) {
            this.$refs[formName].validate((valid) => {
                if (valid) {
                    alert('submit!');
                } else {
                    console.log('error submit!!');
                    return false;
                }
            });
        }
    }
}
</script>
<style lang="scss" scoped>
.el-input{
    width:76%;
}
</style>



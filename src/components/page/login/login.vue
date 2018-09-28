<template>
    <div class="login">
        <el-form :model="ruleForm2" status-icon :rules="rules2" ref="ruleForm2" label-width="100px" class="demo-ruleForm el-col-18">
            <div class="logo">
                <img src="@/assets/logo.png" />
                <span>学校管理<i class="txt">系统</i></span>
            </div>
            <el-form-item label="" prop="user">
                <el-input type="text" prefix-icon="el-icon-view" v-model="ruleForm2.user" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="" prop="pass">
                <div class="icon"><i class="el-icon-view" style="font-size:16px;"></i></div>
                <el-input type="password" prefix-icon="el-icon-view" v-model="ruleForm2.pass" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click.native.prevent="submitForm('ruleForm2')" >登录</el-button>
            </el-form-item>
            <el-form-item>
                <el-checkbox v-model="checked" class="checkbox">记住密码</el-checkbox>
                <a href="" class="forgetpass">忘记密码？</a>    
            </el-form-item>
            
        </el-form>
    </div>
</template>
<script>
export default {
    data() {
        // 密码为长度6-10长的不包含空格的字段
        var validatePass = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入密码'));
            } else if(!/^\S{6,10}$/.test(value)) {
                callback(new Error('输入的密码格式不对'));
            }else{
                callback();
            }
        }
        // 输入的用户名必须为字母开头不包含特殊字符的长度为6-10的字段
        var validateUser = (rule, value, callback)=>{
            if(value === '') {
                callback(new Error('请输入用户名'));
            }else if(!/^[a-z][\w\-]{5,9}$/.test(value)) {
                callback(new Error('输入的用户名格式不对'));
            }else{
                callback();
            }
        };
        return {
            ruleForm2: {
                pass: '',
                user: '',
            },
            checked:false,
            rules2: {
                user: [
                    { validator: validateUser, trigger: 'blur' }
                ],
                pass: [
                    { validator: validatePass, trigger: 'blur' }
                ],
            }
        };
    },
    methods: {
        submitForm(formName) {
            this.$refs[formName].validate((valid) => {
                this.$axios({
                    url:'/api/login',
                    method:'post',
                    data:(()=>{
                        let data ='';
                        for(let key in this.ruleForm2){
                            data += key + '=' + this.ruleForm2[key]+'&'
                        }
                        data = data.slice(0);
                        console.log(data);
                        return data;
                    })(),
                }).then(res=>{
                    if(res.data == 'success'){
                        alert('submit!');
                        this.$router.push({name:'home',params:{name:this.ruleForm2.user}})
                    }else if(res.data == 'error'){
                        alert('error submit')
                        return false;
                    }
                })
                
            });
        },
    }
  }
</script>
<style lang="scss" scoped>
.login{
    margin:0 auto;
    .logo {
        text-align:center;
        img{
            width:100px;
            margin-bottom: 20px;
        }
        span{
            display:block;
            text-align:center;
            margin-bottom: 20px;
        }
    }
    button{
        width:100%;
    }
    .checkbox{
        float:left;
    }
    .forgetpass{
        float:right;
    }
    .el-form-item__content{
        position: relative;
        .icon{
            position:absolute;
            border:1px solid #ddd;
            left:0;top:0;
            width:20px;
            height:20px;
        }
    }
}

</style>



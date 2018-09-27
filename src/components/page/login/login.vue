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
                <el-button type="primary" @click.native="submitForm('ruleForm2');goto()" >登录</el-button>
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
      var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        } else {
          if (this.ruleForm2.checkPass !== '') {
              //此是为了验证两个密码是否一样
            // this.$refs.ruleForm2.validateField('checkPass');
          }
          callback();
        }
      };
      return {
        ruleForm2: {
          pass: '',
          user: '',
        },
        checked:true,
        rules2: {
          pass: [
            { validator: validatePass, trigger: 'blur' }
          ],
        }
      };
    },
    methods: {
        submitForm(formName) {
            this.$refs[formName].validate((valid) => {
            if (valid) {
                alert('submit!');
            } else {
                console.log('error submit!!');
                return false;
            }
            });
        },
        goto() {
            //跳转路由顺便传参给home组件
            this.$router.push({name:'home',params:this.user})
        }
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



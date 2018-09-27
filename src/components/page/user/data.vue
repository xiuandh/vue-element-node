<template>
    <div class="data">
        <!-- <my-home></my-home> -->
        <el-form class="el-col-20 form" label-width="100px" v-model="labelPosition">
            <el-form-item label="我的角色" >
                <el-input v-model="formLabelAlign.name" :disabled="true" size="small"></el-input>
                <span>当前角色不可更改为其他角色</span>
            </el-form-item>
            <!-- 多选框 -->
                <!-- <el-select v-model="value2" placeholder="请选择">
                    <el-option disabled='true'></el-option>
                </el-select> -->
            <el-form-item label="用户名">
                <el-input v-model="formLabelAlign.region" :disabled="true"  size="small"></el-input>
                <span>不可修改，一般用于后台登入名</span>
            </el-form-item>
            <el-form-item label="昵称">
                <el-input v-model="formLabelAlign.type"  size="small"></el-input>
            </el-form-item>
            <el-form-item>
                <el-radio v-model="radio" label="1">男</el-radio>
                <el-radio v-model="radio" label="2">女</el-radio>
            </el-form-item>
            <el-form-item label="头像">
                <el-upload class="upload-demo" ref="upload" :action="action">
                    <el-input :value="action"></el-input>
                    
                </el-upload>
                <span class="span">
                    <el-button slot="trigger" size="small" type="primary"><i class="el-icon-upload el-icon--left"></i>上传图片</el-button>
                    <el-button style="margin-left: 10px;" size="small" type="success">查看图片</el-button>
                </span>
            </el-form-item>
            <el-form-item label="手机">
                <el-input type="tel" v-model="formLabelAlign.tel" size="small"></el-input>
            </el-form-item>
            <el-form-item label="邮箱">
                <el-input type="email" v-model="formLabelAlign.email"  size="small"></el-input>
            </el-form-item>
            <el-form-item label="备注" prop="desc">
                <el-input type="textarea" v-model="ruleForm.desc" autosize></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="submitForm('ruleForm')"  size="small">确认修改</el-button>
                <el-button @click="resetForm('ruleForm')"  size="small">重新修改</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>
<script>
export default {
    data () {
        return {
            labelPosition:'right',
            action:"https://jsonplaceholder.typicode.com/posts/",
            formLabelAlign:{
                name:'普通管理员',
                region:'',
                type:'',
                tel:'',
                email:''
            },
            value2:'',
            radio:'1',
            ruleForm: {
                desc: ''
            },
            rules: {
                desc: [
                    { required: true, message: '请填写活动形式', trigger: 'blur' }
                ]
            }
        }
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
      resetForm(formName) {
        this.$refs[formName].resetFields();
      }
    }
}
</script>
<style lang="scss" scoped>
.el-input{width:60%;}
.upload-demo{
    float:left;
}
.el-upload{text-align:left;width:200%;}
</style>



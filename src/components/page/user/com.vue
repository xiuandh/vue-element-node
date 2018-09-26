<template>
<div>
    <el-form label-position="left" label-width="80px" >
        <!-- 上传头像 源文件是：（我改为了动态）action="https://jsonplaceholder.typicode.com/posts/"-->
        <el-upload class="upload-demo" ref="upload" :action="action">
            <el-input :value="action"></el-input>
            <el-button slot="trigger" size="small" type="primary"><i class="el-icon-upload el-icon--left"></i>上传图片</el-button>
            <el-button style="margin-left: 10px;" size="small" type="success">查看图片</el-button>
        </el-upload>

        <el-form-item label="手机">
            <el-input type="tel" v-model="formLabelAlign.tel"></el-input>
        </el-form-item>
        <el-form-item label="邮箱">
            <el-input type="email" v-model="formLabelAlign.email"></el-input>
        </el-form-item>
        <el-form-item label="备注" prop="desc">
            <el-input type="textarea" v-model="ruleForm.desc"></el-input>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="submitForm('ruleForm')">确认修改</el-button>
            <el-button @click="resetForm('ruleForm')">重新修改</el-button>
        </el-form-item>
    </el-form>
</div>
</template>
<script>
export default {
     data() {
      return {
        action:"https://jsonplaceholder.typicode.com/posts/",
        formLabelAlign:{
            tel:'',
            email:''
        },
        ruleForm: {
          desc: ''
        },
        rules: {
          desc: [
            { required: true, message: '请填写活动形式', trigger: 'blur' }
          ]
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
      resetForm(formName) {
        this.$refs[formName].resetFields();
      }
    }
}
</script>


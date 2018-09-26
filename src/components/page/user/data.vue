<template>
    <div class="pass">
        <el-form>
            <el-form-item label="我的角色" >
                <el-input v-model="formLabelAlign.region"></el-input>
                <span>当前角色不可更改为其他角色</span>
            </el-form-item>
            <el-select v-model="value2" placeholder="请选择">
                <el-option disabled='true'></el-option>
            </el-select>
            <el-form-item label="用户名">
                <el-input v-model="formLabelAlign.region" disabled="true"></el-input>
                <span>不可修改，一般用于后台登入名</span>
            </el-form-item>
            <el-form-item label="昵称">
                <el-input v-model="formLabelAlign.type"></el-input>
            </el-form-item>
            <el-form-item>
                <el-radio v-model="radio" label="1">男</el-radio>
                <el-radio v-model="radio" label="2">女</el-radio>
            </el-form-item>
            <user-common></user-common>
        </el-form>
    </div>
</template>
<script>
export default {
    data () {
        return {
            formLabelAlign:{

            }
        }
    }
}
</script>


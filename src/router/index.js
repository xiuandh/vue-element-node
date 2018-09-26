import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)

import login from '@/components/page/login/login'
import home from '@/components/page/home/home'
import password from '@/components/page/user/password'
import data from '@/components/page/user/data'
import com from '@/components/page/user/com'

export default new Router({
  routes: [
    {
      path: '/',
      name: 'login',
      component: login
    },
    {
      path: '/home',
      name: 'home',
      component: home
    },
    {
      path: '/data',
      name: 'data',
      component: data
    },
    {
      path: '/password',
      name: 'password',
      component: password
    },
    {
      path: '/com',
      name: 'com',
      component: com
    },
  ]
})

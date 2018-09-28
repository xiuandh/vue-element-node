import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)

import login from '@/components/page/login/login'
import password from '@/components/page/user/password'
import data from '@/components/page/user/data'
import home from '@/components/common/home'
import classify from '@/components/page/goodslist/classify'
import classlist from '@/components/page/goodslist/classlist'

export default new Router({
  routes: [
    {
      path: '/',
      name: 'login',
      component: login,
      props:true
    },
    {
      path: '/home',
      name: 'home',
      component: home,
      props:true,
      children: [
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
          path: '/classify',
          name: 'classify',
          component: classify
        },
        {
          path: '/classlist',
          name: 'classlist',
          component: classlist
        },
      ]
    },
  ]
})

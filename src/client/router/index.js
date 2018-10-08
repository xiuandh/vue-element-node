import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)

import login from '@/client/components/page/login/login'
import password from '@/client/components/page/user/password'
import data from '@/client/components/page/user/data'
import home from '@/client/components/common/home'
import classify from '@/client/components/page/goodslist/classify'
import classlist from '@/client/components/page/goodslist/classlist'

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

import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)

import login from '@/components/page/login/login'
import password from '@/components/page/user/password'
import data from '@/components/page/user/data'
import home from '@/components/common/home'
import classify from '@/components/page/goodslist/classify'
import classlist from '@/components/page/goodslist/classlist'
// import home from '@/components/page/home/home'

export default new Router({
  routes: [
    {
      path: '/',
      name: 'login',
      component: login
    },
    // {
    //   path: '/test',
    //   name: 'test',
    //   component: test
    // },
    {
      path: '/home',
      name: 'home',
      component: home,
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

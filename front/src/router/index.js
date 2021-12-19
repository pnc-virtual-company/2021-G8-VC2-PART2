import Vue from 'vue'
import VueRouter from 'vue-router'

import MyProfileView from '../components/views/MyProfileView.vue'
Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'MyProfile',
    component: MyProfileView
  },
  {
    path: '/myProfile',
    name: 'MyProfile',
    component: MyProfileView
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router

import Vue from 'vue'
import VueRouter from 'vue-router'

import MyProfileView from '../components/views/MyProfileView.vue'
import SignIn from '../components/authentication/SignIn.vue'
import AdminView from '../components/views/AdminView.vue'

const routes = [
  {
    path: '/myprofile',
    name: 'MyProfile',
    component: MyProfileView
  },
  {
    path: "/signin",
    name: 'SignIn',
    component: SignIn
  },
  {
    path: "/adminview",
    name: 'AdminView',
    component: AdminView
  },
  {
    path: "/",
    redirect: "/signin"
  },
]

Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
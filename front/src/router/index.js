import Vue from 'vue'
import VueRouter from 'vue-router'

import MyProfileView from '../components/views/MyProfileView.vue'
import Signup from '../components/authentication/Signup.vue'

const routes = [
  {
    path: '/myProfile',
    name: 'MyProfile',
    component: MyProfileView
  },
  {
    path: "/signup",
    name: 'SignUp',
    component: Signup
  },
  {
    path: "/",
    redirect: "/signup"
  },
]

Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router

import Vue from 'vue'
import VueRouter from 'vue-router'
import Signup from '../components/authentication/Signup.vue'
Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: "/signup",
      component: Signup
    },
    {
      path: "/",
      redirect: "/signup"
    },
  ]
})

export default router
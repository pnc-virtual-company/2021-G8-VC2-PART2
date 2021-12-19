
import Vue from 'vue'
import VueRouter from 'vue-router'
import SignIn from '../components/authentication/SignIn.vue'
Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: "/signIn",
      component: SignIn
    },
    {
      path: "/",
      redirect: "/signIn"
    },
  ]
})

export default router
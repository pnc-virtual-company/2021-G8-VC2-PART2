import Vue from 'vue'
import VueRouter from 'vue-router'
import axios from "../axios-http.js";

import MyProfileView from '../components/views/MyProfileView.vue'
import SignIn from '../components/authentication/SignIn.vue'
import EroView from '../components/views/EroView.vue';
import ManageUserView from '../components/views/ManageUserView.vue'
import Event from '../components/views/EventView.vue'
import PageNotFound from '../components/views/PageNotFound.vue'
import Unauthorized from '../components/views/Unauthorized.vue'
const routes = [{
    path: "/",
    redirect: "/signin"
  },
  {
    path: "/signin",
    name: 'SignIn',
    component: SignIn
  },
  {
    path: '/myprofile',
    name: 'MyProfile',
    component: MyProfileView,
    meta: {
      'needLogin': true,
      'mustBeAlumni': true
    },
  },
  {
    path: "/eroview",
    name: 'EroView',
    component: EroView,
    meta: {
      'needLogin': true,
      'mustBeEro': true
    },
  },
  {
    path: "/manageuser",
    name: 'ManageUserView',
    component: ManageUserView,
    meta: {
      'needLogin': true,
      'mustBeEro': true
    },
  },
  {
    path: "/eventview",
    name: 'Event',
    component: Event,
    meta: {
      'needLogin': true
    },
  },
  {
    path: "/unauthorized",
    name: 'Unauthorized',
    component: Unauthorized
  },
  {
    path: "/:catchAll(.*)",
    name: 'PageNotFound',
    component: PageNotFound
  },
  // {
  //   path: "manageuser/:pathMatch(.*)",
  //   name: 'PageNotFound',
  //   component: PageNotFound
  // },
]

let authenticationGuard = (to, from, next) => {
  let needLogin = to.meta.needLogin;
  let userId = localStorage.getItem("userId");
  let isLoggedIn = userId !== null;

  if (needLogin) {
    if (!isLoggedIn) {
      next("/signin");
    } else {
      let mustBeAlumni = to.meta.mustBeAlumni;
      if (mustBeAlumni) {
        let userData = null;
        axios.get('users/' + userId)
          .then(res => {
            userData = res.data;
            if (userData.role === 'alumni') {
              next();
            } else {
              next("/unauthorized");
            }
          })
      } else {
        let mustBeEro = to.meta.mustBeEro;
        if (mustBeEro) {
          let userData = null;
          axios.get('users/' + userId)
            .then(res => {
              userData = res.data;
              if (userData.role === 'ero' || userData.role === 'admin') {
                next();
              } else {
                next("/unauthorized");
              }
            })
        } else {
          next();
        }
      }
    }
  } else {
    if (to.path === '/signin' && isLoggedIn) {
      let userData = null;
      axios.get('users/' + userId)
        .then(res => {
          userData = res.data;
          if (userData.role === 'ero' || userData.role === 'admin') {
            next("/eroview");
          } else {
            next("/myprofile");
          }
        })
    } else {
      next();
    }
  }
};

Vue.use(VueRouter)

const router = new VueRouter({
  base: process.env.BASE_URL,
  routes
})
router.beforeEach(authenticationGuard);

export default router
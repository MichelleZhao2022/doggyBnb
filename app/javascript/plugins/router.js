import { createRouter, createWebHistory } from 'vue-router'
import Accommodations from '../components/Accommodations.vue'
import AccommodationDetail from '../components/AccommodationDetail.vue'

const routes = [
  {path: '', name: 'home', component: Accommodations },
  {path: '/detail', name: 'detail', component: AccommodationDetail },
]

const router = createRouter({
  routes,
  history: createWebHistory()
})

export default router
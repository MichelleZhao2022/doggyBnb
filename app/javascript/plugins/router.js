import { createRouter, createWebHistory } from "vue-router";
import AccommodationIndex from "../views/api/accommodation/index.vue";
import AccommodationShow from "../views/api/accommodation/show.vue";

const routes = [
  { path: "/api/accommodations", name: "api_accommodations_path", component: AccommodationIndex },
  { path: "/api/accommodations/:id", name: "api_accommodation_path", component: AccommodationShow },
];

const router = createRouter({
  routes,
  history: createWebHistory(),
});

export default router;

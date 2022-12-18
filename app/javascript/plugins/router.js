import { createRouter, createWebHistory } from "vue-router";
import AccommodationIndex from "../views/api/accommodation/index.vue";
import AccommodationShow from "../views/api/accommodation/show.vue";
import Searchbar from "../views/components/Searchbar.vue";

const routes = [
  { path: "/", name: "home", component: Searchbar },
  { path: "/api/accommodations", name: "api_accommodations_path", component: AccommodationIndex },
  { path: "/api/accommodations/:id", name: "api_accommodation_path", component: AccommodationShow },
  // { path: "/api/search/:city?", name: "api_search_path", component: AccommodationIndex },
];

const router = createRouter({
  routes,
  history: createWebHistory(),
});

export default router;

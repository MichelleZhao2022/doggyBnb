import { createRouter, createWebHistory } from "vue-router";
import AccommodationIndex from "../views/accommodation/index.vue";
import AccommodationShow from "../views/accommodation/show.vue";
import Searchbar from "../views/components/Searchbar.vue";

const routes = [
  { path: "/", name: "home", component: Searchbar },
  { path: "/accommodations", name: "accommodations_path", component: AccommodationIndex },
  { path: "/accommodations/:id", name: "accommodation_path", component: AccommodationShow },
  // { path: "/api/search/:city?", name: "api_search_path", component: AccommodationIndex },
];

const router = createRouter({
  routes,
  history: createWebHistory(),
});

export default router;

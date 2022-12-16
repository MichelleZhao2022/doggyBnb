import { createRouter, createWebHistory } from "vue-router";
import AccommodationIndex from "../views/api/accommodation/index.vue";
import AccommodationShow from "../views/api/accommodation/show_example.vue";
import Searchbar from "../views/components/Searchbar.vue";

const routes = [
  { path: "/", name: "home", component: AccommodationIndex },
  { path: "/api/accommodations", name: "api_accommodations_path", component: AccommodationIndex },
  { path: "/api/accommodations/:id", name: "api_accommodation_path", component: AccommodationShow },
  // { path: "/api/search/:keyword", name: "api_search_index_path", component: AccommodationIndex },
];

const router = createRouter({
  routes,
  history: createWebHistory(),
});

export default router;

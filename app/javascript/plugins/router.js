import { createRouter, createWebHistory } from "vue-router";
import AccommodationIndex from "../views/accommodation/index.vue";
import AccommodationShow from "../views/accommodation/show.vue";

const routes = [
  { path: "/pages/index", name: "pages_index_path", component: AccommodationIndex },
  { path: "/pages/show/:id", name: "pages_show_path", component: AccommodationShow },
];

const router = createRouter({
  routes,
  history: createWebHistory(),
});

export default router;

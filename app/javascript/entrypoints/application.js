import { createApp } from "vue";
import App from "../views/App.vue";
import Router from '../plugins/router';
import AccommodationIndex from "../views/api/accommodation/index.vue";
import AccommodationShow from "../views/api/accommodation/show.vue";

// const app = createApp(App).use(Router).mount("#app")

const app2 = createApp(App);
app2.component('AccommodationIndex', AccommodationIndex); 
app2.component('AccommodationShow', AccommodationShow);
app2.use(Router);

app2.mount('#app');
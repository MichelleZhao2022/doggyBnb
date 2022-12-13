import { createApp } from "vue";
import App from "../views/App.vue";
import Router from '../plugins/router';
import AccommodationIndex from "../views/api/accommodation/index.vue";
// import AccommodationShow from "../views/api/accommodation/show.vue";

// const app = createApp(App).use(Router).mount("#app")

const app = createApp(App);
app.component('AccommodationIndex', AccommodationIndex); 
// app.component('AccommodationShow', AccommodationShow);
app.use(Router);

app.mount('#app');
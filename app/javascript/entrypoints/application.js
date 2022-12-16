import { createApp } from "vue";
import App from "../views/App.vue";
import Router from '../plugins/router';
import AccommodationIndex from "../views/api/accommodation/index.vue";
import 'v-calendar/dist/style.css';
import VCalendar from 'v-calendar';
import '../../assets/stylesheets/application.tailwind.css'

// const app = createApp(App).use(Router).mount("#app")

const app = createApp(App);
app.component('AccommodationIndex', AccommodationIndex);
app.use(Router);
app.use(VCalendar, {})

app.mount('#app');
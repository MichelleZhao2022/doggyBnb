import { createApp } from "vue";
import App from "../views/App.vue";
import Router from '../plugins/router';

const app = createApp(App).use(Router).mount("#app")
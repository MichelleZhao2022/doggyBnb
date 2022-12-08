import { createApp } from "vue";
import App from "../components/App.vue";
import Router from '../plugins/router';

const app = createApp(App).use(Router).mount("#app")
<template lang="">
  <div>
    <Accommodations :accommodations="accommodations"></Accommodations>

    <router-link :to="{name: 'home'}">Home</router-link>
    <router-link :to="{name: 'detail'}">Detail</router-link>
    <router-view></router-view>
  </div>
</template>
<script>
import axios from "axios";
import { reactive, toRefs } from "vue";
import Accommodations from './Accommodations.vue';
import { RouterView, RouterLink } from 'vue-router';

export default {
  components: {
    Accommodations
  },
  setup() {
    const state = reactive({accommodations: []})
    axios
      .get("/pages/home.json")
      .then((response) => {
        state.accommodations = response.data;
        console.log('response.data',response.data)
      })
    const { accommodations } = toRefs(state);
    return { accommodations };
  },
};
</script>
<style lang=""></style>

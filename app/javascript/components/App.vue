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

export default {
  components: {
    Accommodations
  },
  setup() {
    const state = reactive({accommodations: []})
    axios
      .get("/accommodations")
      .then((response) => {
        state.accommodations = response.data;
        console.log('response',response)
      })
    const { accommodations } = toRefs(state);
    return { accommodations };
  },
};
</script>
<style lang=""></style>

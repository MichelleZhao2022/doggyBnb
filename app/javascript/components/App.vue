<template lang="">
  <div>
    <Accommodations :accommodations="accommodations"></Accommodations>
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
      .get("/pages/home.json")
      .then((response) => {
        state.accommodations = response.data;
        console.log('response.data',response.data)
        console.log('response.data[0].default_image',response.data[0])
        console.log('state.accommodations',state.accommodations)
      })
    const { accommodations } = toRefs(state);
    return { accommodations };
  },
};
</script>
<style lang=""></style>

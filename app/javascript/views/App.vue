<template lang="">
  <div>
    <AccommodationIndex :accommodations="accommodations"></AccommodationIndex>
    <router-view></router-view>
  </div>
</template>
<script>
import axios from "axios";
import { reactive, toRefs } from "vue";
import AccommodationIndex from "./api/accommodation/index.vue";

export default {
  components: {
    AccommodationIndex,
  },
  setup() {
    const state = reactive({ accommodations: [] });
    axios
      .get("/api/accommodations.json", {
        header: {
          ACCEPT: "application/json",
        },
      })
      .then((response) => {
        state.accommodations = response.data;
        // console.log("response.data", response.data);
      });
    const { accommodations } = toRefs(state);
    return { accommodations };
  },
};
</script>
<style lang=""></style>

<template lang="">
  <div>
    <span>{{ accommodation.city }}</span><br />
    <span>{{ accommodation.country }}</span><br />
    <span>in detail page</span><br />
  </div>
</template>
<script>
import axios from "axios";
import { reactive, toRefs } from "vue";
import { useRoute } from "vue-router";
export default {
  setup() {
    const route = useRoute();
    const state = reactive({ accommodation: {} });
    axios
      .get("/api/accommodations/" + route.params.id + ".json", {
        header: {
          ACCEPT: "application/json",
        },
      })
      .then((response) => {
        state.accommodation = response.data;
        // console.log("response.data", response.data);
      });
    const { accommodation } = toRefs(state);
    console.log('accommodation',accommodation)
    return { accommodation };
  },
};
</script>
<style lang=""></style>

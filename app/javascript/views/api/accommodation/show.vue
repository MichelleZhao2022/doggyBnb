<template lang="">
  <div>
    <span>{{ accommodation.city }}</span
    ><br />
    <span>{{ accommodation.country }}</span
    ><br />
    <carousel :items-to-show="1.5">
      <slide v-for="slide in accommodation.images" :key="slide">
        <img :src="slide.image" />
      </slide>

      <template #addons>
        <navigation />
        <pagination />
      </template>
    </carousel>
  </div>
</template>
<script>
import axios from "axios";
import { reactive, toRefs } from "vue";
import { useRoute } from "vue-router";
import "vue3-carousel/dist/carousel.css";
import { Carousel, Slide, Pagination, Navigation } from "vue3-carousel";

export default {
  components: {
    Carousel,
    Slide,
    Pagination,
    Navigation,
  },
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
    console.log("accommodation", accommodation);
    return { accommodation };
  },
};
</script>
<style lang=""></style>

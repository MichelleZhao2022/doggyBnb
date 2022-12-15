<template lang="">
  <div class="pt-6">
    <div
      class="mx-auto flex max-w-2xl items-center space-x-2 px-4 sm:px-6 lg:max-w-7xl lg:px-8 mb-2"
    >
    <h1 class="text-3xl font-bold underline font-semibold text-4xl">{{ accommodation.name }}</h1>
    </div>
    <div
      class="mx-auto flex max-w-2xl flex justify-between items-center space-x-2 px-4 sm:px-6 lg:max-w-7xl lg:px-8"
    >
        <span>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 24 24"
            fill="currentColor"
            class="w-4 h-4 inline-block"
          >
            <path
              fill-rule="evenodd"
              d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z"
              clip-rule="evenodd"
            />
          </svg>
          {{ accommodation.average_rating }} {{ accommodation.reviews_count }}
        </span>
        <span>{{ accommodation.city }} {{ accommodation.country }} </span>
      
    </div>

    <!-- Image gallery -->
    <div class="mx-auto mt-6 max-w-2xl sm:px-6 lg:gap-x-8 lg:px-8">
      <div class="aspect-auto overflow-hidden rounded-lg lg:block">
        <carousel :items-to-show="1.5">
          <slide v-for="slide in 10" :key="slide">
            <!-- <img :src="slide" /> -->
            {{ slide }}
          </slide>

          <template #addons>
            <navigation />
            <pagination />
          </template>
        </carousel>
      </div>
    </div>

    <!-- <carousel :items-to-show="1.5">
      <slide v-for="slide in accommodation.images" :key="slide">
        <img :src="slide.image" />
      </slide>

      <template #addons>
        <navigation />
        <pagination />
      </template>
    </carousel> -->
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

<template lang="">
  <div class="container mx-auto">
    <div
      class="mx-auto max-w-2xl items-center space-x-2 px-4 sm:px-6 lg:max-w-7xl lg:px-8 mb-2"
    >
    <h1 class="font-bold text-4xl">{{ accommodation.name }}</h1>
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
        <span>{{ accommodation.city }}, {{ accommodation.country }} </span>
      
    </div>

    <!-- Image gallery -->
    <div class="mx-auto mt-6 max-w-2xl sm:px-6 lg:gap-x-8 lg:px-8">
      <div class="aspect-auto overflow-hidden rounded-lg lg:block">
        <carousel :items-to-show="1">
          <slide v-for="slide in accommodation.images" :key="slide">
            <img :src="slide.image" />
          </slide>

          <template #addons>
            <navigation />
            <pagination />
          </template>
        </carousel>
      </div>
    </div>

    <div class="rounded-md border border-gray-300 px-3 py-2 shadow-sm focus-within:border-indigo-600 focus-within:ring-1 focus-within:ring-indigo-600">
    <label for="name" class="block text-xs font-medium text-gray-900">Name</label>
    <input type="text" name="name" id="name" class="block w-full border-0 p-0 text-gray-900 placeholder-gray-500 focus:ring-0 sm:text-sm" placeholder="Jane Smith" />
      <v-date-picker color="red" is-range v-model="date" />
    
  </div>
    <!-- <v-calendar /> -->
   

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
import { ref, reactive, toRefs } from "vue";
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

    const date = ref("")
    console.log('picked date', date)
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
    return { accommodation, date };
  },
};
</script>
<style lang=""></style>

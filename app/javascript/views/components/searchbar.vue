<template lang="">
  <div class="container mx-auto py-8">
    <form @submit="search">
      <label for="city" class="block text-sm font-medium text-gray-700"
        >Search Accommodation</label
      >
      <div class="mt-1 flex rounded-md shadow-sm">
        <div class="relative flex flex-grow items-stretch focus-within:z-10">
          <div
            class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              stroke-width="1.5"
              stroke="currentColor"
              class="w-6 h-6"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z"
              />
            </svg>
          </div>
          <input
            type="city"
            name="city"
            id="city"
            v-model="city"
            class="block w-full rounded-none rounded-l-md border-gray-300 pl-10 focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
            placeholder="Auckland"
          />
        </div>
        <button
          type="submit"
          class="relative -ml-px inline-flex items-center space-x-2 rounded-r-md border border-gray-300 bg-gray-50 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-100 focus:border-indigo-500 focus:outline-none focus:ring-1 focus:ring-indigo-500"
        >
          <span>Search</span>
        </button>
      </div>
    </form>

    <AccommodationIndex
      v-if="accommodations.length"
      :accommodations="accommodations"
    ></AccommodationIndex>
  </div>
</template>
<script setup>
import axios from "axios";
import { ref, reactive, toRefs } from "vue";
import AccommodationIndex from "../api/accommodation/index.vue";

const state = reactive({ accommodations: {} });
const city = ref("");

const search = (e) => {
  e.preventDefault();
  axios("/api/search/" + city.value + ".json", {
    header: {
      ACCEPT: "application/json",
    },
  }).then((response) => {
    state.accommodations = response.data;
    console.log("response.data", response.data);
  });
};
const { accommodations } = toRefs(state);
console.log("search accommodations", accommodations);
</script>
<style lang=""></style>

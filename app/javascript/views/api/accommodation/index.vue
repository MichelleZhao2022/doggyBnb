<template lang="">
  <div class="container mx-auto py-8">
    <SearchBar></SearchBar>
    <ul
      role="list"
      class="grid grid-cols-1 gap-x-4 gap-y-8 sm:grid-cols-3 sm:gap-x-6 lg:grid-cols-5 xl:gap-x-8"
    >
      <li
        class="relative"
        v-for="accommodation in accommodations"
        :key="accommodation.id"
      >
        <div
          class="group aspect-w-10 aspect-h-7 block w-full overflow-hidden rounded-lg bg-gray-100 focus-within:ring-2 focus-within:ring-indigo-500 focus-within:ring-offset-2 focus-within:ring-offset-gray-100"
        >
          <img :src="accommodation.images[0].image" />
        </div>
        <router-link
          :to="{
            name: 'api_accommodation_path',
            params: { id: accommodation.id },
          }"
          >{{ accommodation.name }}</router-link
        >
        <p
          class="pointer-events-none mt-2 block truncate text-sm font-medium text-gray-900"
        >
          {{ accommodation.city }}, {{ accommodation.country }}
        </p>
        <p class="pointer-events-none block text-sm font-medium">
          <span class="text-black">{{ accommodation.price_cents }}</span> per
          day
        </p>
      </li>
    </ul>
  </div>
</template>
<script>
import axios from "axios";
import { reactive, toRefs } from "vue";
import SearchBar from "../../components/searchbar.vue";
export default {
  components: {
    SearchBar,
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
        console.log("index page accommodations", response.data);
      });
    const { accommodations } = toRefs(state);
    return { accommodations };
  },
};
</script>
<style lang=""></style>

<template lang="">
  <div class="container mx-auto py-8">
    <ul
      role="list"
      class="grid grid-cols-1 gap-x-4 gap-y-8 sm:grid-cols-3 sm:gap-x-6 lg:grid-cols-5 xl:gap-x-8"
    >
      <li
        class="relative"
        v-for="reservation in reservations"
        :key="reservations.id"
      >
        <div
          class="group aspect-w-10 aspect-h-7 block w-full overflow-hidden rounded-lg bg-gray-100 focus-within:ring-2 focus-within:ring-indigo-500 focus-within:ring-offset-2 focus-within:ring-offset-gray-100"
        >
           {{ reservations.reservation_date }}
        </div>
        <p
          class="pointer-events-none mt-2 block truncate text-sm font-medium text-gray-900"
        >
          {{ reservations.reservation_date }}
        </p>
      </li>
    </ul>
  </div>
</template>
<script>
import axios from "axios";
import { useRoute } from "vue-router";

export default {
  setup() {
    const route = useRoute();
    const state = reactive({ reservations: {} });
    axios
      .get("/api/accommodations/" + route.params.id + "reservations.json", {
        header: {
          ACCEPT: "application/json",
        },
      })
      .then((response) => {
        state.reservations = response.data;
        console.log("detail page accommodation", response.data);
      });
    const { reservations } = toRefs(state);
    return { reservations };
  },
};
</script>
<style lang=""></style>

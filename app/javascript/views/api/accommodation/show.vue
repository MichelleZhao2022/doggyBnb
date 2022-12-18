<template lang="">
<div class="bg-white">
    <div class="pt-6">

      <!-- Image gallery -->
      <div class="mx-auto mt-6 max-w-2xl sm:px-6 lg:grid lg:max-w-7xl lg:gap-x-8 lg:px-8">
        <div class="aspect-w-3 aspect-h-4 hidden overflow-hidden rounded-lg lg:block">
          <carousel :items-to-show="1" class="h-full w-full object-cover object-center">
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

      <!-- Product info -->
      <div class="mx-auto max-w-2xl px-4 pt-10 pb-16 sm:px-6 lg:grid lg:max-w-7xl lg:grid-cols-3 lg:grid-rows-[auto,auto,1fr] lg:gap-x-8 lg:px-8 lg:pt-16 lg:pb-24">
        <div class="lg:col-span-2 lg:border-gray-200 lg:pr-8">
          <h1 class="text-2xl font-bold tracking-tight text-gray-900 sm:text-3xl">{{ accommodation.name }}</h1>
        </div>

        <!-- Options -->
        <div class="mt-4 lg:row-span-3 lg:mt-0">
          <h2 class="sr-only">Product information</h2>
          <p class="text-3xl tracking-tight text-gray-900">$ {{ accommodation.price_cents }} day</p>

          <!-- Reviews -->
          <div class="mt-6">
            <h3 class="sr-only">Reviews</h3>
            <div class="flex items-center">
              <div class="flex items-center">
                <!-- <StarIcon v-for="rating in [0, 1, 2, 3, 4]" :key="rating" :class="[reviews.average > rating ? 'text-gray-900' : 'text-gray-200', 'h-5 w-5 flex-shrink-0']" aria-hidden="true" /> -->
              </div>
              <p class="sr-only">{{ reviews.average }} out of 5 stars</p>
              <a :href="reviews.href" class="ml-3 text-sm font-medium text-indigo-600 hover:text-indigo-500">{{ reviews.totalCount }} reviews</a>
            </div>
          </div>

          <form class="mt-10 lg:border-y">
            <div class="mt-8">
              <div class="flow-root">
                <ul role="list" class="-my-6 divide-y divide-gray-200">
                  <li class="flex py-6">
                    <div class="flex flex-1 flex-col">
                      <div class="flex flex-1 items-end justify-between text-sm">
                        <div class="lg:border-y rounded-md border border-gray-300 px-3 py-2 shadow-sm focus-within:border-indigo-600 focus-within:ring-1 focus-within:ring-indigo-600">
                          <label for="checkin" class="block text-xs font-medium text-gray-900">Check in</label>
                          <v-date-picker v-model="checkinDate">
                            <template v-slot="{ inputValue, inputEvents }">
                              <input
                                class="px-2 py-1 border rounded focus:outline-none focus:border-blue-300"
                                :value="inputValue"
                                v-on="inputEvents"
                              />
                            </template>
                          </v-date-picker>
                        </div>
                        <div class="lg:border-y rounded-md border border-gray-300 px-3 py-2 shadow-sm focus-within:border-indigo-600 focus-within:ring-1 focus-within:ring-indigo-600">
                          <label for="name" class="block text-xs font-medium text-gray-900">Check out</label>
                           <v-date-picker v-model="checkoutDate">
                            <template v-slot="{ inputValue, inputEvents }">
                              <input
                                class="px-2 py-1 border rounded focus:outline-none focus:border-blue-300"
                                :value="inputValue"
                                v-on="inputEvents"
                              />
                            </template>
                          </v-date-picker>
                        </div>
                      </div>
                    </div>
                  </li>

                   <li class="flex py-6">
                    <div class="ml-4 flex flex-1 flex-col">
                      <div>
                        <div class="flex justify-between text-base font-medium text-gray-900">
                          <h3>
                            <a href="#">{{ accommodation.name }}</a>
                          </h3>
                          <p class="ml-4">${{ accommodation.price_cents }}</p>
                        </div>
                      </div>
                    </div>
                  </li>

                  <li class="flex py-6">
                    <div class="ml-4 flex flex-1 flex-col">
                      <div>
                        <div class="flex justify-between text-base font-medium text-gray-900">
                          <h3>
                            <a href="#">{{ accommodation.name }}</a>
                          </h3>
                          <p class="ml-4">${{ accommodation.price_cents }}</p>
                        </div>
                      </div>
                    </div>
                  </li>

                </ul>
              </div>
            </div>

            <button type="submit" class="mt-10 flex w-full items-center justify-center rounded-md border border-transparent bg-indigo-600 py-3 px-8 text-base font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">Reserve</button>
          </form>
        </div>

        <div class="py-10 lg:col-span-2 lg:col-start-1 lg:border-gray-200 lg:pt-6 lg:pb-16 lg:pr-8">
          <!-- Description -->
          <div>
            <h3 class="sr-only">Description</h3>

            <div class="space-y-6">
              <p class="text-base text-gray-900">{{ accommodation.description }}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
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
    const reviews = { href: '#', average: 4, totalCount: 117 }
    const route = useRoute();
    const state = reactive({ accommodation: {} });

    const checkinDate = ref(new Date())
    const checkoutDate = ref(new Date())
    console.log('checkinDate', checkinDate)
    console.log('checkoutDate', checkoutDate)

    axios
      .get("/api/accommodations/" + route.params.id + ".json", {
        header: {
          ACCEPT: "application/json",
        },
      })
      .then((response) => {
        state.accommodation = response.data;
        console.log("detail page accommodation", response.data);
      });
    const { accommodation } = toRefs(state);
    return { accommodation, checkinDate, checkoutDate, reviews };
  },
};
</script>
<style lang=""></style>

<template lang="">
  <form @submit="confirmOrder" class="mt-6">
    <div class="mt-8 flow-root">
      <ul class="-my-6 divide-y divide-gray-200">
        <div class="py-2 flex-1 flex-col">
          <div class="flex-1 items-end justify-between text-sm">
            <div
              class="lg:border-y rounded-md border border-gray-300 px-3 py-2 shadow-sm focus-within:border-indigo-600 focus-within:ring-1 focus-within:ring-indigo-600"
            >
              <label
                for="checkin"
                class="block text-xs font-medium text-gray-900"
                >Check in</label
              >
              <v-date-picker v-model="checkinDate" class="flex flex-col">
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

        <div class="py-2 flex-1 flex-col">
          <div class="flex-1 items-end justify-between text-sm">
            <div
              class="lg:border-y rounded-md border border-gray-300 px-3 py-2 shadow-sm focus-within:border-indigo-600 focus-within:ring-1 focus-within:ring-indigo-600"
            >
              <label for="name" class="block text-xs font-medium text-gray-900"
                >Check out</label
              >
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

        <div class="py-2 flex flex-1 flex-col">
          <div class="flex justify-between text-base font-medium text-gray-900">
            <p>{{ accommodation.name }}</p>
            <p class="ml-4">${{ accommodation.price_cents }}</p>
          </div>
        </div>

        <div class="py-2 flex flex-1 flex-col border-t">
          <div class="flex justify-between text-base font-medium text-gray-900 border-gray-200 pt-5">
            <div class="flex flex-col flex-1">
              <label for="country" class="block text-sm font-medium text-gray-700">Country</label>
              <div class="mt-1 p-1 border rounded-md border-gray-300">
                <select id="country" name="country" autocomplete="country-name" class="w-full">
                  <option>United States</option>
                  <option>Canada</option>
                  <option>Mexico</option>
                </select>
              </div>
            </div>
          </div>
        </div>
         

        <div class="py-2 flex flex-1 flex-col">
          <div class="flex justify-between text-base font-medium text-gray-900 border-gray-200 pt-5">
            <div class="flex flex-col flex-1">
              <label for="first-name" class="block text-sm font-medium text-gray-700">First name</label>
              <div class="mt-1 p-1 border rounded-md border-gray-300">
                <input type="text" name="first-name" id="first-name" autocomplete="given-name" class="w-full" />
              </div>

              <label for="first-name" class="mt-4 block text-sm font-medium text-gray-700">Last name</label>
              <div class="mt-1 p-1 border rounded-md border-gray-300">
                <input type="text" name="first-name" id="first-name" autocomplete="given-name" class="w-full" />
              </div>

              <label for="first-name" class="mt-4 block text-sm font-medium text-gray-700">Street Address</label>
              <div class="mt-1 p-1 border rounded-md border-gray-300">
                <input type="text" name="first-name" id="first-name" autocomplete="given-name" class="w-full" />
              </div>

              <label for="first-name" class="mt-4 block text-sm font-medium text-gray-700">Phone number</label>
              <div class="mt-1 p-1 border rounded-md border-gray-300">
                <input type="text" name="first-name" id="first-name" autocomplete="given-name" class="w-full" />
              </div>

             

            </div>
          </div>
        </div>
      </ul>
    </div>

    <button
      type="submit"
      class="mt-10 flex w-full items-center justify-center rounded-md border border-transparent bg-indigo-600 py-3 px-8 text-base font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
    >
      Confirm Order
    </button>
  </form>
</template>
<script>
import { useRoute } from "vue-router";
import { ref, reactive, toRefs } from "vue";
export default {
  props: {
    accommodation: {
      type: Object,
      default: {},
    },
  },
  setup() {
    const route = useRoute();
    const checkinDate = ref(new Date());
    const checkoutDate = ref(new Date());

    const confirmOrder = () => {
      console.log("in confirmOrder");
      console.log("checkinDate", checkinDate.value);
      console.log("checkoutDate", checkoutDate.value);
      axios
        .get(
          "/api/accommodations/" + route.params.id + "/reservations/new",
          {
            params: {
              checkin_date: checkinDate.value,
              checkout_date: checkoutDate.value,
              subtotal: 95,
              total: 100,
            },
          },
          {
            header: {
              ACCEPT: "application/json",
            },
          }
        )
        .then((response) => {
          // state.accommodation = response.data;
          console.log("detail page accommodation", response.data);
        });
    };

    return { checkinDate, checkoutDate, confirmOrder };
  },
};
</script>
<style lang=""></style>

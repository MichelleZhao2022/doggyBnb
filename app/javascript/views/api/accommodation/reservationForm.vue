<template lang="">
  <form @submit="confirmOrder" class="mt-6">
    <div class="mt-8 flow-root">
      <ul class="-my-6 divide-gray-200">
        <div class="py-2 flex-1 flex-col">
          <div class="flex-1 items-end justify-between text-sm">
            <div
              class="rounded-md border border-gray-300 px-3 py-2 shadow-sm focus-within:border-indigo-600 focus-within:ring-1 focus-within:ring-indigo-600"
            >
              <label
                for="checkin"
                class="block text-xs font-medium text-gray-900"
                >Book in</label
              >
              <v-date-picker v-model="checkinDate" :min-date='new Date()' class="flex flex-col">
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

        <!-- <div class="py-2 flex-1 flex-col">
          <div class="flex-1 items-end justify-between text-sm">
            <div
              class="lg:border-y rounded-md border border-gray-300 px-3 py-2 shadow-sm focus-within:border-indigo-600 focus-within:ring-1 focus-within:ring-indigo-600"
            >
              <label for="checkout" class="block text-xs font-medium text-gray-900"
                >Check out</label
              >
              <v-date-picker v-model="checkoutDate" class="flex flex-col">
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
        </div> -->

        <div class="py-2 flex flex-1 flex-col border-t">
          <div class="flex justify-between text-base font-medium text-gray-900 border-gray-200 pt-5">
            <div class="flex flex-col flex-1">
              <label for="dogSize" class="block text-sm font-medium text-gray-700">Dog Size</label>
              <div class="mt-1 p-1 border rounded-md border-gray-300">
                <select v-model="dogSize" id="dogSize" autocomplete="dog-size" class="w-full">
                  <option :value="accommodation.dog_size">{{accommodation.dog_size}}</option>
                </select>
              </div>

              <label for="roomType" class="mt-4 block text-sm font-medium text-gray-700">Room Type</label>
              <div class="mt-1 p-1 border rounded-md border-gray-300">
                <select v-model="roomType" id="roomType" autocomplete="room-type" class="w-full">
                  <option :value="accommodation.room_type">{{accommodation.room_type}}</option>
                </select>
              </div>

              <label for="extraCare" class="mt-4 block text-sm font-medium text-gray-700">Extra Care</label>
              <div class="mt-1 p-1 border rounded-md border-gray-300">
                <select v-model="extraCare" id="extraCare" autocomplete="extra-care" class="w-full">
                  <option :value="accommodation.extra_care">{{accommodation.extra_care}}</option>
                </select>
              </div>
            </div>
          </div>
        </div>
         

        <!-- <div class="py-2 flex flex-1 flex-col">
          <div class="flex justify-between text-base font-medium text-gray-900">
            <p>total</p>
            <p class="ml-4">${{ accommodation.price_cents }}</p>
          </div>
        </div> -->

        <div class="py-2 flex flex-1 flex-col">
          <div class="flex justify-between text-base font-medium text-gray-900 border-gray-200 pt-5">
            <div class="flex flex-col flex-1">
              <label for="first-name" class="block text-sm font-medium text-gray-700">First name</label>
              <div class="mt-1 p-1 border rounded-md border-gray-300">
                <input v-model="firstName" type="text" name="first-name" id="first-name" class="w-full" />
              </div>

              <label for="last-name" class="mt-4 block text-sm font-medium text-gray-700">Last name</label>
              <div class="mt-1 p-1 border rounded-md border-gray-300">
                <input v-model="lastName" type="text" name="last-name" id="last-name" class="w-full" />
              </div>

              <label for="street-address" class="mt-4 block text-sm font-medium text-gray-700">Street Address</label>
              <div class="mt-1 p-1 border rounded-md border-gray-300">
                <input v-model="streetAddress" type="text" name="street-address" id="street-address" class="w-full" />
              </div>

              <label for="phone-number" class="mt-4 block text-sm font-medium text-gray-700">Phone number</label>
              <div class="mt-1 p-1 border rounded-md border-gray-300">
                <input v-model="phoneNumber" type="text" name="phone-number" id="phone-number" class="w-full" />
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
    const dogSize = ref({});
    const rootType = ref({});
    const extraCare = ref({});
    const firstName = ref('');
    const lastName = ref('');
    const streetAdrdess = ref('');
    const phoneNumber = ref('');

    const confirmOrder = () => {
      console.log("accommodation",accommodation );
      console.log("inputValue", inputValue);
      console.log("dogSize", dogSize);
      console.log("rootType", rootType);
      console.log("extraCare", extraCare);
      console.log("firstName", firstName);
      console.log("lastName", lastName);
      console.log("streetAdrdess", streetAdrdess);
      console.log("phoneNumber", phoneNumber);
      // axios
      //   .get(
      //     "/api/accommodations/" + route.params.id + "/reservations/new",
      //     {
      //       params: {
      //         checkin_date: checkinDate.value,
      //         checkout_date: checkoutDate.value,
      //         subtotal: 95,
      //         total: 100,
      //       },
      //     },
      //     {
      //       header: {
      //         ACCEPT: "application/json",
      //       },
      //     }
      //   )
      //   .then((response) => {
      //     console.log("detail page accommodation", response.data);
      //   });
    };

    return { checkinDate, checkoutDate, confirmOrder };
  },
};
</script>
<style lang=""></style>

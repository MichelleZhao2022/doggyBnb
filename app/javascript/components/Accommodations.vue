<template lang="">
  <div class="container mx-auto py-8">
  <ul role="list" class="grid grid-cols-1 gap-x-4 gap-y-8 sm:grid-cols-3 sm:gap-x-6 lg:grid-cols-5 xl:gap-x-8">
    <li class="relative" v-for="accommodation in accommodations" :key="accommodation.id">
      <div class="group aspect-w-10 aspect-h-7 block w-full overflow-hidden rounded-lg bg-gray-100 focus-within:ring-2 focus-within:ring-indigo-500 focus-within:ring-offset-2 focus-within:ring-offset-gray-100">
        <img :src="accommodation.image" /> 
      </div>
      <p class="pointer-events-none mt-2 block truncate text-sm font-medium text-gray-900">{{ accommodation.city }}, {{ accommodation.country }}</p>
      <p class="pointer-events-none block text-sm font-medium"><span class="text-black">{{ accommodation.price_cents }}</span> per day</p>
    </li>
  </ul>
  </div>
</template>
<script>
export default {
  props:['accommodations']
}
</script>
<style lang="">
    
</style>
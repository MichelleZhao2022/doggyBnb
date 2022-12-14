/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,ts,jsx,tsx}",
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/javascript/views/**/*',
    './app/views/**/*',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}

module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
  ],
  safelist: [
    'bg-yellow-100',
    'text-yellow-800',
    'bg-blue-100',
    'text-blue-800',
    'bg-indigo-100',
    'text-indigo-800'
  ],
  theme: {
    extend: {},
  },
  plugins: [require('@tailwindcss/typography')],

}

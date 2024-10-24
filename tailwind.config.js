/** @type {import('tailwindcss').Config} */
module.exports = {
    content: ['./app/**/*.{html,js}'],
    theme: {
        extend: {
            fontFamily: {
                sans: ["Geist", "Arial", "sans-serif"],
                mono: ["Geist Mono", "ui-monospace", "monospace"]
            }
        },
    },
    plugins: [],
    darkMode: 'selector'
}


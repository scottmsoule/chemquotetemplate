import { defineConfig } from 'vite';
import preact from '@preact/preset-vite';

export default defineConfig({
  plugins: [preact()],
  server: {
    watch: {
      usePolling: true,  // Enable polling for Docker environments
    },
    host: true, 
    strictPort: true,
    hmr: {
      host: 'localhost',  // Change this if you access from a different host
    },
  },
});

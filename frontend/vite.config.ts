import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  build: {
    rollupOptions: {
      output: {
        manualChunks: (id) => {
          // ── Core vendor chunks ─────────────────────────────────────────────
          if (id.includes('node_modules/react/') || id.includes('node_modules/react-dom/') || id.includes('node_modules/react-router-dom/')) {
            return 'react-vendor';
          }
          if (id.includes('node_modules/@tanstack/react-query')) {
            return 'query-vendor';
          }
          if (id.includes('node_modules/@supabase/')) {
            return 'supabase-vendor';
          }
          if (id.includes('node_modules/lucide-react') || id.includes('node_modules/react-hot-toast')) {
            return 'ui-vendor';
          }

          // ── Heavy library chunks — only downloaded when the feature is used ─
          if (id.includes('node_modules/reactflow') || id.includes('node_modules/@reactflow/')) {
            return 'reactflow-vendor'; // Only loaded on LearnPage when mindmap tab is opened
          }
          if (id.includes('node_modules/pdfjs-dist')) {
            return 'pdfjs-vendor'; // Only loaded on LearnPage when PDF upload is used
          }
          if (id.includes('node_modules/katex') || id.includes('node_modules/react-katex')) {
            return 'katex-vendor'; // Only loaded on pages with LaTeX math
          }
          // NOTE: leaflet / react-leaflet are intentionally NOT assigned a manual chunk.
          // NounCentersPage is lazy-loaded, so Rollup will naturally co-bundle leaflet
          // into that page's chunk. Giving leaflet its own chunk caused a cross-chunk
          // React.createContext() initialization ordering crash in production.

          // ── Admin code chunk — students NEVER download this ───────────────
          // All admin pages are in their own chunk, completely separate from
          // the student app. Only loads for admin-role users.
          if (id.includes('/pages/Admin')) {
            return 'admin-pages';
          }
        },
      },
    },
    // Increase limit slightly for the large vendor chunks (reactflow, pdfjs)
    chunkSizeWarningLimit: 1200,
    // esbuild minification is fast and produces compact output
    minify: 'esbuild',
  },
  // Pre-bundle critical deps to reduce dev cold start time
  optimizeDeps: {
    include: ['react', 'react-dom', 'react-router-dom', '@tanstack/react-query', '@supabase/supabase-js'],
  },
  esbuild: {
    // Remove console.logs and debugger statements in production builds
    drop: ['console', 'debugger'],
  },
})

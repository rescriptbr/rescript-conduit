import { defineConfig } from 'vite'
import reactRefresh from '@vitejs/plugin-react-refresh'
import svgrPlugin from 'vite-plugin-svgr'

export default defineConfig({
  plugins: [reactRefresh(), svgrPlugin()]
})

const chokidar = require('chokidar');
const esbuild = require('esbuild');
const http = require('http');
const path = require('path');
const rails = require('esbuild-rails');

const clients = [];
const entryPoints = ['application.js'];

const watchDirectories = [
  './app/assets/builds/**/*.css', // Wait for cssbundling changes
  './app/assets/stylesheets/*.css',
  './app/javascript/**/*',
  './app/views/**/*',
  './app/components/**/*',
];

const config = {
  absWorkingDir: path.join(process.cwd(), 'app/javascript'),
  bundle: true,
  entryPoints: entryPoints,
  outdir: path.join(process.cwd(), 'app/assets/builds'),
  plugins: [rails()],
  sourcemap: process.env.RAILS_ENV != 'production',
};

async function buildAndReload() {
  http
    .createServer((req, res) => {
      return clients.push(
        res.writeHead(200, {
          'Content-Type': 'text/event-stream',
          'Cache-Control': 'no-cache',
          'Access-Control-Allow-Origin': '*',
          Connection: 'keep-alive',
        }),
      );
    })
    .listen(8082);

  let result = await esbuild.build({
    ...config,
    incremental: true,
    banner: {
      js: '(() => new EventSource("http://localhost:8082").onmessage = () => location.reload())();',
    },
  });

  chokidar.watch(watchDirectories).on('all', (event, path) => {
    if (path.includes('javascript')) {
      result.rebuild();
    }

    clients.forEach((res) => res.write('data: update\n\n'));
    clients.length = 0;
  });
}

if (process.argv.includes('--reload')) {
  buildAndReload();
} else {
  const watch = process.argv.includes('--watch') && {
    onRebuild(error) {
      if (error) console.error('[watch] build failed', error);
      else console.log('[watch] build finished');
    },
  };
  esbuild
    .build({
      ...config,
      watch: watch,
      minify: process.env.RAILS_ENV == 'production',
    })
    .catch(() => process.exit(1));
}

# Turbo Cache Missing Output Files Reproduction Repo

This repository is a reproduction repo for a bug in Turborepo where it turbo misses caching some specific output files.

## Steps to reproduce

1. Clone this repository
2. Run `pnpm i` to install dependencies
3. Run `./reproduce-issue.sh` to reproduce the issue

## Expected behavior

The `turbo-cache` command should cache and recall all the output files in the `.next` directory.

## Actual behavior

The following differences can be seen between a build from scratch vs the files cached by turbo:
```
Only in output/cache-hit-build/standalone/node_modules/.pnpm/@swc+helpers@0.5.2/node_modules/@swc/helpers/_: _interop_require_
Only in output/cache-hit-build/standalone/node_modules/.pnpm/caniuse-lite@1.0.30001587/node_modules/caniuse-lite/data: feature
Only in output/cache-hit-build/standalone/node_modules/.pnpm/caniuse-lite@1.0.30001587/node_modules/caniuse-lite/dist: unpacke
Only in output/cache-hit-build/standalone/node_modules/.pnpm/next@14.1.0_react-dom@18.2.0_react@18.2.0/node_modules/@swc/helpers/_: _interop_require_
Only in output/cache-hit-build/standalone/node_modules/.pnpm/next@14.1.0_react-dom@18.2.0_react@18.2.0/node_modules/caniuse-lite/data: feature
Only in output/cache-hit-build/standalone/node_modules/.pnpm/next@14.1.0_react-dom@18.2.0_react@18.2.0/node_modules/caniuse-lite/dist: unpacke
```

## Full output

```bash
% ./reproduce-issue.sh   
Building the project with force flag
• Running build
• Remote caching disabled
build: cache bypass, force executing 958c26e08f0e277e
build: 
build: 
build: > turbo-cache-missing-outputs@0.1.0 build /Users/[redacted]/turbo-cache-missing-outputs
build: > next build
build: 
build:    ▲ Next.js 14.1.0
build: 
build:    Creating an optimized production build ...
build:  ✓ Compiled successfully
build:  ✓ Linting and checking validity of types 
build:  ✓ Collecting page data 
build:  ✓ Generating static pages (5/5) 
build:  ✓ Collecting build traces 
build:  ✓ Finalizing page optimization 
build: 
build: Route (app)                              Size     First Load JS
build: ┌ ○ /                                    5.13 kB        89.3 kB
build: └ ○ /_not-found                          885 B          85.1 kB
build: + First Load JS shared by all            84.2 kB
build:   ├ chunks/184-d3bb186aac44da98.js       28.9 kB
build:   ├ chunks/30b509c0-f3503c24f98f3936.js  53.4 kB
build:   └ other shared chunks (total)          1.87 kB
build: 
build: 
build: ○  (Static)  prerendered as static content
build: 
build: 

 Tasks:    1 successful, 1 total
Cached:    0 cached, 1 total
  Time:    15.044s 

Building the project from the cache
• Running build
• Remote caching disabled
build: cache hit, replaying logs 958c26e08f0e277e
build: 
build: 
build: > turbo-cache-missing-outputs@0.1.0 build /Users/[redacted]/turbo-cache-missing-outputs
build: > next build
build: 
build:    ▲ Next.js 14.1.0
build: 
build:    Creating an optimized production build ...
build:  ✓ Compiled successfully
build:  ✓ Linting and checking validity of types 
build:  ✓ Collecting page data 
build:  ✓ Generating static pages (5/5) 
build:  ✓ Collecting build traces 
build:  ✓ Finalizing page optimization 
build: 
build: Route (app)                              Size     First Load JS
build: ┌ ○ /                                    5.13 kB        89.3 kB
build: └ ○ /_not-found                          885 B          85.1 kB
build: + First Load JS shared by all            84.2 kB
build:   ├ chunks/184-d3bb186aac44da98.js       28.9 kB
build:   ├ chunks/30b509c0-f3503c24f98f3936.js  53.4 kB
build:   └ other shared chunks (total)          1.87 kB
build: 
build: 
build: ○  (Static)  prerendered as static content
build: 
build: 

 Tasks:    1 successful, 1 total
Cached:    1 cached, 1 total
  Time:    1.168s >>> FULL TURBO

Diffing the original force-build's .next directory with the cache-hit-build's .next directory
Only in output/cache-hit-build/standalone/node_modules/.pnpm/@swc+helpers@0.5.2/node_modules/@swc/helpers/_: _interop_require_
Only in output/cache-hit-build/standalone/node_modules/.pnpm/caniuse-lite@1.0.30001587/node_modules/caniuse-lite/data: feature
Only in output/cache-hit-build/standalone/node_modules/.pnpm/caniuse-lite@1.0.30001587/node_modules/caniuse-lite/dist: unpacke
Only in output/cache-hit-build/standalone/node_modules/.pnpm/next@14.1.0_react-dom@18.2.0_react@18.2.0/node_modules/@swc/helpers/_: _interop_require_
Only in output/cache-hit-build/standalone/node_modules/.pnpm/next@14.1.0_react-dom@18.2.0_react@18.2.0/node_modules/caniuse-lite/data: feature
Only in output/cache-hit-build/standalone/node_modules/.pnpm/next@14.1.0_react-dom@18.2.0_react@18.2.0/node_modules/caniuse-lite/dist: unpacke
```
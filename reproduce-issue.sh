#!/bin/bash

rm -rf output .next
mkdir output

echo "Building the project with force flag"
pnpm turbo build --force
mv .next output/force-build

echo "Building the project from the cache"
pnpm turbo build
mv .next output/cache-hit-build

echo "Diffing the original force-build's .next directory with the cache-hit-build's .next directory"
diff --brief --recursive output/force-build output/cache-hit-build

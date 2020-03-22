'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/main.dart.js": "c24999668cd78ee5db0b7aa92a7f4d9d",
"/index.html": "69d266ab818a7dd229b1cb2ed58b3dbf",
"/assets/fonts/Alata-Regular.ttf": "48d0dc5d8c3bd0d946fd6b3e39ad511a",
"/assets/FontManifest.json": "031f48e2d2d00673f58365a792950ea3",
"/assets/LICENSE": "85ef313aadf4cb0985ac5ef5dc140cc7",
"/assets/AssetManifest.json": "a069c7be3cc2e2b37fc8bbeea3463b38"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});

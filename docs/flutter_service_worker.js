'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/assets/AssetManifest.json": "a069c7be3cc2e2b37fc8bbeea3463b38",
"/assets/LICENSE": "1d6a4cf042e4492701c6333794ed5d71",
"/assets/fonts/Alata-Regular.ttf": "48d0dc5d8c3bd0d946fd6b3e39ad511a",
"/assets/FontManifest.json": "031f48e2d2d00673f58365a792950ea3",
"/main.dart.js": "1d6561fccc6f64e90afa570847ec1239",
"/NoSleep.min.js": "8f0b82464694b1e337bcadd504bdcf0c",
"/index.html": "72025b5c18c52a4ce47faf8f4262e10b"
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

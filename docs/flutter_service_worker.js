'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/assets/AssetManifest.json": "a069c7be3cc2e2b37fc8bbeea3463b38",
"/assets/LICENSE": "85ef313aadf4cb0985ac5ef5dc140cc7",
"/assets/fonts/Alata-Regular.ttf": "48d0dc5d8c3bd0d946fd6b3e39ad511a",
"/assets/FontManifest.json": "031f48e2d2d00673f58365a792950ea3",
"/main.dart.js": "b49b15f7cf951c29fac98cd854c755f2",
"/NoSleep.min.js": "8f0b82464694b1e337bcadd504bdcf0c",
"/index.html": "14bc72c249d765bae30775a95a994aaa"
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

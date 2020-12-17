---
layout: page
title: Search
permalink: /search/
---
<style>
    @import url('https://fonts.googleapis.com/css?family=Open+Sans');

.block
{
  /* margin: 0 auto; */
  max-width: 900px;
  /* padding: 0 30px;    */
}
.input-res
{
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  font: 15px/1 'Open Sans', sans-serif;
  color: #333;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  width: 100%;
  max-width: 500px;
  background-color: #ddd;
  border: none;
  padding: 10px 11px 11px 11px;
  border-radius: 3px;
  box-shadow: none;
  outline: none;
  margin: 0;
  box-sizing: border-box;
}

</style>
<!-- Html Elements for Search -->
<div id="search-container">
<div class="block"><input type="text" id="search" placeholder="Cari disini ..." class="input-res"></div>
<div id="results-container"></div>
</div>

<!-- Script pointing to search-script.js -->
<script src="https://unpkg.com/simple-jekyll-search@latest/dest/simple-jekyll-search.min.js"></script>

<!-- Configuration -->
<script>
SimpleJekyllSearch({
  searchInput: document.getElementById('search'),
  resultsContainer: document.getElementById('results-container'),
  searchResultTemplate: `<div class="article">
  <a class="clearlink" href="{url}">
    <h1>{title}</h1>
    <div class="a-content">
      <div class="a-content-text">
        <p>{description}</p>
      </div>
    </div>
  </a>
  <div class="read-more clearfix">
    <div class="more-left left">
      <a href="{url}">Read more</a>&nbsp;&nbsp;
    </div>
  </div>
</div>`,
  json: '/json/search.json'
})
</script>

---
layout: default
title: Kategori
permalink: /kategori
---

<section class="small-intro">
  <div class="container">
    <h2>
      All categories
    </h2>
  </div>
</section>
<section class="blog">
    {% for cat in site.categories %}
  <nav class="flex flex-wrap items-center">
        {% for inner in cat%} {% if forloop.first == true %}
          <a class="p-2" href="/categories/{{cat[0]}}">{{cat[0]}}</a></span>
        {% endif %} {% endfor %}
  </nav>
      {% endfor %}
</section>

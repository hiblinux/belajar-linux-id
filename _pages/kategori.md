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
<section class="">
  <nav class="flex flex-wrap items-center">
    {% for cat in site.categories %}
        {% for inner in cat%} {% if forloop.first == true %}
          <a class="text-dark" href="/categories/{{cat[0]}}">{{cat[0]}}</a> (<a class="p-2 text-dark" href="/categories/{{cat[0]}}">{{cat[0]}}</a>)
        {% endif %} {% endfor %}
      {% endfor %}
  </nav>
</section>

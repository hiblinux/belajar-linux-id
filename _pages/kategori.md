---
layout: default
title: Categories
permalink: /categories
---

<section>
  <div>
    <h2>
      All categories
    </h2>
  </div>
</section>
<section class="">
  <nav class="flex flex-wrap items-center">
    {% for cat in site.categories %}
        {% for inner in cat%} {% if forloop.first == true %}
          <a class="p-2 m-1 badge badge-pill badge-secondary" href="/categories/{{cat[0]}}">{{cat[0]}} ({{site.categories[inner].size}})</a>
        {% endif %} {% endfor %}
    {% endfor %}
  </nav>
</section>

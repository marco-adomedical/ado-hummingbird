<div id="_desktop_ps_searchbar" class="order-2 ms-auto col-auto d-none d-md-flex align-items-center">
  <div id="ps_searchbar" class="ps-searchbar js-search-widget" data-search-controller-url="{$search_controller_url}">
    <form class="ps-searchbar__form" method="get" action="{$search_controller_url}" role="search">
      <input type="hidden" name="controller" value="search">
      <i class="material-icons ps-searchbar__magnifier js-search-icon" aria-hidden="true">&#xE8B6;</i>
      <input class="js-search-input form-control ps-searchbar__input" type="text" name="s" value="{$search_string}"
        placeholder="{l s='Search products...' d='Shop.Theme.Catalog'}"
        aria-label="{l s='Search' d='Shop.Theme.Catalog'}" autocomplete="off" role="combobox" aria-haspopup="listbox"
        aria-autocomplete="list" aria-controls="ps_searchbar_results" aria-expanded="false">
      <button type="button" class="ps-searchbar__clear js-search-clear btn outline outline--rounded d-none"
        aria-label="{l s='Clear search' d='Shop.Theme.Catalog'}">
        <i class="material-icons">&#xE14C;</i>
      </button>
    </form>

    <div class="ps-searchbar__dropdown js-search-dropdown d-none" id="ps_searchbar_dropdown"
      aria-label="{l s='Search results' d='Shop.Theme.Catalog'}" tabindex="-1">
      <div class="ps-searchbar__results js-search-results" id="ps_searchbar_results" role="listbox" tabindex="-1"></div>
    </div>
  </div>
</div>

<template id="ps_searchbar_result" class="js-search-template">
  <a data-ps-ref="searchbar-result-link" class="ps-searchbar__result-link" id="" href="">
    <img src="" alt="" class="ps-searchbar__result-image">
    <p class="ps-searchbar__result-name"></p>
  </a>
</template>

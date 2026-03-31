{if count($languages) > 1}
  <div id="_desktop_ps_languageselector">
    <div class="ps-languageselector dropdown">
      <button class="ps-languageselector__toggle dropdown-toggle" type="button" data-bs-toggle="dropdown"
        aria-expanded="false" aria-label="{l s='Change language' d='Shop.Theme.Global'}">
        {$current_language.iso_code|upper}
      </button>

      <ul class="dropdown-menu dropdown-menu-end ps-languageselector__menu">
        {foreach from=$languages item=language}
          <li>
            <a class="dropdown-item ps-languageselector__item{if $language.id_lang == $current_language.id_lang} active{/if}"
              href="{url entity='language' id=$language.id_lang}" data-iso-code="{$language.iso_code|lower}"
              hreflang="{$language.language_code|default:$language.iso_code}"
              lang="{$language.language_code|default:$language.iso_code}">
              {$language.iso_code|upper}
            </a>
          </li>
        {/foreach}
      </ul>
    </div>
  </div>
{/if}

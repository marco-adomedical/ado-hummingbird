{*
  ===================================
  H: HEADER
  ===================================

  File base: Override di Hummingbird 2
  Motivo: header semplificato senza top bar e con trigger custom
  Obiettivo:
  - desktop: logo | search + link rapidi | actions
  - desktop large: menu principale su riga separata sotto l'header
  - tablet: burger sopra alle actions
  - mobile: logo | burger | ricerca | actions
  Nota:
  - lingua dentro displayHeaderActions
  - telefono rimosso dall'header
  - trigger menu e ricerca gestiti dal tpl, non dai moduli
*}

{$headerBanner = 'header-banner'}
{$headerMain = 'header-main'}
{$headerNavFullWidth = 'header-nav-full-width'}

{capture name="header_banner"}{hook h='displayBanner'}{/capture}
{capture name="header_top"}{hook h='displayTop'}{/capture}
{capture name="header_top_links"}{hook h='displayHeaderSearchLinks'}{/capture}
{capture name="nav_full_width"}{hook h='displayNavFullWidth'}{/capture}

{block name='header_banner'}
  {if !empty($smarty.capture.header_banner)}
    <div class="{$headerBanner}">
      {$smarty.capture.header_banner nofilter}
    </div>
  {/if}
{/block}

{block name='header_bottom'}

  {* ===================================
     H: DESKTOP / TABLET
     =================================== *}
  <div class="{$headerMain} d-none d-md-block">
    <div class="container-md">
      <div class="row align-items-center my-4 g-3">
        <div class="col-md-3">
          <div class="{$headerMain}__logo d-flex align-items-center h-100">
            {if $shop.logo_details}
              {if $page.page_name == 'index'}
                <h1 class="{$headerMain}__h1 mb-0">
                {/if}
                {renderLogo}
                {if $page.page_name == 'index'}
                </h1>
              {/if}
            {/if}
          </div>
        </div>

        <div class="col-md-6 d-flex flex-column justify-content-center">
          <div class="{$headerMain}__search">
            {$smarty.capture.header_top nofilter}
          </div>

          {if !empty($smarty.capture.header_top_links)}
            <div class="{$headerMain}__search-links">
              {$smarty.capture.header_top_links nofilter}
            </div>
          {/if}
        </div>

        <div class="col-md-3">
          <div class="{$headerMain}__actions">
            <div class="{$headerMain}__actions-menu d-xl-none">
              <button class="header-action-icon header-action-icon--menu" type="button" data-bs-toggle="offcanvas"
                data-bs-target="#mobileMenu" aria-controls="mobileMenu"
                aria-label="{l s='Open menu' d='Shop.Theme.Actions'}">
                <span class="material-icons" aria-hidden="true">&#xE5D2;</span>
              </button>
            </div>

            <div class="{$headerMain}__actions-links">
              {hook h='displayHeaderActions'}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  {* ===================================
     H: MOBILE
     =================================== *}
  <div class="{$headerMain} d-md-none">
    <div class="container-md">
      <div class="row align-items-center my-3 g-2 flex-nowrap">
        <div class="col min-w-0">
          <div class="{$headerMain}__logo">
            {if $shop.logo_details}
              {if $page.page_name == 'index'}
                <h1 class="{$headerMain}__h1 mb-0">
                {/if}
                {renderLogo}
                {if $page.page_name == 'index'}
                </h1>
              {/if}
            {/if}
          </div>
        </div>

        <div class="col-auto">
          <div class="{$headerMain}__mobile-tools d-flex align-items-center justify-content-end">
            <button class="header-action-icon header-action-icon--menu" type="button" data-bs-toggle="offcanvas"
              data-bs-target="#mobileMenu" aria-controls="mobileMenu"
              aria-label="{l s='Open menu' d='Shop.Theme.Actions'}">
              <span class="material-icons" aria-hidden="true">&#xE5D2;</span>
            </button>

            <button class="header-action-icon header-action-icon--search" type="button" data-bs-toggle="offcanvas"
              data-bs-target="#adoSearchCanvas" aria-controls="adoSearchCanvas"
              aria-label="{l s='Open search' d='Shop.Theme.Actions'}">
              <span class="material-icons" aria-hidden="true">&#xE8B6;</span>
            </button>

            <div class="{$headerMain}__mobile-actions">
              {hook h='displayHeaderActions'}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  {* ===================================
     H: DESKTOP LARGE - NAV FULL WIDTH
     =================================== *}
  {if !empty($smarty.capture.nav_full_width)}
    <div class="{$headerNavFullWidth}">
      <div class="container-md">
        {$smarty.capture.nav_full_width nofilter}
      </div>
    </div>
  {/if}

  {* ===================================
     H: MOBILE / TABLET SEARCH OFFCANVAS
     =================================== *}
  <div class="ado-search-offcanvas offcanvas offcanvas-top h-auto" tabindex="-1" id="adoSearchCanvas"
    aria-labelledby="adoSearchCanvasLabel">
    <div class="offcanvas-header">
      <form class="ado-search-offcanvas__form w-100" method="get" action="{$urls.pages.search}" role="search">
        <input type="hidden" name="controller" value="search">

        <label class="visually-hidden" for="ado-search-offcanvas-input">
          {l s='Search' d='Shop.Theme.Catalog'}
        </label>

        <div class="position-relative">
          <i class="material-icons ado-search-offcanvas__icon" aria-hidden="true">&#xE8B6;</i>
          <input id="ado-search-offcanvas-input" class="form-control ado-search-offcanvas__input" type="text" name="s"
            value="" placeholder="{l s='Search products...' d='Shop.Theme.Catalog'}"
            aria-label="{l s='Search' d='Shop.Theme.Catalog'}" autocomplete="off">
        </div>
      </form>

      <button type="button" class="btn btn-link text-decoration-none ms-2" data-bs-dismiss="offcanvas"
        aria-label="{l s='Close search' d='Shop.Theme.Global'}">
        {l s='Cancel' d='Shop.Theme.Global'}
      </button>
    </div>
  </div>
{/block}

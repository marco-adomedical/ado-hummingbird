{*
  ===================================
  H: FOOTER
  ===================================

  File base: Override Hummingbird
  Motivo: Footer custom strutturato per esigenze commerciali e istituzionali.
  Nota: Manteniamo una struttura controllata e stabile, più semplice da gestire
        rispetto a un footer basato solo su hook/moduli.
*}

{capture name="footer_before"}{hook h='displayFooterBefore'}{/capture}

{if $smarty.capture.footer_before}
  <div class="footer footer__before">
    {$smarty.capture.footer_before nofilter}
  </div>
{/if}

{block name='footer_main'}
  <footer class="footer ado-footer">
    <div class="ado-footer__main">
      <div class="container">
        <div class="row ado-footer__grid gx-5 gy-4">

          {* =========================
             COLONNA BRAND
             ========================= *}
          <div class="col-12 col-sm-6 col-lg-4 ado-footer__col">
            <div class="ado-footer__brand">

              <div class="ado-footer__logo mb-2">
                <img src="{$urls.child_theme_assets}img/Logo-ADO-MEDICAL-Italian-distributor_white.png"
                  alt="ADO Medical - Italian distributor" class="img-fluid ado-footer__logo-image" loading="lazy">
              </div>

              <p class="ado-footer__payoff mb-3">
                Forniture e dispositivi medicali per professionisti e strutture sanitarie.
              </p>

              <div class="ado-footer__social" aria-label="Social links">
                <a href="https://www.instagram.com/ado_medical/" target="_blank" rel="noopener noreferrer"
                  aria-label="Instagram ADO Medical" class="ado-footer__social-link">
                  <svg viewBox="0 0 640 640" aria-hidden="true" focusable="false">
                    <path
                      d="M320.3 205C256.8 204.8 205.2 256.2 205 319.7C204.8 383.2 256.2 434.8 319.7 435C383.2 435.2 434.8 383.8 435 320.3C435.2 256.8 383.8 205.2 320.3 205zM319.7 245.4C360.9 245.2 394.4 278.5 394.6 319.7C394.8 360.9 361.5 394.4 320.3 394.6C279.1 394.8 245.6 361.5 245.4 320.3C245.2 279.1 278.5 245.6 319.7 245.4zM413.1 200.3C413.1 185.5 425.1 173.5 439.9 173.5C454.7 173.5 466.7 185.5 466.7 200.3C466.7 215.1 454.7 227.1 439.9 227.1C425.1 227.1 413.1 215.1 413.1 200.3zM542.8 227.5C541.1 191.6 532.9 159.8 506.6 133.6C480.4 107.4 448.6 99.2 412.7 97.4C375.7 95.3 264.8 95.3 227.8 97.4C192 99.1 160.2 107.3 133.9 133.5C107.6 159.7 99.5 191.5 97.7 227.4C95.6 264.4 95.6 375.3 97.7 412.3C99.4 448.2 107.6 480 133.9 506.2C160.2 532.4 191.9 540.6 227.8 542.4C264.8 544.5 375.7 544.5 412.7 542.4C448.6 540.7 480.4 532.5 506.6 506.2C532.8 480 541 448.2 542.8 412.3C544.9 375.3 544.9 264.5 542.8 227.5zM495 452C487.2 471.6 472.1 486.7 452.4 494.6C422.9 506.3 352.9 503.6 320.3 503.6C287.7 503.6 217.6 506.2 188.2 494.6C168.6 486.8 153.5 471.7 145.6 452C133.9 422.5 136.6 352.5 136.6 319.9C136.6 287.3 134 217.2 145.6 187.8C153.4 168.2 168.5 153.1 188.2 145.2C217.7 133.5 287.7 136.2 320.3 136.2C352.9 136.2 423 133.6 452.4 145.2C472 153 487.1 168.1 495 187.8C506.7 217.3 504 287.3 504 319.9C504 352.5 506.7 422.6 495 452z" />
                  </svg>
                </a>

                <a href="https://www.linkedin.com/company/adomedical/" target="_blank" rel="noopener noreferrer"
                  aria-label="LinkedIn ADO Medical" class="ado-footer__social-link">
                  <svg viewBox="0 0 640 640" aria-hidden="true" focusable="false">
                    <path
                      d="M512 96L127.9 96C110.3 96 96 110.5 96 128.3L96 511.7C96 529.5 110.3 544 127.9 544L512 544C529.6 544 544 529.5 544 511.7L544 128.3C544 110.5 529.6 96 512 96zM231.4 480L165 480L165 266.2L231.5 266.2L231.5 480L231.4 480zM198.2 160C219.5 160 236.7 177.2 236.7 198.5C236.7 219.8 219.5 237 198.2 237C176.9 237 159.7 219.8 159.7 198.5C159.7 177.2 176.9 160 198.2 160zM480.3 480L413.9 480L413.9 376C413.9 351.2 413.4 319.3 379.4 319.3C344.8 319.3 339.5 346.3 339.5 374.2L339.5 480L273.1 480L273.1 266.2L336.8 266.2L336.8 295.4L337.7 295.4C346.6 278.6 368.3 260.9 400.6 260.9C467.8 260.9 480.3 305.2 480.3 362.8L480.3 480z" />
                  </svg>
                </a>
              </div>
            </div>

            <div class="ado-footer__company">
              <p><strong>A.D.O. MEDICAL s.r.l.</strong></p>
              <p>C.F. &amp; P.IVA: <strong>IT03946191206</strong></p>
              <p>
                SDI: <strong>7HE8RN5</strong><br>
                PEC: <a href="mailto:adomedical@pec.it">adomedical@pec.it</a>
              </p>
            </div>
          </div>

          {* ========================= SUPPORT *}
          <div class="col-12 col-sm-6 col-lg-2 ado-footer__col">
            <h3 class="ado-footer__title">{l s='Support' d='Shop.Theme.Global'}</h3>
            <ul class="ado-footer__links">
              <li><a
                  href="{$link->getCMSLink(1)|escape:'html':'UTF-8'}">{l s='Shipping & payments' d='Shop.Theme.Global'}</a>
              </li>
              <li><a href="{$link->getCMSLink(2)|escape:'html':'UTF-8'}">{l s='Returns' d='Shop.Theme.Global'}</a></li>
              <li><a
                  href="{$link->getCMSLink(6)|escape:'html':'UTF-8'}">{l s='Technical support' d='Shop.Theme.Global'}</a>
              </li>
              <li><a href="{$urls.pages.contact}">{l s='Contact us' d='Shop.Theme.Global'}</a></li>
            </ul>
          </div>

          {* ========================= INFO *}
          <div class="col-12 col-sm-6 col-lg-3 ado-footer__col">
            <h3 class="ado-footer__title">{l s='Information' d='Shop.Theme.Global'}</h3>
            <ul class="ado-footer__links">
              <li><a href="{$link->getCMSLink(4)|escape:'html':'UTF-8'}">{l s='About us' d='Shop.Theme.Global'}</a></li>
              <li><a
                  href="{$link->getCMSLink(3)|escape:'html':'UTF-8'}">{l s='Terms and conditions' d='Shop.Theme.Global'}</a>
              </li>
              {* TODO: aggiungere Privacy e Cookie quando pronti *}
            </ul>
          </div>

          {* ========================= CONTATTI *}
          <div class="col-12 col-sm-6 col-lg-3 ado-footer__col">
            <h3 class="ado-footer__title">Contatti</h3>

            <p class="ado-footer__contact-list">
              <a href="tel:+39051302471" class="ado-footer__contact-item">
                <span class="material-icons">call</span>
                <span>+39 051 302471</span>
              </a><br>

              <a href="mailto:info@adomedical.it" class="ado-footer__contact-item">
                <span class="material-icons">mail</span>
                <span>info@adomedical.it</span>
              </a>
            </p>

            <p class="ado-footer__text">
              <strong>Sede legale, uffici e magazzini:</strong><br>
              Via del Tipografo, 2/2<br>
              40138 Bologna (BO)
            </p>

            <a class="ado-footer__map-link" href="https://maps.app.goo.gl/nA6J4jGJoxNV5P2LA" target="_blank"
              rel="noopener noreferrer">
              <span class="material-icons">place</span>
              <span>Apri su Google Maps</span>
            </a>
          </div>

        </div>
      </div>
    </div>

    {* ========================= BOTTOM *}
    <div class="ado-footer__bottom">
      <div class="container">
        <div class="ado-footer__bottom-inner">
          <p class="ado-footer__bottom-text">
            © {date('Y')} A.D.O. MEDICAL s.r.l. - Tutti i diritti riservati
          </p>
        </div>
      </div>
    </div>

  </footer>
{/block}

<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm {% block navbar %}{% endblock %}">
    <div class="container">
        <a class="navbar-brand text-dark" href="{{ app.phrase.buildLink('indexAction', {}) }}">
            {% include 'logo.tpl' %}
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ app.sub.lang.buttons.navigation }}">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto font-weight-bold">
                <li class="nav-item active">
                    <a class="nav-link" href="{{ app.phrase.buildLink('indexAction', {}) }}">{{ app.sub.lang.string.container.nav.home|raw }} <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{ app.sub.lang.string.container.nav.help.title }}</a>
                    <div class="dropdown-menu custom-menu custom-menu-xs shadow animate fadeIn" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="{{ app.phrase.buildLink('pages', {'section': 'faq'}) }}">{{ app.sub.lang.string.container.nav.help.faq }}</a>
                        <a class="dropdown-item" href="{{ app.phrase.buildLink('pages', {'section': 'privacy'}) }}">{{ app.sub.lang.string.container.nav.help.privacy }}</a>
                        <a class="dropdown-item" href="{{ app.phrase.buildLink('pages', {'section': 'contact'}) }}">{{ app.sub.lang.string.container.nav.help.contact }}</a>
                    </div>
                </li>
            </ul>
            <div class="search-container position-relative">
                <div class="form-inline my-0">
                    <div class="input-group has-feedback has-clear">
                        <input class="form-control" type="text" placeholder="{{ app.sub.lang.string.container.search.text }}" aria-label="{{ app.sub.lang.string.container.search.text }}">
                        <i class="fas fa-search"></i>
                        <span title="{{ app.sub.lang.string.container.buttons.clear }}" class="form-control-clear fas fa-times form-control-feedback d-none"></span>
                    </div>
                </div>
                <div class="search-results shadow d-none">
                    <span></span>
                    <div class="load-area bg-white pt-5 pb-5 d-block">
                        <div class="post-loader-spin d-block"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>
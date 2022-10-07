{% extends 'container.tpl' %}

{% block app_template_name 'privacy' %}

{% block content %}
	<div class="app-profile-sub-menu d-flex flex-column flex-lg-row align-items-lg-center w-100 mb-4">
		<div class="d-flex">
			<div class="app-title">
				<div class="app-breadcrumb d-flex">
					<div class="home"><a href="{{ app.phrase.buildLink('indexAction', {}) }}">{{ app.settings.site_title }}</a></div>
					<div>{{ app.sub.lang.string.pages.breadcrumb.pages }}</div>
					<div>{{ app.sub.lang.string.pages.breadcrumb.help }}</div>
					<div>{{ app.sub.lang.string.pages.breadcrumb.privacy }}</div>
				</div>
			</div>
		</div>
		<div class="ml-lg-auto">
			{% include 'usermenu_member.tpl' %}
		</div>
	</div>
	<aside class="col-sm-12">
		<div class="app-box shadow rounded animate slideIn">
			<div class="pl-4 pr-4 pt-3 pb-3">
				<h5 class="mb-3">{{ app.sub.lang.string.pages.privacy.title }}</h5>
				<p>Bu gizlilik politikası sitemizi kullanırken edindiği herhangi bir bilgiyi nasıl kullandığımızı ve nasıl korunduğunu açıklar.</p>
				<p>{{ app.settings.site_title }} bilgilerinizi ve gizliliğinizi korumayı taahhüt eder.Siteye sağladığınız kimlik veya herhangi bir bilgi yalnızca bu gizlilik politikası çerçevesi içinde kullanılacaktır.</p>
				<p>Site buradaki maddeleri veya başlıkları haber vermeksizin değiştirilebilir.Bunları kontrol etmek kullanıcının yükümlülüğüdür.</p>
				<h5 class="font-weight-bold">Hangi bilgilerinizi depoluyoruz?</h5>
				<ul class="list-unstyled">
					<li>
						<ul>
							<li>İsminiz ve soyisminiz</li>
							<li>Mail adresiniz</li>
							<li>Telefon numaranız(istenirse)</li>
						</ul>
					</li>
				</ul>
				<p>Ek olarak web sitesini kullanırken şu bilgiler depolanır:</p>
				<ul class="list-unstyled">
					<li>
						<ul>
							<li>İp adresiniz</li>
							<li>Coğrafi konum(Ülke ve şehir bazında)</li>
							<li>Kullanılan tarayıcı tipi ve versiyonu</li>
							<li>İşletim sistemi adı ve versiyonu</li>
							<li>Cihaz adı ve modeli</li>
							<li>Ziyaret süreleri, site içinde hangi sayfayı gezdiğiniz, ziyaret sayısı</li>
						</ul>
					</li>
				</ul>
				<h5 class="font-weight-bold">Topladığımız bilgilerle ne yapıyoruz?</h5>
				<ul class="list-unstyled">
					<li>
						<ul>
							<li>Dahili kayıt tutma</li>
							<li>Hesap yönetimi ve kaydı</li>
						</ul>
					</li>
				</ul>
				<h5 class="font-weight-bold">Güvenlik</h5>
				<p>Toplanılan bilgilerin güvenliğini size taahhüt ediyoruz.Yetkisiz erişimler ve ifşayı önleme amaçlı çeşitli algoritmalar ve şifreleme prosedürleri uyguladık.</p>
				<h5 class="font-weight-bold">Çerezler ve İp adresinizi nasıl kullanıyoruz?</h5>
				<p>Çerezleri, siteye kayıt olmak ve kaydı tarayıcınızda açık tutmak ayrıca iki faktörlü kimlik doğrulaması gibi temel şeyler için kullanıyoruz.Tarayıcınızdan çerezleri ayarlayabilir ve değiştirebilirsiniz fakat bu siteyi kullanmayı tamamen sıfırlayabilir veya hata kodları çıkarabilir.</p>
				<p>İp adresinizi, mükerrer hesap bloklama, hesap yönetimi gibi temel şeylerde kullanıyoruz.Ip adresiniz asla açık bir şekilde gösterilmez.</p>
				<h5 class="font-weight-bold">Kişisel bilginizin kontrolü</h5>
				<p>{{ app.settings.site_title }}, izniniz olmadıkça hiç bir bilgiyi yasalar gerektirmedikçe üçüncü şahıslara satmayacak, dağıtmayacak veya kiralamayacaktır.Kişisel bilgilerinizi sizin güvenliğiniz için, size bildirme amaçlı kullanabilir.</p>
				<p>Saklanılan herhangi bir bilginin yanlışlığı, eksikliği için lütfen bizimle iletişime geçiniz.</p>
			</div>
		</div>
	</aside>
	{# This is includes meta definitions. #}
	<div hook-action="{Mention:App-domEvent-metacontents}" data-title="{{ app.sub.lang.string.pages.privacy.title }}"
		data-meta-description="{{ app.settings.meta_description }}"
		data-og-description="{{ app.settings.meta_description }}"
		data-twitter-description="{{ app.settings.meta_description }}" data-og-title="{{ app.settings.site_title }}"
		data-twitter-title="{{ app.settings.site_title }}" class="d-none">
	</div>
{% endblock %}
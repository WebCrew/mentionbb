{% extends 'container.tpl' %}

{% block app_template_name 'faq' %}

{% block content %}
	<div class="app-profile-sub-menu d-flex flex-column flex-lg-row align-items-lg-center w-100 mb-4">
		<div class="d-flex">
			<div class="app-title">
				<div class="app-breadcrumb d-flex">
					<div class="home"><a href="{{ app.phrase.buildLink('indexAction', {}) }}">{{ app.settings.site_title }}</a></div>
					<div>{{ app.sub.lang.string.pages.breadcrumb.pages }}</div>
					<div>{{ app.sub.lang.string.pages.breadcrumb.help }}</div>
					<div>{{ app.sub.lang.string.pages.breadcrumb.faq }}</div>
				</div>
			</div>
		</div>
		<div class="ml-lg-auto">
			{% include 'usermenu_member.tpl' %}
		</div>
	</div>
	<aside class="col-sm-3 mb-4 pr-4">
		<div class="card app-forums bg-white rounded shadow mb-4">
			<div class="card-header">
				<h6 class="font-weight-bold">{{ app.sub.lang.string.pages.faq.tabs.title }}</h6>
			</div>
			<article class="card-group-item">
				<div class="filter-content">
					<div class="list-group list-group-flush">
						<a href="#" data-tab="terms" data-ui="account-tab-item" class="list-group-item active">{{ app.sub.lang.string.pages.faq.tabs.privacy }}</a>
					</div>
					<div class="list-group list-group-flush">
						<a href="#" data-tab="resource-standarts" data-ui="account-tab-item" class="list-group-item">{{ app.sub.lang.string.pages.faq.tabs.resource_standarts }}</a>
					</div>
				</div>
			</article>
		</div>
	</aside>
	<aside class="col-sm-9">
		<div class="app-tab-container">
			<div class="tab-content terms">
				<div class="app-box shadow rounded animate slideIn">
					<div class="app-content pl-4 pr-4 pt-3 pb-3">
						<h5 class="mb-3">{{ app.sub.lang.string.pages.faq.tabs.privacy }}</h5>
						<p>Bu yazı biraz uzun olmakla birlikte detaylı bilgi içermektedir.Lütfen sabırlı olun her şey düzgün bir topluluğa sahip olmak içindir, teşekkürler.</p>
						<p>Bu web sitesinde yazılan her içerikten ve kullanıcılardan sitenin yayıncısı sorumlu değildir.Gönderilen içerikler, yazılar kullanıcının kendi görüşleri ve ifadesidir.</p>
						<p>Site, 13 yaş ve üzeri için uygundur eğer bu yaş altındaysanız lütfen kayıt olmayın kayıt olduğunuz takdirde bu yaştan daha büyük olduğunuzu beyan etmiş olursunuz.</p>
						<p>Gönderdiğiniz içerikler ve yazılar bu sitenin yöneticileri ve onlara bağlı yöneticiler tarafından ihtiyaç durumunda kontrol edilebilir veya spam amaçlı üçüncü taraf uygulamalara gönderilebilir özel veya kişisel bir bilginizi lütfen yazmayın.</p>
						<p>Bu web sitesi içinde küfür, hakaret, nefret, tehtid edici veya etnik kökenlere saygısızlık, siyasal, cinsiyet ve ırk ayrımı, telif unsuru içeren herhangi bir link, içerik, fotoğraf veya yasadışı faaliyet içeren, başkalarının kişisel bilgilerini içeren söz konusu içerik veya davranışın verdiği bütün zararlardan kullanıcı kendi sorumludur ve yöneticilerin bu mesajları istenilirse gerekli mecralara ileteceğini ve yayından kaldırabileceğini kabul etmiş olursunuz.</p>
						<p>Yazmış olduğunuz bir yazıyı veya içeriği herhangi bir zamanda dilediğiniz takdirde kaldırabilir veya silebilirsiniz.İçeriğe müdahele hakkı site sahibi veya yöneticisi olsa dahi şartlar ve kurallara uygun hiç bir yazıyı değiştiremez veya kaldıramaz.</p>
						<p>Herhangi bir içeriği, algoritmik yolla(Örneğin: bot yazılımları) erişemezsiniz.Bunun için gerekli api veya izinleri sağlamış olmanız gerekmektedir.</p>
						<p>Bu şartlar ve kurallar bilgi sahibi olmaksınız değiştirilebilir veya kaldırılabilir.</p>
						<p>Bu şartların tamamı {{ app.settings.site_title }} sitesinin bir parçası olarak kabul edilir.</p>
						<p>Şartları kabul etmiyorsanız lütfen kayıt olmayın ve siteyi kullanmayın.Kullandığınız takdirde şartları kabul ettiğiniz beyan olur.Hesabınızı veya hizmetinizi kapatmak için bizimle iletişime geçmelisiniz.</p>
						<h5 class="font-weight-bold">{{ app.settings.site_title }} kuralları</h5>
						<p>Her toplulukta olduğu gibi bu siteninde bir kuralları vardır.Bunlar toplulukların sorunsuz çalışması için son derece önemlidir.Topluluğumuz için yönetim gibi alanlar her daim önemli olsa da üyeler ve misafirler için hoş bir ortam bırakmak bizim için önemli ve zaruridir.Bu yüzden gönderdiğiniz her yazı, profil fotoğrafınız vs gibi detaylarda bu kurallara lütfen dikkat edin.</p>
						<p>Kurallarımız sürekli güncellenmekle birlikte değiştirilebilir.</p>
						<p>Topluluğumuzda bu kuralları sürekli ihlal eden kullanıcılar, yaptıkları katkılara veya yönetici olmasına bakılmaksınız topluluğumuzdan uyarı ve devamı halinde engellenme durumu yaşayacaklardır.</p>
						<ul class="list-unstyled">
							<li>
								<ul>
									<li>Nazik olmaya özen gösterin, diğer üyelere davranışlarınızda saldırgan tavır göstermeniz kabul edilemez bir durumdur.</li>
									<li>Bir kullanıcıya sürekli mesaj atmak, etiketlemek gibi kısaca kullanıcıyı rahatsız eden ve tahrik eden her eylemden uzak durulmalıdır.</li>
									<li>Gönderiler veya yazılar konuya her zaman uygun olmalıdır ve yazı veya genel olarak tartışmalar uygun kategorilere açılmalıdır.</li>
									<li>Yazılarınızda düzgün bir dil ve yapıcı olunmalıdır, yazılan mesajlarda sade bir dil kullanılmalıdır.</li>
									<li>Bir kullanıcıdan kurallara uymayan bir mesaj aldığınızda veya başka bir kullanıcıya saldırganlık gösterdiğini sezdiyseniz mesaj bölümünden "Rapor" butonunu kullanabilirsiniz.</li>
									<li>Yazılan dil, web sitesinin kendi dili olmalıdır aksi halde siteyi yönetmek mümkün değildir.</li>
									<li>Aktif olmayan bir tartışmaya dahil olmak veya yanıtlamak bu tartışmaya bir şey katacak düzeyde değilse yazılmamalıdır.Aksi halde karmaşa yaşanabilir.</li>
									<li>Bir yönetici bir önerge sunduğunda buna uymalısınız.Kararın yanlış olduğunu düşündüğünüzde raporlama yapabilirsiniz.</li>
									<li>Her kullanıcının yalnızca bir hesabı olabilir, mükerrer hesaplar tespit edilirse engellenir.Ayrıca yasaklı bir üye tekrardan hesap açtığında sorgusuz sualsiz tekrar yasaklanır.</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="tab-content resource-standarts">
				<div class="app-box shadow rounded animate slideIn">
					<div class="app-content pl-4 pr-4 pt-3 pb-3">
						<h5 class="mb-3">{{ app.sub.lang.string.pages.faq.tabs.resource_standarts }}</h5>
						<p>Bu sitedeki bütün içerikler, yazılar aşağıda yazan standartlara uymalıdır.</p>
						<p>Standartlar <a href="#terms">Şartlar ve kurallar</a> sekmesinde ek olarak dikkate alınmıştır.</p>
						<ul class="list-unstyled">
							<li>
								<ul>
									<li>Başlıklar doğru ve sade bir dil ile oluşturulmalıdır.</li>
									<li>Başlıkta link ve gereksiz tanıtım dili içermemelidir.</li>
									<li>İçerikteki resimler, yazılar vs. site kuralları çerçevsince uygun olmalıdır.</li>
									<li>Yazınızı bir kaynaktan aldıysanız bu kaynağı mesajda belirtmelisiniz.</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</aside>
	{# This is includes meta definitions. #}
	<div hook-action="{Mention:App-domEvent-metacontents}" data-title="{{ app.sub.lang.string.pages.breadcrumb.help }}"
		data-meta-description="{{ app.settings.meta_description }}"
		data-og-description="{{ app.settings.meta_description }}"
		data-twitter-description="{{ app.settings.meta_description }}" data-og-title="{{ app.settings.site_title }}"
		data-twitter-title="{{ app.settings.site_title }}" class="d-none">
	</div>
{% endblock %}
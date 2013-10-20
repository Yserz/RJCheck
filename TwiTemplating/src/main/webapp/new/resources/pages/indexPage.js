var indexPage = Handlebars.compile(TT.Renderer.requireTemplate("resources/pages/templates/indexPage.html").responseText);
Handlebars.registerPartial("indexPage", indexPage);

$("head").append(TT.Renderer.basehead({}));
$("body").append(indexPage());
$('#naviHome').addClass('active');

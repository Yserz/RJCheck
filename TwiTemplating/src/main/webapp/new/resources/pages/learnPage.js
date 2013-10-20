var learnPage = Handlebars.compile(TT.Renderer.requireTemplate("resources/pages/templates/learnPage.html").responseText);
Handlebars.registerPartial("learnPage", learnPage);

$("head").append(TT.Renderer.basehead({}));
$("body").append(learnPage({}));
$('#naviLearn').addClass('active');
var newsPage = Handlebars.compile(TT.Renderer.requireTemplate("resources/pages/templates/newsPage.html").responseText);
Handlebars.registerPartial("newsPage", newsPage);
var articleList = Handlebars.compile(TT.Renderer.requireTemplate("resources/components/templates/articleList.html").responseText);
Handlebars.registerPartial("articleList", articleList);
var article = Handlebars.compile(TT.Renderer.requireTemplate("resources/components/templates/article.html").responseText);
Handlebars.registerPartial("article", article);

var news = TT.Webservice.messages().responseText;
$("head").append(TT.Renderer.basehead({}));
$("body").append(newsPage({}));
$("#articleList").append(articleList(
    {
        "id": 1,
        "name":"NewsName",
        "articles": JSON.parse(news)
    }
));
$('#naviExample').addClass('active');
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" %>

<%--<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="dec" %>     <!-- 1+ -->--%>

<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Real estate</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/table.css" rel="stylesheet">

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link media="all" rel="stylesheet" href="${contextPath}/resources/css/main.css">            <!-- 2+ -->

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js" defer></script>  <!-- 3+ -->
    <script>window.jQuery || document.write('<script src="js/jquery-1.12.4.min.js" defer><\/script>')</script>
    <script src="${contextPath}/resources/js/jquery.main.js" defer></script>



    <%--<script src="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" defer></script>
    &lt;%&ndash;<script src="${contextPath}/resources/css/custom-theme/jquery-ui-1.10.4.custom.css" defer></script>&ndash;%&gt;
    <script src="${contextPath}/resources/js/jquery-ui-1.10.4.custom.min.js" defer></script>--%>
    <!--   adding from p. 16 -->
    <%--  <spring:theme code="styleSheet" var="app_css" />
      <spring:url value="/${app_css}" var="app_css_url" />
      <link rel="stylesheet" type="text/css" media="screen" href="${app_css_url}" />

      <spring:url value="/resources/scripts/jquery-1.11.1.js" var="jquery_url" />
      <spring:url value="/resources/scripts/jquery-ui-1.10.4.custom.min.js"
                  var="jquery_ui_url" />
      <spring:url value="/resources/styles/custom-theme/jquery-ui-1.10.4.custom.css"
                  var="jquery_ui_theme_css" />
      <link rel="stylesheet" type="text/css" media="screen" href="${jquery_ui_theme_css}" />
      <script src="${jquery_url}" type="text/javascript"><jsp:text/></script>
      <script src="${jquery_ui_url}" type="text/javascript"><jsp:text/></script>

      <!-- CKEditor -->
      <spring:url value="/resources/ckeditor/ckeditor.js" var="ckeditor_url" />
      <spring:url value="/resources/ckeditor/adapters/jquery.js" var="ckeditor_jquery_url" />
      <script type="text/javascript" src="${ckeditor_url}"><jsp:text/></script>
      <script type="text/javascript" src="${ckeditor_jquery_url}"><jsp:text/></script>

      <!-- jqGrid -->
      <spring:url value="/resources/jqgrid/css/ui.jqgrid.css" var="jqgrid_css" />
      <spring:url value="/resources/jqgrid/js/i18n/grid.locale-en.js"
                  var="jqgrid_locale_url" />
      <spring:url value="/resources/jqgrid/js/jquery.jqGrid.min.js" var="jqgrid_url" />
      <link rel="stylesheet" type="text/css" media="screen" href="${jqgrid_css}" />
      <script type="text/javascript" src="${jqgrid_locale_url}"><jsp:text/></script>
      <script type="text/javascript" src="${jqgrid_url}"><jsp:text/></script>--%>
    <!--   adding from p. 16 -->

</head>

<body>
<div id="wrapper">
    <jsp:include page="../section/header.jsp"/>

    <section class="main">
        <sitemesh:write property='body'/>
    </section>

    <jsp:include page="../section/footer.jsp"/>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>



</div>
</body>

</html>

<%def name="slug_from_delegate(d)"><%
        return d.replace('.', '-')
%></%def>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title><%block name="title">Digital Gaia</%block></title>

    <link rel="stylesheet" href="/static/css/bootstrap.3.1.1.min.css">
    <link rel="stylesheet" href="/static/css/jquery.dataTables.1.10RC1.css">
    <link rel="stylesheet" href="/static/css/dataTables.bootstrap.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/css/application.css">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,300italic,400italic,500,500italic">

    <%block name="stylesheet"></%block>

    <script src="/static/js/jquery.1.10.2.min.js"></script>

</head>

<body>

<div id="wrap">
    <%include file="header.mako"/>

    <div class="container">
        ${next.body()}
    </div>

    <div id="push"></div>
</div>

<%include file="footer.mako"/>

<!-- NOTE: most (all) JS should go at the end of the document for better page loading performance -->

<!-- NOTE: we may need to move this higher up (in the <head> section) if needed -->
<script src="/static/js/jquery.1.10.2.min.js"></script>
<script src="/static/js/bootstrap.3.1.1.min.js"></script>
<script src="/static/js/underscore.js"></script>

<script src="/static/js/jquery.dataTables.1.10RC1.js"></script>
<script src="/static/js/dataTables.bootstrap.js"></script>

<%block name="scripts">
<script type="text/javascript">
    //var PUBLIC_API_URL = "http://localhost:5001";
    var PUBLIC_API_URL = "http://api.digitalgaia.io";
</script>
</%block>


</body>
</html>

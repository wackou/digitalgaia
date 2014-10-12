<%!
    from flask import request
%>

<%def name="menu_item(name, path)">
    <li
      % if request.path == '/' + path or (name == 'home' and request.path == '/'):
        class="active"
      % endif
       ><a href="/${path}">${name}</a></li>
</%def>

<div class="navbar navbar-default">
	<div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="/" class="navbar-brand digitalgaia_title">DigitalGaia</a>
                </div>

                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        ${menu_item('home', 'index.html')}
                        ${menu_item('mission', 'mission.html')}
                        ${menu_item('philosophy', 'philosophy.html')}
                    </ul>
                </div>
            </div>

            <div class="col-md-6" style="padding-left: 0;">
                <div class="collapse navbar-collapse">

                    <div class="navbar-header">
                        <a href="#" class="navbar-brand">Delegates</a>
                    </div>

                    <ul class="nav navbar-nav">
                        ${menu_item('wackou', 'wackou.html')}
                        ${menu_item('backbone', 'backbone.html')}
                        ##${menu_item('security', 'security.html')}
                        ##${menu_item('charity', 'charity.html')}
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div>
        </div>
	</div>
</div>

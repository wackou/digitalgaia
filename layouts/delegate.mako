<%inherit file="base.mako"/>

<%block name="title">Digital Gaia - ${next.delegate_name().split('.')[0]}</%block>

<%block name="scripts">
${parent.scripts()}

<script type="text/javascript">
$(function() {
    function ratioButton(ratio) {
        var result = "<button style='margin: 0; padding: 0 4px;' disabled='disabled' class='btn btn-sm ";
        var r = parseFloat(ratio);
        if (r > 98) result += "btn-success'>";
        else if (r > 95) result += "btn-warning'>";
        else result += "btn-danger'>";
        result += ratio + "</div>";
        return result;
    };

    $.get(PUBLIC_API_URL+"/delegate_info/${next.delegate_name()}", function(data) {
        //alert("GOT BACK:" + Object.keys(data));
        var delegate_info = data['result'];
        //alert(Object.keys(delegate_info));
        var active = (delegate_info.rank <= 101);
        var votes = delegate_info.votes_for;

        var status = "<button disabled='disabled' class='btn btn-sm ";
        if (active) { status += "btn-success'>Active"; }
        else        { status += "btn-danger'>Standby"; }
        if (votes) { status += " (" + votes + ")"; }
        status += "<br>rank: " + delegate_info.rank + "</div>";

        var st = $("#status_${parent.slug_from_delegate(next.delegate_name())}");
        st.html(status);

        status = "<p><b>Blocks produced</b></p><table>";
        status += "<tr><td>Last day</td><td style='padding-left: 8px;'>" + ratioButton(delegate_info.ratio_last_day) + "</td></tr>";
        status += "<tr><td>Last week</td><td style='padding-left: 8px;'>" + ratioButton(delegate_info.ratio_last_week) + "</td></tr>";
        status += "<tr><td>Last month</td><td style='padding-left: 8px;'>" + ratioButton(delegate_info.ratio_last_month) + "</td></tr>";

        st = $("#status_blocks_produced");
        st.html(status);
    });
});
</script>
</%block>

<h2 class="display-only-xxs">${next.delegate_name()}</h2>
<div class="row">
    <div class="col-md-2 col-md-offset-2 col-sm-3 col-sm-offset-1 col-xs-3 col-xxs-6" style="text-align: center;">
        <img src="https://robohash.org/set_1/${next.delegate_name()}?size=120x120" style="margin-top: -24px;"/>

        <div id="status_${parent.slug_from_delegate(next.delegate_name())}"  style="margin-top: 12px;"></div>

        <a href="bts:${next.delegate_name()}/approve" class="btn btn-default hidden-xxs" style="margin-top: 10px;">
            <i class="fa fa-thumbs-o-up" style="font-size: 24px;"></i> <b>Approve!</b>
        </a>
    </div>
    <div class="col-md-4 col-sm-6 col-xs-9 col-xxs-6">
        <br class="display-only-xxs">
        <h2 class="hidden-xxs" style="margin-top: 0; margin-bottom: 20px;">
            ${next.delegate_name()}
        </h2>
        <div id="status_blocks_produced"></div>
    </div>
</div>

${next.body()}

<div class="row prose" style="margin-top: 24px;">
    <div class="col-md-10 col-md-offset-1">
        <h3 style="margin-top: 0;">Mission</h3>
        <%block name="mission"></%block>
    </div>
</div>


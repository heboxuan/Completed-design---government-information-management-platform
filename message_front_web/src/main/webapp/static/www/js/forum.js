var Forum={initRankBtn:function(n){$(".rank-btn").click(function(){0==$("#rank_panel").find(".tab-box").length&&Ajax.post(CONTEXT_PATH+"/forum/rank",{fid:n},function(n){if(n.result="success"){var t=n.responseData;$(".tab-ctns").html(tmpl("forum_rank_tpl",t))}$(".tab").tab()}),$("#rank_panel").toggle()})}};

function note() {
	pushd ~/Notes 1>/dev/null && \
	nvim $(fzf -i --cycle --reverse --preview-window=down --preview='cat {}' --print-query | gawk 'END{if($0 !~ /.wiki$/){$0=gensub(" ", "_", "g",$0) ".wiki"}; print $0}')
	popd 1>/dev/null
}

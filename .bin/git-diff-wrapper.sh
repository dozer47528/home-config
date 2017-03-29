if command -v icdiff >/dev/null 2>&1; then
	icdiff --line-numbers --tabsize=4 "$2" "$5"
else
	git diff "$2" "$5"
fi

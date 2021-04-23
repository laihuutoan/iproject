var posts = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.whitespace,
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: {
    url: '/posts/autocomplete?query=%QUERY',
    wildcard: '%QUERY'
  }
});
$('#post-search').typeahead(null, {
  source: posts
});

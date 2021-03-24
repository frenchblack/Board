//pagination
addJavascript("/js/util/uriBuilder.js");

function ptrPaginationToHtml( pagination, lcoation) {
  let pagingUri = new UriBuilder(lcoation);
  console.log(pagingUri);
  let ptrHtml = "";

  ptrHtml += '<div id="paginationBox">';
  ptrHtml +=  '<ul class="pagination justify-content-center">';
  if ( pagination.prev ) {
    pagingUri.addParams({'page' : pagination.startPage - 1, 'range' : pagination.range - 1});
    //console.log(pagingUri);
    ptrHtml += '<li class="page-item"><a class="page-link" onclick="pagingOnClick(\'' + pagingUri.build() + '\', ' + (pagination.startPage - 1) + ', '  + (pagination.range - 1) + ', \'' + pagingUri.location + '\')">Previous</a></li>';
  }

  for ( let i = pagination.startPage ; i <= pagination.endPage ; i++ ) {
    if ( pagination.page == i ) {
      ptrHtml += '<li class="page-item active"><span class="page-link">' + i + '</span></li>';
    } else {
      pagingUri.addParams({ 'page' : i, 'range' : pagination.range });
      console.log(pagingUri.params);
      ptrHtml += '<li class="page-item">';
      ptrHtml +=  '<a class="page-link" onclick="pagingOnClick(\'' + pagingUri.build() + '\', ' + i + ', '  + pagination.range + ', \'' + pagingUri.location + '\')">' + i + '</a></li>';
      //ptrHtml +=  '<a class="page-link" href="' + pagingUri.build() + '">' + i + '</a></li>';
    }
  }

  if ( pagination.next ) {
    pagingUri.addParams({'page' : pagination.endPage + 1, 'range' : pagination.range + 1});
    //console.log(pagingUri);
    ptrHtml += '<li class="page-item"><a class="page-link" onclick="pagingOnClick(\'' + pagingUri.build() + '\', ' + (pagination.endPage + 1) + ', '  + (pagination.range + 1) + ', \'' + pagingUri.location + '\')">Next</a></li>';
  }

  ptrHtml +=  '</ul>'
  ptrHtml +='</div>'

  return ptrHtml;
}
//uriBuilder
function UriBuilder(location) {
  this.location = location;
  this.params = {};
}

UriBuilder.prototype.chngLocation = function(location) {
  this.location = location;
}

//prapm추가
UriBuilder.prototype.addParams = function( params ) {
  //console.log("addParams" + this.params + "/" + params);
  Object.assign(this.params, params);
}

UriBuilder.prototype.build = function() {
  //console.log("build" + this.location + "/" + this);
  let uri = "";
  $.each(this.params, function(key, value) {
    if ( uri.length < 1 ) {
      uri += "?";
    } else {
      uri += "&";
    }
    uri += key + "=" + value;
  });

  return this.location + uri;
}
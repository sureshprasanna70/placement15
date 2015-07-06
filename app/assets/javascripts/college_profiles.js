// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $("#college_profile_degree").change(function(){
    url="/college_profiles/"+this.value
    console.log(url);
  })
})

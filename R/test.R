test_index = function(){
  page_index() |> app$test()
}
pwa_create = function(publishingSite = "https://tpemartin.github.io/appElection/"){
  require(apptest)
  apptest::create_pwa(
    indexTag = page_index(),
    publishingSite = publishingSite,
    icon512 = "/Users/martinl/Downloads/appElection.png"
  )
  pwa$webmanifestJson$name="Taiwan election"
  pwa$webmanifestJson$short_name="tw.Elect"
  pwa$updateManifest()

  usethis::use_data(pwa, overwrite = T)
}
test_pwa = function(ngrokUrl='https://ed29-120-126-136-59.jp.ngrok.io'){
  require(apptest)
  apptest::create_pwa(
    indexTag = page_index(),
    publishingSite = ngrokUrl,
    icon512 = "/Users/martinl/Downloads/appElection.png"
  )
  pwa$webmanifestJson$name="Taiwan election"
  pwa$webmanifestJson$short_name="tw.Elect"
  pwa$updateManifest()

  page_index() |>
    pwa$index() |> app$test()
}

hw <- function(q, k) {
  an <- POST(
    url = "https://api.openai.com/v1/chat/completions",
    httr::add_headers(Authorization = paste("Bearer", k)),
    httr::content_type_json(),
    encode = "json",
    body = list(
      model = "gpt-3.5-turbo-0301",
      messages = list(
        list(
          role = "user",
          content = q
        )
      )
    )
  )
  stringr::str_trim(content(an)$choices[[1]]$message$content)
}

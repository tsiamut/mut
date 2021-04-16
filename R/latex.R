#' tex format for symbolic computation output
#' @description tex output to clipboard
#' @param  x  Ryacas object
#' @title tex format and $$...$$
#' @importFrom  Ryacas tex
#' @author tsia
#' @examples
#' \dontrun{
#' p_load(Ryacas)
#' r <- ysym('r')
# A <- ysym('A')
#' B <- ysym('B')
#' a <- ysym('a')
#' x1 <- A*B*r*exp(-B*r/2)* cos(a)
#' deriv(x1,'r') %>%  simplify %>% latex
#' deriv(x1,'r') %>%  simplify %>% la
#' deriv(x1,'r') %>%  simplify %>% lat
#'}
#' @export
latex <- function(x){
  x <-  Ryacas::tex(x)
  x <- paste('$$',x,'$$')
  utils::writeClipboard(x)
}

#' @rdname latex
#' @description  output: $$...$$ to clipboard, sometimes will wrong!
#' @export
la <- function(x){
  x <- Ryacas::tex(x)
  x <- paste('$$',x,'$$')
  cat(x, file = 'clipboard')
}

#' @rdname latex
#' @description output to console
#' @export
lat <-  function(x){
  x <- Ryacas::tex(x)
  x <- paste('$$',x,'$$')
  cat(x)
}




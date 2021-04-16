#' @title Create a picture with a transparent background.
#' @description Use the Imagemagick command line to convert the PDF saved by ggplot2 to PNG format with a transparent background and to set the resolution.
#' @param  x A file name that does not have a suffix and is entered as a string.
#' @param  dp dpi = 600
#' @param  ...  see:\link{ggsave}
#' @importFrom ggplot2  theme_set theme element_rect ggsave
#'
#' @author  tsia
#' @export
ggpng <- function(x,dp = 600,...){
  x1 <- paste0(x,'.pdf')
  x2 <- paste0(x,'.png')
  ggsave(x1,...)
  system(paste('magick -density ',dp,x1,'-quality 90',x2) )
}

#' @rdname ggpng
#' @param p  ggplot2 object
#' @param x A file name that does not have a suffix and is entered as a string.
#' @param  dp dpi = 600
#' @param  ...  see:\link{ggsave}
#' @export
ggPNG <- function(x,p,dp = 600,...){
  x1 <- paste0(x,'.pdf')
  x2 <- paste0(x,'.png')
  p <- p +
    theme(
      plot.background = element_rect(
        fill = NA,color = NA),
      panel.background = element_rect(
        fill = NA, color = NA)
    ) }

#' @rdname ggpng
#' @export
  theme_transparent <- function(){
    theme_set( theme(
      plot.background = element_rect(
        fill = NA,color = NA),
      panel.background = element_rect(
        fill = NA, color = NA) ) )
  }

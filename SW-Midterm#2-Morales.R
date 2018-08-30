install.packages("magick")
install.packages("OpenImageR")
library(magick)
source("http://bioconductor.org/biocLite.R")
biocLite("EBImage")
library("EBImage")
library(EBImage)
library("OpenImageR")

##LOCAL Images
image <- image_read("bball.jpg")
dim(image)[1:2]
display(image)
resize(image, w =500, h=500)
resizeLocal <- function(image, width, height){
  getImage <- image_read(image)
  dim(getImage)[1:2]
  img <- resize(image, w =width, h=height)
  display(img)
  
}
resizeLocal("bball.jpg",300,300)

grayscaleLocal <- function(image, x1){
  if(x1== TRUE){
    colorMode(image) = Grayscale
    display(image, all=TRUE)
  }
  else if(x1 == FALSE){
    colorMode(image) = Color
    display(image, all=TRUE)
  }
  else{
    print("Input TRUE or FALSE only")
  }
}
grayscale1(image, TRUE)

inverter <- function(image, x1){
  invertImg <- translate(rotate(image, x1), c(50, 0))
  display(invertImg)
}
inverter(image, 90)

##WEB Images
webImage <- image_read('https://www.pump.org/wp-content/uploads/2018/04/FT9FPNZHVR7USAM.LARGE_.jpg')
webImage

resizeWeb <- function(webImage, x1){
  img <- image_resize(webImage, x1)
  img
}
resizeWeb(webImage,"300x300")

grayscale2 <- function(webImage, x1){
  if(x1== TRUE){
    image_convert(webImage,type = 'Grayscale')
  }
  else if(x1 == FALSE){
    webImage
  }
  else{
    print("Input TRUE or FALSE only")
  }
}
grayscale2(webImage, TRUE)

webInverter <- function(img2, x1){
  image_rotate(img2, x1)
}
webInverter(webImage, 90)

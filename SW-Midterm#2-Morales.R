install.packages("jpeg")
install.packages("magick")
install.packages("imager")
install.packages("adimpro")
source("http://bioconductor.org/biocLite.R")
biocLite("EBImage")
library(EBImage)
library(jpeg)
library(magick)
library(imager)
library(adimpro)

#WEB Read and resize
hoop<- image_read('https://www.pump.org/wp-content/uploads/2018/04/FT9FPNZHVR7USAM.LARGE_.jpg')
print(hoop) 
#change height and weight
image_scale(hoop, "300x300")
image_convert(hoop,type = 'Grayscale')

#local read
ball<- readJPEG("bball.jpg", native = TRUE)
ball
plot(0:1,0:1, type = "n", ann= FALSE, axes = FALSE)
rasterImage(ball,0,0,1,1)

#local resize
ball<- readImage("bball.jpg")
dim(ball)[1:2]

#specific resizing
ballImage <- resize(ball, w = 1000, h = 1000)

# show the scaled image
display(ballImage)

colorMode(hoop) = Grayscale
ball
display(hoop)
#functions
#1.Read an Image Lovally and thru WEB

#local read
readlocal<- function(x){
  image<- readJPEG(x, native = TRUE)
  image
  plot(0:1,0:1, type = "n", ann= FALSE, axes = FALSE)
  rasterImage(image,0,0,1,1)
}

readlocal("bball.jpg")

#web read
readWeb<- function(x){
  image<- image_read(x)
  print(image) 
}
readWeb('https://www.pump.org/wp-content/uploads/2018/04/FT9FPNZHVR7USAM.LARGE_.jpg')

#2-Image Augmentation
#2.1 Resize

#local resize

localResize<-function(x,width,height){
  getImage<- readImage(x)
  dim(getImage)[1:2]
  setImage <- resize(getImage, w = width, h = height)
  
  # show the scaled image
  display(setImage)
}
localResize("bball.jpg",250,250)

#web resize
webResize<-function(x,width,height){
  image<- image_read(x)
  image_scale(image, width)
  image_scale(image, height)
}
webResize('https://www.pump.org/wp-content/uploads/2018/04/FT9FPNZHVR7USAM.LARGE_.jpg',500,500)

#2.2 Grayscale
grayImage<- function(x,y){
  image<- image_read(x)
  if( y == TRUE){
  image_convert(image,type = 'Grayscale')
  }else(image)
}
localgray<-function(x,y){
  grayimage<-colorMode(x) = Grayscale
  display(grayimage)
}
grayImage('https://www.pump.org/wp-content/uploads/2018/04/FT9FPNZHVR7USAM.LARGE_.jpg', TRUE)
grayImage("bball.jpg", TRUE)

#2.3 Invert image
image<- image_read("bball.jpg")
rotate.image(image, angle = 90, compress=NULL)

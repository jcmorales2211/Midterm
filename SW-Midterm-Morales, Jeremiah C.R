install.packages("jpeg")
install.packages("magick")
source("http://bioconductor.org/biocLite.R")
biocLite("EBImage")
library(EBImage)
library(jpeg)
library(magick)

#WEB Read and resize
hoop<- image_read('https://www.pump.org/wp-content/uploads/2018/04/FT9FPNZHVR7USAM.LARGE_.jpg')
print(hoop) 
#change height
image_scale(hoop, "x250")
#change width
image_scale(hoop,"300")


#local resize
ball<- readJPEG("bball.jpg", native = TRUE)
ball
plot(0:1,0:1, type = "n", ann= FALSE, axes = FALSE)
rasterImage(pict,0,0,1,1)

ball<- readImage("bball.jpg")
dim(ball)[1:2]

#specific resizing
ballImage <- resize(ball, w = 200, h = 100)
# scale by 50%; the height is determined automatically so that
# the aspect ratio is preserved
ballImage <- resize(bballImage, dim(bballImage)[1]/2)
# show the scaled image
display(ballImage)




install.packages("jpeg")
install.packages("magick")
source("http://bioconductor.org/biocLite.R")
biocLite("EBImage")
library(EBImage)
library(jpeg)
library(magick)
#local read
ball<- readJPEG("bball.jpg", native = TRUE)
ball
plot(0:1,0:1, type = "n", ann= FALSE, axes = FALSE)
rasterImage(pict,0,0,1,1)

#WEB Read
hoop<- image_read('https://www.pump.org/wp-content/uploads/2018/04/FT9FPNZHVR7USAM.LARGE_.jpg')
print(hoop) 

ball<- readImage("bball.jpg")
hoop<-readImage("hoop.jpg")
dim(ball)[1:2]
dim(hoop)[1:2]
#specific resizing
ballImage <- resize(ball, w = 200, h = 100)
hoopImage <- resize(hoop, w = 200, h = 100)

# scale by 50%; the height is determined automatically so that
# the aspect ratio is preserved
ballImage <- resize(bballImage, dim(bballImage)[1]/2)
hoopImage <- resize(bballImage, dim(bballImage)[1]/2)
# show the scaled image
display(hoopImage)
display(ballImage)




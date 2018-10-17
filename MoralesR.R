library(argparse)
library(imager)

#!/usr/bin/Rscript
#Arguments collecting
args=commandArgs(trailingOnly = TRUE);


if("--help" %in% args) {
  print("Parameters to be entered:")
  print("--image=[filename] --width==[value] --height==[value] --gray=[TRUE or FALSE] --rotate[degree]")
  q(save="no")
}

parseArgs <- function(x) strsplit(sub("^--" , "" , x), "=")
argsDF <- as.data.frame(do.call("rbind", parseArgs(args)))
argsList <- as.list(as.character(argsDF$V2))
names(argsList) <- argsDF$V1

parse1<-as.character(argsList$image)
parse2<-as.numeric(argsList$width)
parse3<-as.numeric(argsList$height)
parse4<-as.logical(argsList$gray)
parse5<-as.numeric(argsList$rotate)


augmentImage<-function(addr, resizeWidth, resizeHeight, gray, deg, filename="Augmented_Image.jpg")
  {
    #load
    img<-load.image(addr)
    #resize
    img<-resize(img, resizeWidth, resizeHeight)
    
    #grayscale
    if(gray==TRUE)
      {
        img<- grayscale(img)
    }
    #rotate
    img<-imrotate(img,angle = deg)
    #saving
    file<-"C:/Users/Jeremiah Morales/Documents/augmented_images/"
    saveFile<-paste(file,filename)
    save.image(img,saveFile)
    plot(img)
    print("Image augmented Success")
}

augmentImage(parse1,parse2,parse3,parse4,parse5)
augmentImage('bball.jpg',500,500, TRUE, 180)

setwd("C:/Users/Jeremiah Morales/Documents/augmented_images")
list.files()
addr<-list.files()
readFiles<-function()
for(i)
image<-addr[i]
img<-load.image(image)
plot(img)

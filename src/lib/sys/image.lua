
function ImageData(file)
    return love.image.newImageData(file)
end

function Image(ImageData)
  return love.graphics.newImage(ImageData)
end
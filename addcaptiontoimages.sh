for img in *.jpg; do

   width=$(identify -format %W ${img})
   width=$(( ${width} * 1 / 10 ))
   height=$(identify -format %H ${img})
   height=$(( ${height} * 1 / 10 ))

   convert                  \
     -background '#00000080'\
     -gravity NorthEast     \
     -fill white            \
     -size ${width}x${width}     \
      caption:"${img%%.*}"  \
     "${img}"              \
     +swap                  \
     -gravity NorthEast         \
     -composite             \
      "with-caption-${img}"

done

version=$1

if [ ! -n "$version" -o ! -d "../images/$version" ]; then
  echo "invalid version"
else
  for file in ../images/$version/*
  do 
    docker load -i $(basename $file)
  done
fi

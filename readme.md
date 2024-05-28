# build image

docker build -t neo-n3-node .

# create container based on the image

docker run -d -p 10332:10332 --name my-node neo-n3-node

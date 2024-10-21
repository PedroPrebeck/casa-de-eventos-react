# Step 1: Use Node.js as the base image
FROM node:18-alpine

# Step 2: Set working directory inside the container
WORKDIR /app

# Step 3: Copy the package.json and package-lock.json to the working directory
COPY package*.json ./

# Step 4: Install all dependencies inside the container
RUN npm install

# Step 5: Copy the entire application to the container
COPY . .

# Step 6: Install json-server for mock backend
RUN npm install -g json-server

# Step 7: Expose the correct ports for the frontend and backend
EXPOSE 5173
EXPOSE 5000

# Step 8: Start both the React application and the json-server
CMD ["sh", "-c", "json-server --watch eventos.json --port 5000 & npm run dev -- --host 0.0.0.0"]

# Install dependencies only when needed
FROM node:16-alpine AS deps
# Check https://github.com/nodejs/docker-node/tree/b4117f9333da4138b03a546ec926ef50a31506c3#nodealpine to understand why libc6-compat might be needed.
RUN apk add --no-cache libc6-compat python2 build-base
RUN ln -sf python2 /usr/bin/python
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# Production image, copy all the files and run next
FROM node:16-alpine AS runner
WORKDIR /app
COPY . .
COPY --from=deps /app/node_modules ./node_modules
RUN yarn build

EXPOSE 1337

CMD ["yarn", "start"]

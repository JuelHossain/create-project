#! /usr/bin/bash

# current directory
path="$(dirname "${BASH_SOURCE[0]}")/setup"

# creating vite app
npm create vite@latest . -- --template react

echo "Vite Project Created"

# setting up tailwind css
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p

echo "tailwind setup complete "

# settting up react-router-dom
npm install react-router-dom localforage match-sorter sort-by

echo "react router setup complete"

# setting up redux toolkit
npm install @reduxjs/toolkit
npm install react-redux

echo "redux toolkit setup complete"

# setting up mantine
npm install @mantine/core @mantine/hooks @mantine/form @mantine/dates dayjs @mantine/notifications @mantine/dropzone @mantine/carousel embla-carousel-react @mantine/spotlight @mantine/modals @mantine/nprogress @emotion/react @tabler/icons @juel/hooks

echo "mantine setup complete"
echo "setting up linting and formatting"

npm i -D eslint@^7.32.0 || ^8.2.0
npm install -D eslint-plugin-react@^7.28.0 eslint-config-airbnb@latest eslint-plugin-import@^2.25.3 eslint-plugin-jsx-a11y@^6.5.1 eslint-plugin-react-hooks@^4.3.0 eslint-config-prettier eslint-plugin-prettier prettier

# moving the folder.
cp -r "$path"/src .
cp -r "$path"/.env .
cp -r "$path"/tailwind.config.cjs .
cp -r "$path"/eslint/.prettierrc.json .
cp -r "$path"/eslint/.eslintrc.json .

echo "folder structure generated successfully"

bash "$path"/../gitinit.sh

echo "github repo created and code has been pushed successfully"
echo "starting the project, here we go"

npmAddScript -k lint -v "npx eslint ./src/ --ext .jsx,.js"
npmAddScript -k fix -v "npx eslint --fix"

# starting the project
npm run dev

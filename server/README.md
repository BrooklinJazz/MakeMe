# Cient

To start your client:
  * make sure you cd into the client folder
  * run yarn web, yarn android, or yarn ios

# Server

To start your Phoenix server:
  * make sure you cd into the server folder
  * Setup the project with `mix setup`
  * Start Phoenix endpoint with `mix phx.server`
  * create a .env file under server and place the following into the file.
  make sure to replace YOUR_DB_USERNAME with the result of running whoami in your terminal
  keep the quotations "" so if you run whoami and get patrickstar you should put in "patrickstar"

  ```
  export const DB_USERNAME="YOUR_DB_USERNAME"
  ```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

# ENV 

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

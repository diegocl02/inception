# Inception 42 Project

## Setup

1. Create a `.env` file under the `./srcs` directory with the following example content:

    ```
    DOMAIN_NAME=dicisner.42.fr

    MYSQL_HOSTNAME=mariadb
    MYSQL_DATABASE=wordpress
    MYSQL_USER=dicisner
    MYSQL_PASSWORD=batata1234
    MYSQL_ROOT_PASSWORD=potato1234

    VOLUME_DIR=/Users/diego/data
    ```

   Adjust the values in the `.env` file according to your specific requirements.

2. Update the `VOLUME_DIR` variable in the Makefile to match the desired directory path. Look for the `VOLUME_DIR` assignment in the Makefile and replace it with the desired directory path.

   Example:

```
   VOLUME_DIR=/path/to/your/volume/directory
```

Adjust the values in the `.env` file according to your specific requirements.

Remember to place the `.env` file in the correct directory (`./srcs`) for it to be properly used by the project.

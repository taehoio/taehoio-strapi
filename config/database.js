const path = require("path");

module.exports = ({ env }) => ({
  connection: {
    client: "mysql",
    connection: {
      host: env("DATABASE_HOST", "34.146.106.115"),
      port: env("DATABASE_PORT", 3306),
      database: env("DATABASE_NAME", "taehoio_strapi"),
      user: env("DATABASE_USERNAME", "taehoio_strapi_sa"),
      password: env("DATABASE_PASSWORD", ""),
      ssl: env("DATABASE_SSL", false),
    },
  },
});

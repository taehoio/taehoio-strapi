module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', '1046258a73c97ca0f19a6d8c78cd0b36'),
  },
});

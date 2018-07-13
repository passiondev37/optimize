module.exports = {
  '/api':
  {
    target: 'http://localhost',
    changeOrigin: true,
    secure: false,
    pathRewrite:
    {
      //'^\./api': '/api'
    }
  },
}

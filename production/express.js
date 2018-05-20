var express = require('express') // скобки в конце нужны для вызова конструктора
var app = express()

app.set('view engine', 'ejs')
app.get('/', function (req, res) {
  res.render('index', {iid:3, team:'RUS'})
})
// прослушивание порта 3000 
app.listen(3000)
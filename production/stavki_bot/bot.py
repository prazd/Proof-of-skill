import telebot
import web3
import json

web = web3.Web3(web3.Web3.HTTPProvider('http://0aeee473.ngrok.io'))
bot = telebot.TeleBot("613958317:AAH8j1U6nMHuW4F52n9Tj9m7D41iCgFEAUw")
conrt_addr = "0x0440e6e1569fb7d5198eD743d8BF3D7d5F5d2cFE"

@bot.message_handler(commands=['start'])
def hello(message):
    mes = bot.send_message(message.chat.id,"Здравствуйте\nПридумайте ключ, чтобы авторизоваться в сети")
    global acc_id
    acc_id = web.personal.newAccount(message.text)
    acc_key = message.text
    bot.register_next_step_handler(mes,stavki)

def stavki(message):
    keyboard = telebot.types.InlineKeyboardMarkup()
    ball = telebot.types.InlineKeyboardButton(text='Информация',callback_data='stav')
    keyboard.add(ball)
    bot.send_message(message.chat.id,"Адрес вашего аккаунта:"+str(acc_id)+"\n"+"Ваш баланс:"+str(web.eth.getBalance(web.eth.coinbase)),reply_markup=keyboard)

@bot.callback_query_handler(func=lambda call: True)
def fu(call):
    if call.data == 'stav':
       bot.edit_message_text(chat_id = call.message.chat.id, message_id = call.message.message_id, text = 'Вы можете сделать ставку на эфире, зайдя на наш сайт)')

if __name__ == "__main__":
    bot.polling(none_stop= True)

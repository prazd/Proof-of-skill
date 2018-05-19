import telebot
import config
bot = telebot.TeleBot(config.token)

@bot.message_handler(commands=["task"])
def test_message(message):
    bot.send_message(message.chat_id, message.text)


if __name__ == "__main__":
    bot.polling(none_stop=True)

# Description
#   A Hubot script for booklog
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot book <account> <count> - Answer booklist.
#
# Author:
#   dnaga392
#
# Reference:
#   http://log.chocolateboard.net/jquery-akbooklog/
#   http://qiita.com/Kta-M/items/d7e0f371e40b4cefc38a
#   http://jsonmate.com/
#   http://hacknote.jp/archives/3679/
#

module.exports = (robot) ->
  robot.respond /book\s+(.*)\s+(\d+)$/i, (msg) ->
    api_url = "http://api.booklog.jp/json/"
    account = msg.match[1]
    api_url += account
    request = robot.http(api_url)
                   .query(category: "0")
                   .query(count: msg.match[2])
                   .get()
    request (err, res, body)->
      json = JSON.parse body
      books = json['books']
      book_count = 0
      max = msg.match[2]-1
      answer = ""
      for i in [0..max]
        book = books[i]
        if book['title']?
          book_count += 1
          answer += "● #{book['title']} - #{book['author']}\n"
      answer += "#{book_count}冊あったよ"
      msg.send answer

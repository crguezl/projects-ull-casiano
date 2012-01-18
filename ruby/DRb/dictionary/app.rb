require "drb/drb"

DRb.start_service
dict = DRbObject.new_with_uri('druby://localhost:23456')


info = dict['logger info']
logger = dict['logger']

p info
p logger

logger.log("Hello World")
logger.log("Hello Again!")

-----------------------------------------------------------------------
-- Lua Script Wireshark Dissector
-- 
-- Please see end of file for rules and regulations
-----------------------------------------------------------------------

-- Miax cTom v11 Protocol
local miax_ctom_v11 = Proto("miax.ctom.v11.lua", "Miax cTom v11 Protocol")

-- Component Tables
local show = {}
local display = {}
local dissect = {}
local calculate = {}
local verify = {}

-----------------------------------------------------------------------
-- Declare Dissection Options
-----------------------------------------------------------------------

-- Miax cTom v11 Protocol Element Dissection Options
show.application_message = true
show.complex_double_sided_top_of_market_compact_message = true
show.complex_strategy_definition_message = true
show.complex_top_of_market_bid_compact_message = true
show.complex_top_of_market_offer_compact_message = true
show.leg_definition = true
show.message = true
show.packet = true
show.series_update = true
show.strategy_trade_message = true
show.system_state_message = true
show.system_time_message = true
show.underlying_trading_status_message = true
show.wide_complex_double_sided_top_of_market_message = true
show.wide_complex_top_of_market_bid_message = true
show.wide_complex_top_of_market_offer_message = true
show.data = true
show.payload = true

-----------------------------------------------------------------------
-- Declare Protocol Fields
-----------------------------------------------------------------------

-- Miax cTom v11 Protocol Fields
miax_ctom_v11.fields.active_on_miax = ProtoField.new("Active On Miax", "miax.ctom.v11.activeonmiax", ftypes.STRING)
miax_ctom_v11.fields.application_message = ProtoField.new("Application Message", "miax.ctom.v11.applicationmessage", ftypes.STRING)
miax_ctom_v11.fields.bid_condition = ProtoField.new("Bid Condition", "miax.ctom.v11.bidcondition", ftypes.STRING)
miax_ctom_v11.fields.callor_put = ProtoField.new("Callor Put", "miax.ctom.v11.callorput", ftypes.STRING)
miax_ctom_v11.fields.closing_time = ProtoField.new("Closing Time", "miax.ctom.v11.closingtime", ftypes.STRING)
miax_ctom_v11.fields.compact_bid_price = ProtoField.new("Compact Bid Price", "miax.ctom.v11.compactbidprice", ftypes.INT16)
miax_ctom_v11.fields.compact_bid_size = ProtoField.new("Compact Bid Size", "miax.ctom.v11.compactbidsize", ftypes.UINT16)
miax_ctom_v11.fields.compact_offer_price = ProtoField.new("Compact Offer Price", "miax.ctom.v11.compactofferprice", ftypes.INT16)
miax_ctom_v11.fields.compact_offer_size = ProtoField.new("Compact Offer Size", "miax.ctom.v11.compactoffersize", ftypes.UINT16)
miax_ctom_v11.fields.compact_price = ProtoField.new("Compact Price", "miax.ctom.v11.compactprice", ftypes.INT16)
miax_ctom_v11.fields.compact_size = ProtoField.new("Compact Size", "miax.ctom.v11.compactsize", ftypes.UINT16)
miax_ctom_v11.fields.complex_double_sided_top_of_market_compact_message = ProtoField.new("Complex Double-Sided Top of Market Compact Message", "miax.ctom.v11.complexdoublesidedtopofmarketcompactmessage", ftypes.STRING)
miax_ctom_v11.fields.complex_strategy_definition_message = ProtoField.new("Complex Strategy Definition Message", "miax.ctom.v11.complexstrategydefinitionmessage", ftypes.STRING)
miax_ctom_v11.fields.complex_top_of_market_bid_compact_message = ProtoField.new("Complex Top Of Market Bid Compact Message", "miax.ctom.v11.complextopofmarketbidcompactmessage", ftypes.STRING)
miax_ctom_v11.fields.complex_top_of_market_offer_compact_message = ProtoField.new("Complex Top Of Market Offer Compact Message", "miax.ctom.v11.complextopofmarketoffercompactmessage", ftypes.STRING)
miax_ctom_v11.fields.data = ProtoField.new("Data", "miax.ctom.v11.data", ftypes.STRING)
miax_ctom_v11.fields.event_reason = ProtoField.new("Event Reason", "miax.ctom.v11.eventreason", ftypes.STRING)
miax_ctom_v11.fields.expected_event_time_nano_seconds_part = ProtoField.new("Expected Event Time Nano Seconds Part", "miax.ctom.v11.expectedeventtimenanosecondspart", ftypes.UINT32)
miax_ctom_v11.fields.expiration_date = ProtoField.new("Expiration Date", "miax.ctom.v11.expirationdate", ftypes.STRING)
miax_ctom_v11.fields.leg_definition = ProtoField.new("Leg Definition", "miax.ctom.v11.legdefinition", ftypes.STRING)
miax_ctom_v11.fields.leg_ratio_qty = ProtoField.new("Leg Ratio Qty", "miax.ctom.v11.legratioqty", ftypes.UINT16)
miax_ctom_v11.fields.leg_side = ProtoField.new("Leg Side", "miax.ctom.v11.legside", ftypes.UINT8)
miax_ctom_v11.fields.liquidity_acceptance_increment_indicator = ProtoField.new("Liquidity Acceptance Increment Indicator", "miax.ctom.v11.liquidityacceptanceincrementindicator", ftypes.STRING)
miax_ctom_v11.fields.long_term_option = ProtoField.new("Long Term Option", "miax.ctom.v11.longtermoption", ftypes.STRING)
miax_ctom_v11.fields.message = ProtoField.new("Message", "miax.ctom.v11.message", ftypes.STRING)
miax_ctom_v11.fields.message_type = ProtoField.new("Message Type", "miax.ctom.v11.messagetype", ftypes.STRING)
miax_ctom_v11.fields.miaxbbo_posting_increment_indicator = ProtoField.new("MIAXBBO Posting Increment Indicator", "miax.ctom.v11.miaxbbopostingincrementindicator", ftypes.STRING)
miax_ctom_v11.fields.net_price = ProtoField.new("Net Price", "miax.ctom.v11.netprice", ftypes.INT64)
miax_ctom_v11.fields.notification_time = ProtoField.new("Notification Time", "miax.ctom.v11.notificationtime", ftypes.UINT32)
miax_ctom_v11.fields.numberof_legs = ProtoField.new("Numberof Legs", "miax.ctom.v11.numberoflegs", ftypes.UINT8)
miax_ctom_v11.fields.offer_condition = ProtoField.new("Offer Condition", "miax.ctom.v11.offercondition", ftypes.STRING)
miax_ctom_v11.fields.opening_time = ProtoField.new("Opening Time", "miax.ctom.v11.openingtime", ftypes.STRING)
miax_ctom_v11.fields.opening_underlying_market_code = ProtoField.new("Opening Underlying Market Code", "miax.ctom.v11.openingunderlyingmarketcode", ftypes.STRING)
miax_ctom_v11.fields.packet = ProtoField.new("packet", "miax.ctom.v11.packet", ftypes.STRING)
miax_ctom_v11.fields.packet_length = ProtoField.new("Packet Length", "miax.ctom.v11.packetlength", ftypes.UINT16)
miax_ctom_v11.fields.packet_type = ProtoField.new("Packet Type", "miax.ctom.v11.packettype", ftypes.UINT8)
miax_ctom_v11.fields.payload = ProtoField.new("Payload", "miax.ctom.v11.payload", ftypes.STRING)
miax_ctom_v11.fields.priority_quote_width = ProtoField.new("Priority Quote Width", "miax.ctom.v11.priorityquotewidth", ftypes.UINT32)
miax_ctom_v11.fields.product_add__update_time = ProtoField.new("Product Add/ Update Time", "miax.ctom.v11.productaddupdatetime", ftypes.UINT32)
miax_ctom_v11.fields.product_id = ProtoField.new("Product ID", "miax.ctom.v11.productid", ftypes.UINT32)
miax_ctom_v11.fields.reserved1 = ProtoField.new("Reserved1", "miax.ctom.v11.reserved1", ftypes.BYTES)
miax_ctom_v11.fields.reserved10 = ProtoField.new("Reserved10", "miax.ctom.v11.reserved10", ftypes.BYTES)
miax_ctom_v11.fields.reserved16 = ProtoField.new("Reserved16", "miax.ctom.v11.reserved16", ftypes.BYTES)
miax_ctom_v11.fields.reserved2 = ProtoField.new("Reserved2", "miax.ctom.v11.reserved2", ftypes.BYTES)
miax_ctom_v11.fields.reserved4 = ProtoField.new("Reserved4", "miax.ctom.v11.reserved4", ftypes.BYTES)
miax_ctom_v11.fields.reserved8 = ProtoField.new("Reserved8", "miax.ctom.v11.reserved8", ftypes.BYTES)
miax_ctom_v11.fields.restricted_option = ProtoField.new("Restricted Option", "miax.ctom.v11.restrictedoption", ftypes.STRING)
miax_ctom_v11.fields.seconds_part = ProtoField.new("Seconds Part", "miax.ctom.v11.secondspart", ftypes.UINT32)
miax_ctom_v11.fields.security_symbol = ProtoField.new("Security Symbol", "miax.ctom.v11.securitysymbol", ftypes.STRING)
miax_ctom_v11.fields.sequence_number = ProtoField.new("Sequence Number", "miax.ctom.v11.sequencenumber", ftypes.UINT64)
miax_ctom_v11.fields.series_update = ProtoField.new("Series Update", "miax.ctom.v11.seriesupdate", ftypes.STRING)
miax_ctom_v11.fields.session_id = ProtoField.new("Session ID", "miax.ctom.v11.sessionid", ftypes.UINT32)
miax_ctom_v11.fields.session_number = ProtoField.new("Session Number", "miax.ctom.v11.sessionnumber", ftypes.UINT8)
miax_ctom_v11.fields.strategy_add_time = ProtoField.new("Strategy Add Time", "miax.ctom.v11.strategyaddtime", ftypes.UINT32)
miax_ctom_v11.fields.strategy_id = ProtoField.new("Strategy ID", "miax.ctom.v11.strategyid", ftypes.UINT32)
miax_ctom_v11.fields.strategy_trade_message = ProtoField.new("Strategy Trade Message", "miax.ctom.v11.strategytrademessage", ftypes.STRING)
miax_ctom_v11.fields.strike_price = ProtoField.new("Strike Price", "miax.ctom.v11.strikeprice", ftypes.UINT32)
miax_ctom_v11.fields.system_state_message = ProtoField.new("System State Message", "miax.ctom.v11.systemstatemessage", ftypes.STRING)
miax_ctom_v11.fields.system_status = ProtoField.new("System Status", "miax.ctom.v11.systemstatus", ftypes.STRING)
miax_ctom_v11.fields.system_time_message = ProtoField.new("System Time Message", "miax.ctom.v11.systemtimemessage", ftypes.STRING)
miax_ctom_v11.fields.timestamp = ProtoField.new("Timestamp", "miax.ctom.v11.timestamp", ftypes.UINT32)
miax_ctom_v11.fields.top_of_market_quote_condition = ProtoField.new("Top Of Market Quote Condition", "miax.ctom.v11.topofmarketquotecondition", ftypes.STRING)
miax_ctom_v11.fields.trade_condition = ProtoField.new("Trade Condition", "miax.ctom.v11.tradecondition", ftypes.STRING)
miax_ctom_v11.fields.trade_id = ProtoField.new("Trade ID", "miax.ctom.v11.tradeid", ftypes.UINT32)
miax_ctom_v11.fields.trade_size = ProtoField.new("Trade Size", "miax.ctom.v11.tradesize", ftypes.UINT32)
miax_ctom_v11.fields.trading_status = ProtoField.new("Trading Status", "miax.ctom.v11.tradingstatus", ftypes.STRING)
miax_ctom_v11.fields.underlying_symbol = ProtoField.new("Underlying Symbol", "miax.ctom.v11.underlyingsymbol", ftypes.STRING)
miax_ctom_v11.fields.underlying_trading_status_message = ProtoField.new("Underlying Trading Status Message", "miax.ctom.v11.underlyingtradingstatusmessage", ftypes.STRING)
miax_ctom_v11.fields.update_reason = ProtoField.new("Update Reason", "miax.ctom.v11.updatereason", ftypes.STRING)
miax_ctom_v11.fields.version = ProtoField.new("Version", "miax.ctom.v11.version", ftypes.STRING)
miax_ctom_v11.fields.wide_bid_price = ProtoField.new("Wide Bid Price", "miax.ctom.v11.widebidprice", ftypes.INT64)
miax_ctom_v11.fields.wide_bid_size = ProtoField.new("Wide Bid Size", "miax.ctom.v11.widebidsize", ftypes.UINT32)
miax_ctom_v11.fields.wide_complex_double_sided_top_of_market_message = ProtoField.new("Wide Complex Double Sided Top of Market Message", "miax.ctom.v11.widecomplexdoublesidedtopofmarketmessage", ftypes.STRING)
miax_ctom_v11.fields.wide_complex_top_of_market_bid_message = ProtoField.new("Wide Complex Top Of Market Bid Message", "miax.ctom.v11.widecomplextopofmarketbidmessage", ftypes.STRING)
miax_ctom_v11.fields.wide_complex_top_of_market_offer_message = ProtoField.new("Wide Complex Top Of Market Offer Message", "miax.ctom.v11.widecomplextopofmarketoffermessage", ftypes.STRING)
miax_ctom_v11.fields.wide_offer_price = ProtoField.new("Wide Offer Price", "miax.ctom.v11.wideofferprice", ftypes.INT64)
miax_ctom_v11.fields.wide_offer_size = ProtoField.new("Wide Offer Size", "miax.ctom.v11.wideoffersize", ftypes.UINT32)
miax_ctom_v11.fields.wide_price = ProtoField.new("Wide Price", "miax.ctom.v11.wideprice", ftypes.INT64)
miax_ctom_v11.fields.wide_size = ProtoField.new("Wide Size", "miax.ctom.v11.widesize", ftypes.UINT32)

-----------------------------------------------------------------------
-- Dissect Miax cTom v11 Protocol
-----------------------------------------------------------------------

-- Display Expected Event Time Nano Seconds Part
display.expected_event_time_nano_seconds_part = function(value)
  return "Expected Event Time Nano Seconds Part: "..value
end

-- Dissect Expected Event Time Nano Seconds Part Field
dissect.expected_event_time_nano_seconds_part = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.expected_event_time_nano_seconds_part(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.expected_event_time_nano_seconds_part, range, value, display)

  return offset + size
end

-- Display Seconds Part
display.seconds_part = function(value)
  return "Seconds Part: "..value
end

-- Dissect Seconds Part Field
dissect.seconds_part = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.seconds_part(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.seconds_part, range, value, display)

  return offset + size
end

-- Display Field: Event Reason
display.event_reason = function(value)
  if value == "A" then
    return "Event Reason: Automatic (A)"
  end
  if value == "M" then
    return "Event Reason: Manual (M)"
  end

  return "Event Reason: Unknown("..value..")"
end

-- Dissect Event Reason Field
dissect.event_reason = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.event_reason(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.event_reason, range, value, display)

  return offset + size
end

-- Display Field: Trading Status
display.trading_status = function(value)
  if value == "H" then
    return "Trading Status: Halted (H)"
  end
  if value == "R" then
    return "Trading Status: Resumed (R)"
  end
  if value == "O" then
    return "Trading Status: Opened (O)"
  end

  return "Trading Status: Unknown("..value..")"
end

-- Dissect Trading Status Field
dissect.trading_status = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.trading_status(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.trading_status, range, value, display)

  return offset + size
end

-- Display Underlying Symbol
display.underlying_symbol = function(value)
  return "Underlying Symbol: "..value
end

-- Dissect Underlying Symbol Field
dissect.underlying_symbol = function(buffer, offset, packet, parent)
  local size = 11
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.underlying_symbol(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.underlying_symbol, range, value, display)

  return offset + size
end

-- Display Timestamp
display.timestamp = function(value)
  return "Timestamp: "..value
end

-- Dissect Timestamp Field
dissect.timestamp = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.timestamp(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.timestamp, range, value, display)

  return offset + size
end

-- Display function for: Underlying Trading Status Message
display.underlying_trading_status_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Underlying Trading Status Message Fields
dissect.underlying_trading_status_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Underlying Symbol: Fixed Size String Field 11 bytes
  index = dissect.underlying_symbol(buffer, index, packet, parent)

  -- Trading Status: Character Enum with 3 values
  index = dissect.trading_status(buffer, index, packet, parent)

  -- Event Reason: Character Enum with 2 values
  index = dissect.event_reason(buffer, index, packet, parent)

  -- Seconds Part: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.seconds_part(buffer, index, packet, parent)

  -- Expected Event Time Nano Seconds Part: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.expected_event_time_nano_seconds_part(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Underlying Trading Status Message
dissect.underlying_trading_status_message = function(buffer, offset, packet, parent)
  if not show.underlying_trading_status_message then
    return dissect.underlying_trading_status_message_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 25)
  local display = display.underlying_trading_status_message(buffer, packet, parent)
  local element = parent:add(miax_ctom_v11.fields.underlying_trading_status_message, range, display)

  return dissect.underlying_trading_status_message_fields(buffer, offset, packet, element)
end

-- Display Reserved16
display.reserved16 = function(value)
  return "Reserved16: "..value
end

-- Dissect Reserved16 Field
dissect.reserved16 = function(buffer, offset, packet, parent)
  local size = 16
  local range = buffer(offset, size)
  local value = range:bytes():tohex(false, " ")
  local display = display.reserved16(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.reserved16, range, value, display)

  return offset + size
end

-- Display Field: Trade Condition
display.trade_condition = function(value)
  if value == "S" then
    return "Trade Condition: Matched (S)"
  end
  if value == "L" then
    return "Trade Condition: Legged (L)"
  end

  return "Trade Condition: Unknown("..value..")"
end

-- Dissect Trade Condition Field
dissect.trade_condition = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.trade_condition(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.trade_condition, range, value, display)

  return offset + size
end

-- Display Trade Size
display.trade_size = function(value)
  return "Trade Size: "..value
end

-- Dissect Trade Size Field
dissect.trade_size = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.trade_size(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.trade_size, range, value, display)

  return offset + size
end

-- Display Net Price
display.net_price = function(value)
  return "Net Price: "..value
end

-- Dissect Net Price Field
dissect.net_price = function(buffer, offset, packet, parent)
  local size = 8
  local range = buffer(offset, size)
  local value = range:le_int64()
  local display = display.net_price(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.net_price, range, value, display)

  return offset + size
end

-- Display Trade ID
display.trade_id = function(value)
  return "Trade ID: "..value
end

-- Dissect Trade ID Field
dissect.trade_id = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.trade_id(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.trade_id, range, value, display)

  return offset + size
end

-- Display Strategy ID
display.strategy_id = function(value)
  return "Strategy ID: "..value
end

-- Dissect Strategy ID Field
dissect.strategy_id = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.strategy_id(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.strategy_id, range, value, display)

  return offset + size
end

-- Display function for: Strategy Trade Message
display.strategy_trade_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Strategy Trade Message Fields
dissect.strategy_trade_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Strategy ID: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.strategy_id(buffer, index, packet, parent)

  -- Trade ID: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.trade_id(buffer, index, packet, parent)

  -- Net Price: Signed 8 Byte Integer, LittleEndian
  index = dissect.net_price(buffer, index, packet, parent)

  -- Trade Size: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.trade_size(buffer, index, packet, parent)

  -- Trade Condition: Character Enum with 2 values
  index = dissect.trade_condition(buffer, index, packet, parent)

  -- Reserved16: 16 Byte Fixed Size Array
  index = dissect.reserved16(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Strategy Trade Message
dissect.strategy_trade_message = function(buffer, offset, packet, parent)
  if not show.strategy_trade_message then
    return dissect.strategy_trade_message_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 41)
  local display = display.strategy_trade_message(buffer, packet, parent)
  local element = parent:add(miax_ctom_v11.fields.strategy_trade_message, range, display)

  return dissect.strategy_trade_message_fields(buffer, offset, packet, element)
end

-- Display Field: Offer Condition
display.offer_condition = function(value)
  if value == "A" then
    return "Offer Condition: Regular (A)"
  end
  if value == "T" then
    return "Offer Condition: Trading Halt (T)"
  end
  if value == "W" then
    return "Offer Condition: Wide (W)"
  end
  if value == "S" then
    return "Offer Condition: Simple Auction (S)"
  end
  if value == "C" then
    return "Offer Condition: Complex Auction (C)"
  end
  if value == "M" then
    return "Offer Condition: Simple Market Protection (M)"
  end
  if value == "L" then
    return "Offer Condition: Leg Market Protection (L)"
  end

  return "Offer Condition: Unknown("..value..")"
end

-- Dissect Offer Condition Field
dissect.offer_condition = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.offer_condition(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.offer_condition, range, value, display)

  return offset + size
end

-- Display Reserved4
display.reserved4 = function(value)
  return "Reserved4: "..value
end

-- Dissect Reserved4 Field
dissect.reserved4 = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:bytes():tohex(false, " ")
  local display = display.reserved4(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.reserved4, range, value, display)

  return offset + size
end

-- Display Wide Offer Size
display.wide_offer_size = function(value)
  return "Wide Offer Size: "..value
end

-- Dissect Wide Offer Size Field
dissect.wide_offer_size = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.wide_offer_size(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.wide_offer_size, range, value, display)

  return offset + size
end

-- Display Wide Offer Price
display.wide_offer_price = function(value)
  return "Wide Offer Price: "..value
end

-- Dissect Wide Offer Price Field
dissect.wide_offer_price = function(buffer, offset, packet, parent)
  local size = 8
  local range = buffer(offset, size)
  local value = range:le_int64()
  local display = display.wide_offer_price(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.wide_offer_price, range, value, display)

  return offset + size
end

-- Display Field: Bid Condition
display.bid_condition = function(value)
  if value == "A" then
    return "Bid Condition: Regular (A)"
  end
  if value == "T" then
    return "Bid Condition: Trading Halt (T)"
  end
  if value == "W" then
    return "Bid Condition: Wide (W)"
  end
  if value == "S" then
    return "Bid Condition: Simple Auction (S)"
  end
  if value == "C" then
    return "Bid Condition: Complex Auction (C)"
  end
  if value == "M" then
    return "Bid Condition: Simple Market Protection (M)"
  end
  if value == "L" then
    return "Bid Condition: Leg Market Protection (L)"
  end

  return "Bid Condition: Unknown("..value..")"
end

-- Dissect Bid Condition Field
dissect.bid_condition = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.bid_condition(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.bid_condition, range, value, display)

  return offset + size
end

-- Display Wide Bid Size
display.wide_bid_size = function(value)
  return "Wide Bid Size: "..value
end

-- Dissect Wide Bid Size Field
dissect.wide_bid_size = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.wide_bid_size(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.wide_bid_size, range, value, display)

  return offset + size
end

-- Display Wide Bid Price
display.wide_bid_price = function(value)
  return "Wide Bid Price: "..value
end

-- Dissect Wide Bid Price Field
dissect.wide_bid_price = function(buffer, offset, packet, parent)
  local size = 8
  local range = buffer(offset, size)
  local value = range:le_int64()
  local display = display.wide_bid_price(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.wide_bid_price, range, value, display)

  return offset + size
end

-- Display function for: Wide Complex Double Sided Top of Market Message
display.wide_complex_double_sided_top_of_market_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Wide Complex Double Sided Top of Market Message Fields
dissect.wide_complex_double_sided_top_of_market_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Strategy ID: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.strategy_id(buffer, index, packet, parent)

  -- Wide Bid Price: Signed 8 Byte Integer, LittleEndian
  index = dissect.wide_bid_price(buffer, index, packet, parent)

  -- Wide Bid Size: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.wide_bid_size(buffer, index, packet, parent)

  -- Reserved4: 4 Byte Fixed Size Array
  index = dissect.reserved4(buffer, index, packet, parent)

  -- Bid Condition: Character Enum with 7 values
  index = dissect.bid_condition(buffer, index, packet, parent)

  -- Wide Offer Price: Signed 8 Byte Integer, LittleEndian
  index = dissect.wide_offer_price(buffer, index, packet, parent)

  -- Wide Offer Size: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.wide_offer_size(buffer, index, packet, parent)

  -- Reserved4: 4 Byte Fixed Size Array
  index = dissect.reserved4(buffer, index, packet, parent)

  -- Offer Condition: Character Enum with 7 values
  index = dissect.offer_condition(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Wide Complex Double Sided Top of Market Message
dissect.wide_complex_double_sided_top_of_market_message = function(buffer, offset, packet, parent)
  if not show.wide_complex_double_sided_top_of_market_message then
    return dissect.wide_complex_double_sided_top_of_market_message_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 42)
  local display = display.wide_complex_double_sided_top_of_market_message(buffer, packet, parent)
  local element = parent:add(miax_ctom_v11.fields.wide_complex_double_sided_top_of_market_message, range, display)

  return dissect.wide_complex_double_sided_top_of_market_message_fields(buffer, offset, packet, element)
end

-- Display Reserved2
display.reserved2 = function(value)
  return "Reserved2: "..value
end

-- Dissect Reserved2 Field
dissect.reserved2 = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:bytes():tohex(false, " ")
  local display = display.reserved2(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.reserved2, range, value, display)

  return offset + size
end

-- Display Compact Offer Size
display.compact_offer_size = function(value)
  return "Compact Offer Size: "..value
end

-- Dissect Compact Offer Size Field
dissect.compact_offer_size = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.compact_offer_size(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.compact_offer_size, range, value, display)

  return offset + size
end

-- Display Compact Offer Price
display.compact_offer_price = function(value)
  return "Compact Offer Price: "..value
end

-- Dissect Compact Offer Price Field
dissect.compact_offer_price = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:le_int()
  local display = display.compact_offer_price(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.compact_offer_price, range, value, display)

  return offset + size
end

-- Display Compact Bid Size
display.compact_bid_size = function(value)
  return "Compact Bid Size: "..value
end

-- Dissect Compact Bid Size Field
dissect.compact_bid_size = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.compact_bid_size(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.compact_bid_size, range, value, display)

  return offset + size
end

-- Display Compact Bid Price
display.compact_bid_price = function(value)
  return "Compact Bid Price: "..value
end

-- Dissect Compact Bid Price Field
dissect.compact_bid_price = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:le_int()
  local display = display.compact_bid_price(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.compact_bid_price, range, value, display)

  return offset + size
end

-- Display function for: Complex Double-Sided Top of Market Compact Message
display.complex_double_sided_top_of_market_compact_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Complex Double-Sided Top of Market Compact Message Fields
dissect.complex_double_sided_top_of_market_compact_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Strategy ID: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.strategy_id(buffer, index, packet, parent)

  -- Compact Bid Price: Signed 2 Byte Integer, LittleEndian
  index = dissect.compact_bid_price(buffer, index, packet, parent)

  -- Compact Bid Size: Unsigned 2 Byte Integer, LittleEndian
  index = dissect.compact_bid_size(buffer, index, packet, parent)

  -- Reserved2: 2 Byte Fixed Size Array
  index = dissect.reserved2(buffer, index, packet, parent)

  -- Bid Condition: Character Enum with 7 values
  index = dissect.bid_condition(buffer, index, packet, parent)

  -- Compact Offer Price: Signed 2 Byte Integer, LittleEndian
  index = dissect.compact_offer_price(buffer, index, packet, parent)

  -- Compact Offer Size: Unsigned 2 Byte Integer, LittleEndian
  index = dissect.compact_offer_size(buffer, index, packet, parent)

  -- Reserved2: 2 Byte Fixed Size Array
  index = dissect.reserved2(buffer, index, packet, parent)

  -- Offer Condition: Character Enum with 7 values
  index = dissect.offer_condition(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Complex Double-Sided Top of Market Compact Message
dissect.complex_double_sided_top_of_market_compact_message = function(buffer, offset, packet, parent)
  if not show.complex_double_sided_top_of_market_compact_message then
    return dissect.complex_double_sided_top_of_market_compact_message_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 22)
  local display = display.complex_double_sided_top_of_market_compact_message(buffer, packet, parent)
  local element = parent:add(miax_ctom_v11.fields.complex_double_sided_top_of_market_compact_message, range, display)

  return dissect.complex_double_sided_top_of_market_compact_message_fields(buffer, offset, packet, element)
end

-- Display Field: Top Of Market Quote Condition
display.top_of_market_quote_condition = function(value)
  if value == "H" then
    return "Top Of Market Quote Condition: Halted (H)"
  end
  if value == "R" then
    return "Top Of Market Quote Condition: Resumed (R)"
  end
  if value == "O" then
    return "Top Of Market Quote Condition: Opened (O)"
  end

  return "Top Of Market Quote Condition: Unknown("..value..")"
end

-- Dissect Top Of Market Quote Condition Field
dissect.top_of_market_quote_condition = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.top_of_market_quote_condition(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.top_of_market_quote_condition, range, value, display)

  return offset + size
end

-- Display Wide Size
display.wide_size = function(value)
  return "Wide Size: "..value
end

-- Dissect Wide Size Field
dissect.wide_size = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.wide_size(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.wide_size, range, value, display)

  return offset + size
end

-- Display Wide Price
display.wide_price = function(value)
  return "Wide Price: "..value
end

-- Dissect Wide Price Field
dissect.wide_price = function(buffer, offset, packet, parent)
  local size = 8
  local range = buffer(offset, size)
  local value = range:le_int64()
  local display = display.wide_price(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.wide_price, range, value, display)

  return offset + size
end

-- Display function for: Wide Complex Top Of Market Offer Message
display.wide_complex_top_of_market_offer_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Wide Complex Top Of Market Offer Message Fields
dissect.wide_complex_top_of_market_offer_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Strategy ID: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.strategy_id(buffer, index, packet, parent)

  -- Wide Price: Signed 8 Byte Integer, LittleEndian
  index = dissect.wide_price(buffer, index, packet, parent)

  -- Wide Size: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.wide_size(buffer, index, packet, parent)

  -- Reserved4: 4 Byte Fixed Size Array
  index = dissect.reserved4(buffer, index, packet, parent)

  -- Top Of Market Quote Condition: Character Enum with 3 values
  index = dissect.top_of_market_quote_condition(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Wide Complex Top Of Market Offer Message
dissect.wide_complex_top_of_market_offer_message = function(buffer, offset, packet, parent)
  if not show.wide_complex_top_of_market_offer_message then
    return dissect.wide_complex_top_of_market_offer_message_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 25)
  local display = display.wide_complex_top_of_market_offer_message(buffer, packet, parent)
  local element = parent:add(miax_ctom_v11.fields.wide_complex_top_of_market_offer_message, range, display)

  return dissect.wide_complex_top_of_market_offer_message_fields(buffer, offset, packet, element)
end

-- Display function for: Wide Complex Top Of Market Bid Message
display.wide_complex_top_of_market_bid_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Wide Complex Top Of Market Bid Message Fields
dissect.wide_complex_top_of_market_bid_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Strategy ID: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.strategy_id(buffer, index, packet, parent)

  -- Wide Price: Signed 8 Byte Integer, LittleEndian
  index = dissect.wide_price(buffer, index, packet, parent)

  -- Wide Size: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.wide_size(buffer, index, packet, parent)

  -- Reserved4: 4 Byte Fixed Size Array
  index = dissect.reserved4(buffer, index, packet, parent)

  -- Top Of Market Quote Condition: Character Enum with 3 values
  index = dissect.top_of_market_quote_condition(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Wide Complex Top Of Market Bid Message
dissect.wide_complex_top_of_market_bid_message = function(buffer, offset, packet, parent)
  if not show.wide_complex_top_of_market_bid_message then
    return dissect.wide_complex_top_of_market_bid_message_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 25)
  local display = display.wide_complex_top_of_market_bid_message(buffer, packet, parent)
  local element = parent:add(miax_ctom_v11.fields.wide_complex_top_of_market_bid_message, range, display)

  return dissect.wide_complex_top_of_market_bid_message_fields(buffer, offset, packet, element)
end

-- Display Compact Size
display.compact_size = function(value)
  return "Compact Size: "..value
end

-- Dissect Compact Size Field
dissect.compact_size = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.compact_size(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.compact_size, range, value, display)

  return offset + size
end

-- Display Compact Price
display.compact_price = function(value)
  return "Compact Price: "..value
end

-- Dissect Compact Price Field
dissect.compact_price = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:le_int()
  local display = display.compact_price(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.compact_price, range, value, display)

  return offset + size
end

-- Display function for: Complex Top Of Market Offer Compact Message
display.complex_top_of_market_offer_compact_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Complex Top Of Market Offer Compact Message Fields
dissect.complex_top_of_market_offer_compact_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Strategy ID: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.strategy_id(buffer, index, packet, parent)

  -- Compact Price: Signed 2 Byte Integer, LittleEndian
  index = dissect.compact_price(buffer, index, packet, parent)

  -- Compact Size: Unsigned 2 Byte Integer, LittleEndian
  index = dissect.compact_size(buffer, index, packet, parent)

  -- Reserved2: 2 Byte Fixed Size Array
  index = dissect.reserved2(buffer, index, packet, parent)

  -- Top Of Market Quote Condition: Character Enum with 3 values
  index = dissect.top_of_market_quote_condition(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Complex Top Of Market Offer Compact Message
dissect.complex_top_of_market_offer_compact_message = function(buffer, offset, packet, parent)
  if not show.complex_top_of_market_offer_compact_message then
    return dissect.complex_top_of_market_offer_compact_message_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 15)
  local display = display.complex_top_of_market_offer_compact_message(buffer, packet, parent)
  local element = parent:add(miax_ctom_v11.fields.complex_top_of_market_offer_compact_message, range, display)

  return dissect.complex_top_of_market_offer_compact_message_fields(buffer, offset, packet, element)
end

-- Display function for: Complex Top Of Market Bid Compact Message
display.complex_top_of_market_bid_compact_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Complex Top Of Market Bid Compact Message Fields
dissect.complex_top_of_market_bid_compact_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Strategy ID: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.strategy_id(buffer, index, packet, parent)

  -- Compact Price: Signed 2 Byte Integer, LittleEndian
  index = dissect.compact_price(buffer, index, packet, parent)

  -- Compact Size: Unsigned 2 Byte Integer, LittleEndian
  index = dissect.compact_size(buffer, index, packet, parent)

  -- Reserved2: 2 Byte Fixed Size Array
  index = dissect.reserved2(buffer, index, packet, parent)

  -- Top Of Market Quote Condition: Character Enum with 3 values
  index = dissect.top_of_market_quote_condition(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Complex Top Of Market Bid Compact Message
dissect.complex_top_of_market_bid_compact_message = function(buffer, offset, packet, parent)
  if not show.complex_top_of_market_bid_compact_message then
    return dissect.complex_top_of_market_bid_compact_message_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 15)
  local display = display.complex_top_of_market_bid_compact_message(buffer, packet, parent)
  local element = parent:add(miax_ctom_v11.fields.complex_top_of_market_bid_compact_message, range, display)

  return dissect.complex_top_of_market_bid_compact_message_fields(buffer, offset, packet, element)
end

-- Display Field: System Status
display.system_status = function(value)
  if value == "S" then
    return "System Status: Startof System Hours (S)"
  end
  if value == "C" then
    return "System Status: Endof Systemhours (C)"
  end
  if value == "1" then
    return "System Status: Start Test Session (1)"
  end
  if value == "2" then
    return "System Status: Endof Test Session (2)"
  end

  return "System Status: Unknown("..value..")"
end

-- Dissect System Status Field
dissect.system_status = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.system_status(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.system_status, range, value, display)

  return offset + size
end

-- Display Session ID
display.session_id = function(value)
  return "Session ID: "..value
end

-- Dissect Session ID Field
dissect.session_id = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.session_id(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.session_id, range, value, display)

  return offset + size
end

-- Display Version
display.version = function(value)
  return "Version: "..value
end

-- Dissect Version Field
dissect.version = function(buffer, offset, packet, parent)
  local size = 8
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.version(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.version, range, value, display)

  return offset + size
end

-- Display Notification Time
display.notification_time = function(value)
  return "Notification Time: "..value
end

-- Dissect Notification Time Field
dissect.notification_time = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.notification_time(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.notification_time, range, value, display)

  return offset + size
end

-- Display function for: System State Message
display.system_state_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect System State Message Fields
dissect.system_state_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Notification Time: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.notification_time(buffer, index, packet, parent)

  -- Version: Fixed Size String Field 8 bytes
  index = dissect.version(buffer, index, packet, parent)

  -- Session ID: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.session_id(buffer, index, packet, parent)

  -- System Status: Character Enum with 4 values
  index = dissect.system_status(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: System State Message
dissect.system_state_message = function(buffer, offset, packet, parent)
  if not show.system_state_message then
    return dissect.system_state_message_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 17)
  local display = display.system_state_message(buffer, packet, parent)
  local element = parent:add(miax_ctom_v11.fields.system_state_message, range, display)

  return dissect.system_state_message_fields(buffer, offset, packet, element)
end

-- Display Reserved8
display.reserved8 = function(value)
  return "Reserved8: "..value
end

-- Dissect Reserved8 Field
dissect.reserved8 = function(buffer, offset, packet, parent)
  local size = 8
  local range = buffer(offset, size)
  local value = range:bytes():tohex(false, " ")
  local display = display.reserved8(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.reserved8, range, value, display)

  return offset + size
end

-- Display Field: Leg Side
display.leg_side = function(value)
  if value == B then
    return "Leg Side: Bid (B)"
  end
  if value == A then
    return "Leg Side: Ask (A)"
  end
  if value == B then
    return "Leg Side: Bid (B)"
  end
  if value == A then
    return "Leg Side: Ask (A)"
  end

  return "Leg Side: Unknown("..value..")"
end

-- Dissect Leg Side Field
dissect.leg_side = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.leg_side(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.leg_side, range, value, display)

  return offset + size
end

-- Display Leg Ratio Qty
display.leg_ratio_qty = function(value)
  return "Leg Ratio Qty: "..value
end

-- Dissect Leg Ratio Qty Field
dissect.leg_ratio_qty = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.leg_ratio_qty(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.leg_ratio_qty, range, value, display)

  return offset + size
end

-- Display Product Id
display.product_id = function(value)
  return "Product Id: "..value
end

-- Dissect Product Id Field
dissect.product_id = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.product_id(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.product_id, range, value, display)

  return offset + size
end

-- Display function for: Leg Definition
display.leg_definition = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Leg Definition Fields
dissect.leg_definition_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Product Id: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.product_id(buffer, index, packet, parent)

  -- Leg Ratio Qty: Unsigned 2 Byte Integer, LittleEndian
  index = dissect.leg_ratio_qty(buffer, index, packet, parent)

  -- Leg Side: Unsigned 1 Byte Integer, LittleEndian  Enum with 4 values
  index = dissect.leg_side(buffer, index, packet, parent)

  -- Reserved8: 8 Byte Fixed Size Array
  index = dissect.reserved8(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Leg Definition
dissect.leg_definition = function(buffer, offset, packet, parent)
  if not show.leg_definition then
    return dissect.leg_definition_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 15)
  local display = display.leg_definition(buffer, packet, parent)
  local element = parent:add(miax_ctom_v11.fields.leg_definition, range, display)

  return dissect.leg_definition_fields(buffer, offset, packet, element)
end

-- Display Numberof Legs
display.numberof_legs = function(value)
  return "Numberof Legs: "..value
end

-- Dissect Numberof Legs Field
dissect.numberof_legs = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.numberof_legs(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.numberof_legs, range, value, display)

  return offset + size
end

-- Display Reserved10
display.reserved10 = function(value)
  return "Reserved10: "..value
end

-- Dissect Reserved10 Field
dissect.reserved10 = function(buffer, offset, packet, parent)
  local size = 10
  local range = buffer(offset, size)
  local value = range:bytes():tohex(false, " ")
  local display = display.reserved10(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.reserved10, range, value, display)

  return offset + size
end

-- Display Field: Update Reason
display.update_reason = function(value)
  if value == "N" then
    return "Update Reason: Newstrategycreated (N)"
  end
  if value == "U" then
    return "Update Reason: Updated (U)"
  end

  return "Update Reason: Unknown("..value..")"
end

-- Dissect Update Reason Field
dissect.update_reason = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.update_reason(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.update_reason, range, value, display)

  return offset + size
end

-- Display Reserved1
display.reserved1 = function(value)
  return "Reserved1: "..value
end

-- Dissect Reserved1 Field
dissect.reserved1 = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:bytes():tohex(false, " ")
  local display = display.reserved1(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.reserved1, range, value, display)

  return offset + size
end

-- Display Field: Active On Miax
display.active_on_miax = function(value)
  if value == "A" then
    return "Active On Miax: Active (A)"
  end
  if value == "I" then
    return "Active On Miax: Inactive (I)"
  end

  return "Active On Miax: Unknown("..value..")"
end

-- Dissect Active On Miax Field
dissect.active_on_miax = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.active_on_miax(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.active_on_miax, range, value, display)

  return offset + size
end

-- Display Strategy Add Time
display.strategy_add_time = function(value)
  return "Strategy Add Time: "..value
end

-- Dissect Strategy Add Time Field
dissect.strategy_add_time = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.strategy_add_time(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.strategy_add_time, range, value, display)

  return offset + size
end

-- Calculate runtime size: Complex Strategy Definition Message
calculate.complex_strategy_definition_message = function(buffer, offset)
  local index = 0

  index = index + 33

  -- Calculate field size from count
  local leg_definition_count = buffer(offset + index - 1, 1):le_uint()
  index = index + leg_definition_count * 15

  return index
end

-- Display function for: Complex Strategy Definition Message
display.complex_strategy_definition_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Complex Strategy Definition Message Fields
dissect.complex_strategy_definition_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Strategy Add Time: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.strategy_add_time(buffer, index, packet, parent)

  -- Strategy ID: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.strategy_id(buffer, index, packet, parent)

  -- Underlying Symbol: Fixed Size String Field 11 bytes
  index = dissect.underlying_symbol(buffer, index, packet, parent)

  -- Active On Miax: Character Enum with 2 values
  index = dissect.active_on_miax(buffer, index, packet, parent)

  -- Reserved1: 1 Byte Fixed Size Array
  index = dissect.reserved1(buffer, index, packet, parent)

  -- Update Reason: Character Enum with 2 values
  index = dissect.update_reason(buffer, index, packet, parent)

  -- Reserved10: 10 Byte Fixed Size Array
  index = dissect.reserved10(buffer, index, packet, parent)

  -- Numberof Legs: Unsigned 1 Byte Integer, LittleEndian
  index = dissect.numberof_legs(buffer, index, packet, parent)

  -- Leg Definition: Struct with 4 Fields
  local leg_definition_count = buffer(index - 1, 1):le_uint()
  for i = 1, leg_definition_count do
    index = dissect.leg_definition(buffer, index, packet, parent)
  end


  return index
end

-- Dissect Struct: Complex Strategy Definition Message
dissect.complex_strategy_definition_message = function(buffer, offset, packet, parent)
  if not show.complex_strategy_definition_message then
    return dissect.complex_strategy_definition_message_fields(buffer, offset, packet, parent)
  end

  local size = calculate.complex_strategy_definition_message(buffer, offset)
  local range = buffer(offset, size)
  local display = display.complex_strategy_definition_message(buffer, packet, parent)
  local element = parent:add(miax_ctom_v11.fields.complex_strategy_definition_message, range, display)

  return dissect.complex_strategy_definition_message_fields(buffer, offset, packet, element)
end

-- Display Priority Quote Width
display.priority_quote_width = function(value)
  return "Priority Quote Width: "..value
end

-- Dissect Priority Quote Width Field
dissect.priority_quote_width = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.priority_quote_width(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.priority_quote_width, range, value, display)

  return offset + size
end

-- Display Field: Opening Underlying Market Code
display.opening_underlying_market_code = function(value)
  if value == "A" then
    return "Opening Underlying Market Code: Nyse Amex (A)"
  end
  if value == "B" then
    return "Opening Underlying Market Code: Nasdaq Omx Bx (B)"
  end
  if value == "C" then
    return "Opening Underlying Market Code: Nse (C)"
  end
  if value == "D" then
    return "Opening Underlying Market Code: Finra Adf (D)"
  end
  if value == "E" then
    return "Opening Underlying Market Code: Market Independent (E)"
  end
  if value == "I" then
    return "Opening Underlying Market Code: Ise (I)"
  end
  if value == "J" then
    return "Opening Underlying Market Code: Edga (J)"
  end
  if value == "K" then
    return "Opening Underlying Market Code: Edgx (K)"
  end
  if value == "M" then
    return "Opening Underlying Market Code: Cse (M)"
  end
  if value == "N" then
    return "Opening Underlying Market Code: Nyse Euronext (N)"
  end
  if value == "P" then
    return "Opening Underlying Market Code: Nyse Arca (P)"
  end
  if value == "Q" then
    return "Opening Underlying Market Code: Nasdaq Omx Utp (Q)"
  end
  if value == "T" then
    return "Opening Underlying Market Code: Nasdaq Omx Cta (T)"
  end
  if value == "V" then
    return "Opening Underlying Market Code: Iex (V)"
  end
  if value == "X" then
    return "Opening Underlying Market Code: Nasdaq Omx Phlx (X)"
  end
  if value == "Y" then
    return "Opening Underlying Market Code: Bats Y (Y)"
  end
  if value == "Z" then
    return "Opening Underlying Market Code: Bats (Z)"
  end

  return "Opening Underlying Market Code: Unknown("..value..")"
end

-- Dissect Opening Underlying Market Code Field
dissect.opening_underlying_market_code = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.opening_underlying_market_code(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.opening_underlying_market_code, range, value, display)

  return offset + size
end

-- Display Field: Liquidity Acceptance Increment Indicator
display.liquidity_acceptance_increment_indicator = function(value)
  if value == "P" then
    return "Liquidity Acceptance Increment Indicator: Penny (P)"
  end
  if value == "N" then
    return "Liquidity Acceptance Increment Indicator: Nickel (N)"
  end
  if value == "D" then
    return "Liquidity Acceptance Increment Indicator: Dime (D)"
  end

  return "Liquidity Acceptance Increment Indicator: Unknown("..value..")"
end

-- Dissect Liquidity Acceptance Increment Indicator Field
dissect.liquidity_acceptance_increment_indicator = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.liquidity_acceptance_increment_indicator(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.liquidity_acceptance_increment_indicator, range, value, display)

  return offset + size
end

-- Display Field: MIAXBBO Posting Increment Indicator
display.miaxbbo_posting_increment_indicator = function(value)
  if value == "P" then
    return "MIAXBBO Posting Increment Indicator: Penny (P)"
  end
  if value == "N" then
    return "MIAXBBO Posting Increment Indicator: Nickel (N)"
  end
  if value == "D" then
    return "MIAXBBO Posting Increment Indicator: Dime (D)"
  end

  return "MIAXBBO Posting Increment Indicator: Unknown("..value..")"
end

-- Dissect MIAXBBO Posting Increment Indicator Field
dissect.miaxbbo_posting_increment_indicator = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.miaxbbo_posting_increment_indicator(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.miaxbbo_posting_increment_indicator, range, value, display)

  return offset + size
end

-- Display Field: Long Term Option
display.long_term_option = function(value)
  if value == "Y" then
    return "Long Term Option: Yes (Y)"
  end
  if value == "N" then
    return "Long Term Option: No (N)"
  end
  if value == "Y" then
    return "Long Term Option: Yes (Y)"
  end
  if value == "N" then
    return "Long Term Option: No (N)"
  end

  return "Long Term Option: Unknown("..value..")"
end

-- Dissect Long Term Option Field
dissect.long_term_option = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.long_term_option(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.long_term_option, range, value, display)

  return offset + size
end

-- Display Field: Restricted Option
display.restricted_option = function(value)
  if value == "Y" then
    return "Restricted Option: Yes (Y)"
  end
  if value == "N" then
    return "Restricted Option: No (N)"
  end
  if value == "Y" then
    return "Restricted Option: Yes (Y)"
  end
  if value == "N" then
    return "Restricted Option: No (N)"
  end

  return "Restricted Option: Unknown("..value..")"
end

-- Dissect Restricted Option Field
dissect.restricted_option = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.restricted_option(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.restricted_option, range, value, display)

  return offset + size
end

-- Display Closing Time
display.closing_time = function(value)
  return "Closing Time: "..value
end

-- Dissect Closing Time Field
dissect.closing_time = function(buffer, offset, packet, parent)
  local size = 8
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.closing_time(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.closing_time, range, value, display)

  return offset + size
end

-- Display Opening Time
display.opening_time = function(value)
  return "Opening Time: "..value
end

-- Dissect Opening Time Field
dissect.opening_time = function(buffer, offset, packet, parent)
  local size = 8
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.opening_time(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.opening_time, range, value, display)

  return offset + size
end

-- Display Field: Callor Put
display.callor_put = function(value)
  if value == "C" then
    return "Callor Put: Call (C)"
  end
  if value == "P" then
    return "Callor Put: Put (P)"
  end
  if value == "C" then
    return "Callor Put: Call (C)"
  end
  if value == "P" then
    return "Callor Put: Put (P)"
  end

  return "Callor Put: Unknown("..value..")"
end

-- Dissect Callor Put Field
dissect.callor_put = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.callor_put(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.callor_put, range, value, display)

  return offset + size
end

-- Display Strike Price
display.strike_price = function(value)
  return "Strike Price: "..value
end

-- Dissect Strike Price Field
dissect.strike_price = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.strike_price(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.strike_price, range, value, display)

  return offset + size
end

-- Display Expiration Date
display.expiration_date = function(value)
  return "Expiration Date: "..value
end

-- Dissect Expiration Date Field
dissect.expiration_date = function(buffer, offset, packet, parent)
  local size = 8
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.expiration_date(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.expiration_date, range, value, display)

  return offset + size
end

-- Display Security Symbol
display.security_symbol = function(value)
  return "Security Symbol: "..value
end

-- Dissect Security Symbol Field
dissect.security_symbol = function(buffer, offset, packet, parent)
  local size = 6
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.security_symbol(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.security_symbol, range, value, display)

  return offset + size
end

-- Display Product Add/ Update Time
display.product_add__update_time = function(value)
  return "Product Add/ Update Time: "..value
end

-- Dissect Product Add/ Update Time Field
dissect.product_add__update_time = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.product_add__update_time(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.product_add__update_time, range, value, display)

  return offset + size
end

-- Display function for: Series Update
display.series_update = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Series Update Fields
dissect.series_update_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Product Add/ Update Time: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.product_add__update_time(buffer, index, packet, parent)

  -- Product ID: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.product_id(buffer, index, packet, parent)

  -- Underlying Symbol: Fixed Size String Field 11 bytes
  index = dissect.underlying_symbol(buffer, index, packet, parent)

  -- Security Symbol: Fixed Size String Field 6 bytes
  index = dissect.security_symbol(buffer, index, packet, parent)

  -- Expiration Date: Fixed Size String Field 8 bytes
  index = dissect.expiration_date(buffer, index, packet, parent)

  -- Strike Price: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.strike_price(buffer, index, packet, parent)

  -- Callor Put: Character Enum with 4 values
  index = dissect.callor_put(buffer, index, packet, parent)

  -- Opening Time: Fixed Size String Field 8 bytes
  index = dissect.opening_time(buffer, index, packet, parent)

  -- Closing Time: Fixed Size String Field 8 bytes
  index = dissect.closing_time(buffer, index, packet, parent)

  -- Restricted Option: Character Enum with 4 values
  index = dissect.restricted_option(buffer, index, packet, parent)

  -- Long Term Option: Character Enum with 4 values
  index = dissect.long_term_option(buffer, index, packet, parent)

  -- Active On Miax: Character Enum with 2 values
  index = dissect.active_on_miax(buffer, index, packet, parent)

  -- MIAXBBO Posting Increment Indicator: Character Enum with 3 values
  index = dissect.miaxbbo_posting_increment_indicator(buffer, index, packet, parent)

  -- Liquidity Acceptance Increment Indicator: Character Enum with 3 values
  index = dissect.liquidity_acceptance_increment_indicator(buffer, index, packet, parent)

  -- Opening Underlying Market Code: Character Enum with 17 values
  index = dissect.opening_underlying_market_code(buffer, index, packet, parent)

  -- Priority Quote Width: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.priority_quote_width(buffer, index, packet, parent)

  -- Reserved8: 8 Byte Fixed Size Array
  index = dissect.reserved8(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Series Update
dissect.series_update = function(buffer, offset, packet, parent)
  if not show.series_update then
    return dissect.series_update_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 72)
  local display = display.series_update(buffer, packet, parent)
  local element = parent:add(miax_ctom_v11.fields.series_update, range, display)

  return dissect.series_update_fields(buffer, offset, packet, element)
end

-- Display function for: System Time Message
display.system_time_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect System Time Message Fields
dissect.system_time_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: Unsigned 4 Byte Integer, LittleEndian
  index = dissect.timestamp(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: System Time Message
dissect.system_time_message = function(buffer, offset, packet, parent)
  if not show.system_time_message then
    return dissect.system_time_message_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 4)
  local display = display.system_time_message(buffer, packet, parent)
  local element = parent:add(miax_ctom_v11.fields.system_time_message, range, display)

  return dissect.system_time_message_fields(buffer, offset, packet, element)
end

-- Calculate runtime size of: Data
calculate.data = function(buffer, offset, code)
  -- Size of System Time Message
  if code == "1" then
    return 4
  end
  -- Size of Series Update
  if code == "P" then
    return 72
  end
  -- Size of Complex Strategy Definition Message
  if code == "C" then
    return calculate.complex_strategy_definition_message(buffer, offset)
  end
  -- Size of System State Message
  if code == "S" then
    return 17
  end
  -- Size of Complex Top Of Market Bid Compact Message
  if code == "b" then
    return 15
  end
  -- Size of Complex Top Of Market Offer Compact Message
  if code == "o" then
    return 15
  end
  -- Size of Wide Complex Top Of Market Bid Message
  if code == "e" then
    return 25
  end
  -- Size of Wide Complex Top Of Market Offer Message
  if code == "f" then
    return 25
  end
  -- Size of Complex Double-Sided Top of Market Compact Message
  if code == "m" then
    return 22
  end
  -- Size of Wide Complex Double Sided Top of Market Message
  if code == "w" then
    return 42
  end
  -- Size of Strategy Trade Message
  if code == "t" then
    return 41
  end
  -- Size of Underlying Trading Status Message
  if code == "H" then
    return 25
  end

  -- Report error
  error("Unknown Type: "..code)

  return 0
end

-- Display function for Branch: Data
display.data = function(buffer, offset, packet, parent)
  return ""
end

-- Dissect Branches:
dissect.data_branches = function(code, buffer, offset, packet, parent)
  -- Dissect System Time Message
  if code == "1" then
    return dissect.system_time_message(buffer, offset, packet, parent)
  end
  -- Dissect Series Update
  if code == "P" then
    return dissect.series_update(buffer, offset, packet, parent)
  end
  -- Dissect Complex Strategy Definition Message
  if code == "C" then
    return dissect.complex_strategy_definition_message(buffer, offset, packet, parent)
  end
  -- Dissect System State Message
  if code == "S" then
    return dissect.system_state_message(buffer, offset, packet, parent)
  end
  -- Dissect Complex Top Of Market Bid Compact Message
  if code == "b" then
    return dissect.complex_top_of_market_bid_compact_message(buffer, offset, packet, parent)
  end
  -- Dissect Complex Top Of Market Offer Compact Message
  if code == "o" then
    return dissect.complex_top_of_market_offer_compact_message(buffer, offset, packet, parent)
  end
  -- Dissect Wide Complex Top Of Market Bid Message
  if code == "e" then
    return dissect.wide_complex_top_of_market_bid_message(buffer, offset, packet, parent)
  end
  -- Dissect Wide Complex Top Of Market Offer Message
  if code == "f" then
    return dissect.wide_complex_top_of_market_offer_message(buffer, offset, packet, parent)
  end
  -- Dissect Complex Double-Sided Top of Market Compact Message
  if code == "m" then
    return dissect.complex_double_sided_top_of_market_compact_message(buffer, offset, packet, parent)
  end
  -- Dissect Wide Complex Double Sided Top of Market Message
  if code == "w" then
    return dissect.wide_complex_double_sided_top_of_market_message(buffer, offset, packet, parent)
  end
  -- Dissect Strategy Trade Message
  if code == "t" then
    return dissect.strategy_trade_message(buffer, offset, packet, parent)
  end
  -- Dissect Underlying Trading Status Message
  if code == "H" then
    return dissect.underlying_trading_status_message(buffer, offset, packet, parent)
  end

  return offset
end

-- Dissect: Data
dissect.data = function(buffer, offset, packet, parent)
  -- Parse data type dependency
  local code = buffer(offset - 1, 1):string()

  if not show.data then
    return dissect.data_branches(code, buffer, offset, packet, parent)
  end

  -- Calculate size
  local size = calculate.data(buffer, offset, code)
  if size < 1 then
    return dissect.data_branches(code, buffer, offset, packet, parent)
  end

  -- Dissect if branch has fields
  local range = buffer(offset, size)
  local display = display.data(buffer, packet, parent)
  local element = parent:add(miax_ctom_v11.fields.data, range, display)

  return dissect.data_branches(code, buffer, offset, packet, element)
end

-- Display Field: Message Type
display.message_type = function(value)
  if value == "1" then
    return "Message Type: System Time Message (1)"
  end
  if value == "P" then
    return "Message Type: Series Update (P)"
  end
  if value == "C" then
    return "Message Type: Complex Strategy Definition Message (C)"
  end
  if value == "S" then
    return "Message Type: System State Message (S)"
  end
  if value == "b" then
    return "Message Type: Complex Top Of Market Bid Compact Message (b)"
  end
  if value == "o" then
    return "Message Type: Complex Top Of Market Offer Compact Message (o)"
  end
  if value == "e" then
    return "Message Type: Wide Complex Top Of Market Bid Message (e)"
  end
  if value == "f" then
    return "Message Type: Wide Complex Top Of Market Offer Message (f)"
  end
  if value == "m" then
    return "Message Type: Complex Double-Sided Top of Market Compact Message (m)"
  end
  if value == "w" then
    return "Message Type: Wide Complex Double Sided Top of Market Message (w)"
  end
  if value == "t" then
    return "Message Type: Strategy Trade Message (t)"
  end
  if value == "H" then
    return "Message Type: Underlying Trading Status Message (H)"
  end

  return "Message Type: Unknown("..value..")"
end

-- Dissect Message Type Field
dissect.message_type = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.message_type(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.message_type, range, value, display)

  return offset + size
end

-- Calculate runtime size: Application Message
calculate.application_message = function(buffer, offset)
  local index = 0

  index = index + 1

  -- Calculate runtime size of Data field
  local data_offset = offset + index
  local data_type = buffer(data_offset - 1, 1):string()
  index = index + calculate.data(buffer, data_offset, data_type)

  return index
end

-- Display function for: Application Message
display.application_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Application Message Fields
dissect.application_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Message Type: Character Enum with 12 values
  index = dissect.message_type(buffer, index, packet, parent)

  -- Data: 12  Branches with runtime type Message Type
  index = dissect.data(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Application Message
dissect.application_message = function(buffer, offset, packet, parent)
  if not show.application_message then
    return dissect.application_message_fields(buffer, offset, packet, parent)
  end

  local size = calculate.application_message(buffer, offset)
  local range = buffer(offset, size)
  local display = display.application_message(buffer, packet, parent)
  local element = parent:add(miax_ctom_v11.fields.application_message, range, display)

  return dissect.application_message_fields(buffer, offset, packet, element)
end

-- Calculate runtime size of: Payload
calculate.payload = function(buffer, offset, code)
  -- Size of Heartbeat
  if code == 0 then
    return 0
  end
  -- Size of Start Of Session
  if code == 1 then
    return 0
  end
  -- Size of End Of Session
  if code == 2 then
    return 0
  end
  -- Size of Application Message
  if code == 3 then
    return calculate.application_message(buffer, offset)
  end

  -- Report error
  error("Unknown Type: "..code)

  return 0
end

-- Display function for Branch: Payload
display.payload = function(buffer, offset, packet, parent)
  return ""
end

-- Dissect Branches:
dissect.payload_branches = function(code, buffer, offset, packet, parent)
  -- Dissect Heartbeat
  if code == 0 then
  end
  -- Dissect Start Of Session
  if code == 1 then
  end
  -- Dissect End Of Session
  if code == 2 then
  end
  -- Dissect Application Message
  if code == 3 then
    return dissect.application_message(buffer, offset, packet, parent)
  end

  return offset
end

-- Dissect: Payload
dissect.payload = function(buffer, offset, packet, parent)
  -- Parse payload type dependency
  local code = buffer(offset - 2, 1):le_uint()

  if not show.payload then
    return dissect.payload_branches(code, buffer, offset, packet, parent)
  end

  -- Calculate size
  local size = calculate.payload(buffer, offset, code)
  if size < 1 then
    return dissect.payload_branches(code, buffer, offset, packet, parent)
  end

  -- Dissect if branch has fields
  local range = buffer(offset, size)
  local display = display.payload(buffer, packet, parent)
  local element = parent:add(miax_ctom_v11.fields.payload, range, display)

  return dissect.payload_branches(code, buffer, offset, packet, element)
end

-- Display Session Number
display.session_number = function(value)
  return "Session Number: "..value
end

-- Dissect Session Number Field
dissect.session_number = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.session_number(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.session_number, range, value, display)

  return offset + size
end

-- Display Packet Type
display.packet_type = function(value)
  return "Packet Type: "..value
end

-- Dissect Packet Type Field
dissect.packet_type = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.packet_type(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.packet_type, range, value, display)

  return offset + size
end

-- Display Packet Length
display.packet_length = function(value)
  return "Packet Length: "..value
end

-- Dissect Packet Length Field
dissect.packet_length = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:le_uint()
  local display = display.packet_length(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.packet_length, range, value, display)

  return offset + size
end

-- Display Sequence Number
display.sequence_number = function(value)
  return "Sequence Number: "..value
end

-- Dissect Sequence Number Field
dissect.sequence_number = function(buffer, offset, packet, parent)
  local size = 8
  local range = buffer(offset, size)
  local value = range:le_uint64()
  local display = display.sequence_number(value, buffer, offset, packet, parent)

  parent:add(miax_ctom_v11.fields.sequence_number, range, value, display)

  return offset + size
end

-- Calculate runtime size: Message
calculate.message = function(buffer, offset)
  local index = 0

  index = index + 12

  -- Calculate runtime size of Payload field
  local payload_offset = offset + index
  local payload_type = buffer(payload_offset - 2, 1):le_uint()
  index = index + calculate.payload(buffer, payload_offset, payload_type)

  return index
end

-- Display function for: Message
display.message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Message Fields
dissect.message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Sequence Number: Unsigned 8 Byte Integer, LittleEndian
  index = dissect.sequence_number(buffer, index, packet, parent)

  -- Packet Length: Unsigned 2 Byte Integer, LittleEndian
  index = dissect.packet_length(buffer, index, packet, parent)

  -- Packet Type: Unsigned 1 Byte Integer, LittleEndian
  index = dissect.packet_type(buffer, index, packet, parent)

  -- Session Number: Unsigned 1 Byte Integer, LittleEndian
  index = dissect.session_number(buffer, index, packet, parent)

  -- Payload: 4  Branches with runtime type Packet Type
  index = dissect.payload(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Message
dissect.message = function(buffer, offset, packet, parent)
  if not show.message then
    return dissect.message_fields(buffer, offset, packet, parent)
  end

  local size = calculate.message(buffer, offset)
  local range = buffer(offset, size)
  local display = display.message(buffer, packet, parent)
  local element = parent:add(miax_ctom_v11.fields.message, range, display)

  return dissect.message_fields(buffer, offset, packet, element)
end

-- Dissect packet
function dissect.packet(buffer, packet, parent)
  local index = 0

  -- Message: Struct with 5 Fields
  while index < buffer:len() do
    index = dissect.message(buffer, index, packet, parent)
  end

  return index
end


-----------------------------------------------------------------------
-- Protocol Dissector and Components
-----------------------------------------------------------------------

-- Initialize dissector variables
function miax_ctom_v11.init()
end
-- Dissector for miax ctom v11 protocol
function miax_ctom_v11.dissector(buffer, packet, parent)

  -- Set protocol name
  packet.cols.protocol = miax_ctom_v11.name

  -- Dissect protocol
  local protocol = parent:add(miax_ctom_v11, buffer(), miax_ctom_v11.description, "("..buffer:len().." Bytes)")
  local protocol_size = dissect.packet(buffer, packet, protocol)
end

-- Register miax ctom v11 protocol with udp table
local udp_table = DissectorTable.get("udp.port")
udp_table:add(65333, miax_ctom_v11)

-- Verify size of packet
verify.miax_ctom_v11_packet_size = function(buffer)

  return true
end

-- Dissector heuristic for miax ctom v11 protocol
local function miax_ctom_v11_heuristic(buffer, packet, parent)
  -- Verify packet length
  if not verify.miax_ctom_v11_packet_size(buffer) then return false end

  -- Protocol is valid, set conversation and dissect this packet
  packet.conversation = miax_ctom_v11
  miax_ctom_v11.dissector(buffer, packet, parent)

  return true
end

-- Register miax ctom v11 protocol heuristic
miax_ctom_v11:register_heuristic("udp", miax_ctom_v11_heuristic)

-----------------------------------------------------------------------
-- This file was generated by a tool for the open markets initiative
-- Protocol Version: v11
-- Script Version: 1.0.0.0
-- Date:
-- License: Public/GPLv3
-- Authors: Omi Developers
-- 
-- This script dissector is provided as an easily edited and modified
-- cross platform dissection solution. Feel free to modify. Enjoy.
-----------------------------------------------------------------------

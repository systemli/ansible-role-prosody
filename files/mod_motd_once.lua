-- Prosody IM
-- Copyright (C) 2008-2010 Matthew Wild
-- Copyright (C) 2008-2010 Waqas Hussain
-- Copyright (C) 2010 Jeff Mitchell
--
-- This project is MIT/X11 licensed. Please see the
-- COPYING file in the source package for more information.
--

local host = module:get_host();
local motd_text = module:get_option_string("motd_text");
local motd_jid = module:get_option_string("motd_jid", host);
local send_once = module:get_option_boolean("motd_send_once", true);

if not motd_text then return; end

local store;
if send_once then
	store = module:open_store();
end

local st = require "util.stanza";

motd_text = motd_text:gsub("^%s*(.-)%s*$", "%1"):gsub("\n[ \t]+", "\n"); -- Strip indentation from the config

module:hook("presence/bare", function (event)
		local session, stanza = event.origin, event.stanza;
		if session.username and not session.presence
		and not stanza.attr.type and not stanza.attr.to then
			if send_once then
				local userdata = store:get(session.username);
				if userdata and userdata.last_motd == motd_text then
					return
				end
			end
			local motd_stanza =
				st.message({ to = session.full_jid, from = motd_jid })
					:tag("body"):text(motd_text);
			module:send(motd_stanza);
			module:log("debug", "MOTD send to user %s", session.full_jid);
			if send_once then
				store:set(session.username, { last_motd = motd_text });
			end
		end
end, 1);

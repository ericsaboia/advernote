require "digest/md5"
require 'evernote_oauth'
require_relative 'page'

# initialize dependencies
authToken = 'your developer token'

if authToken == "your developer token"
  puts "Please fill in your developer token"
  puts "To get a developer token, visit https://sandbox.evernote.com/api/DeveloperToken.action"
  exit(1)
end

client = EvernoteOAuth::Client.new(token: authToken)
note_store =  client.note_store
page = Page.new

# note object
note = Evernote::EDAM::Type::Note.new
note.title = "TITULO DE NOMEAÇÃO"
note.content = <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd">
<en-note>#{page.nomination}
</en-note>
EOF

#post note
createdNote = note_store.createNote(authToken, note)
puts "Successfully created a new note with GUID: #{createdNote.guid}"
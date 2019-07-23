## Installion
First of all pull the code of course

    git clone https://github.com/Sadat97/chat-system.git
Then Let docker do the rest of the work

    docker-compose up -d
open postman or what ever tool you to test apis

here is the list of the apis you can test and play with
**Application APIS**
 -     GET         /applications   
 -     POST       /applications   
 -     GET    	   /applications/:token
 -     PATCH      /applications/:token
 -     PUT 	  /applications/:token

 

> The body should be json and looks like this in the POST AND PUT requestes
> `{ "application": { "name": "bla bla"
}
> }`

**CHAT APIS**

 -     GET    /applications/:application_token/chats     
 -     POST   /applications/:application_token/chats           
 -     GET /applications/:application_token/chats/:number         
 -     PATCH  /applications/:application_token/chats/:number
 -      PUT    /applications/:application_token/chats/:number       
 -      DELETE /applications/:application_token/chats/:number      
> The body should be json and looks like this in the POST AND PUT requestes
> `{ "chat": { "name": "bla bla"}
> }`


**MESSAGE APIS**

 -   GET   /applications/:application_token/chats/:chat_number/messages/search
 -       GET    /applications/:application_token/chats/:chat_number/messages
 -     POST   /applications/:application_token/chats/:chat_number/messages
 -     GET    /applications/:application_token/chats/:chat_number/messages/:number
 -     PATCH  /applications/:application_token/chats/:chat_number/messages/:number
 -     PUT /applications/:application_token/chats/:chat_number/messages/:number
 -     DELETE /applications/:application_token/chats/:chat_number/messages/:number 

> The body should be json and looks like this in the POST AND PUT requestes
> `{ "message": { "body": "bla bla"}
> }`

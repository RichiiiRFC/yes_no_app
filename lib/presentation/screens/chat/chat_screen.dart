import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:yes_no_app/presentation/providers/chat_provider.dart";
import "package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart";
import "package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart";
import "../../../domain/entities/message.dart";
import "../../widgets/shared/message_field_box.dart";


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://estaticosgn-cdn.deia.eus/clip/32574ba3-1c5d-4233-ae95-067fbfb425bf_16-9-aspect-ratio_default_0_x525y606.jpg"),
          ),
        ),
        title: const Text("Mi Amor"),
        //centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [

            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                  itemCount: chatProvider.messageList.length,
                  itemBuilder: (context, index) {
                    final message = chatProvider.messageList[index];

                    return (message.fromWho == FromWho.hers)
                        ? HerMessageBubble(message: message)
                        : MyMessageBubble(message: message);
                })),

            // Caja de texto
            MessageFieldBox(
              //onValue: (value) => chatProvider.sendMessage(value),
              onValue:chatProvider.sendMessage,

            ),
          ],
        ),
      ),
    );
  }
}






import { Attachment } from "./attachment";
import { Poll } from "./poll";
import { TextMessage } from "./text-message";

export interface MessageSend {
    chatId: string;
    content: (Attachment | Poll | TextMessage)[];
}

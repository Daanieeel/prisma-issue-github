import { ChatActivityType } from "@prisma/client";

export interface CreateChatActivityDto<T> {
    activityContent: T;
    answeredBy?: string;
    answerTo?: string;
    chat: string;
    executor: string;
    readBy?: string[];
    type: ChatActivityType;
    starred?: boolean;
}

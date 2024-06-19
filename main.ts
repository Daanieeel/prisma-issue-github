import { Chat, ChatActivity, PrismaClient, User, UserAccount } from '@prisma/client'
import { CreateChatActivityDto } from "./entities/create-chat-activity-dto";

const prisma = new PrismaClient()

async function main() {

    const userAccounts: UserAccount[] = await prisma.userAccount.findMany();
    let userAccount: UserAccount = {} as UserAccount

    if(userAccounts.length === 0) {
        const userAccount: UserAccount = await prisma.userAccount.create({
            data: {
                password: "password",
                username: "username",
            }
        });
    }
    else userAccount = userAccounts[0];

    const users = await prisma.user.findMany();
    let user: User = {} as User;

    if(users.length === 0) {
        const user: User = await prisma.user.create({
            data: {
                type: "STUDENT",
                firstName: "firstName",
                lastName: "lastName",
                userAccount: {
                    connect: userAccount.id ? { id: userAccount.id } : undefined
                }
            },
        });
    }
    else user = users[0];

    const chats: Chat[] = await prisma.chat.findMany();
    let chat: Chat = {} as Chat;

    if(chats.length === 0) {
        const chat: Chat = await prisma.chat.create({
            data: {
                type: "GROUP",
                name: "Test Chat",
            }
        })
    }
    else chat = chats[0];

    const dto: CreateChatActivityDto<any> = {
        chat: chat.id,
        executor: user.id,
        type: "MESSAGE_SEND",
        activityContent: {
            test: "Test"
        }
    };
    const chatActivity: ChatActivity = await prisma.chatActivity.create({
        data: {
            activityContent: dto.activityContent,
            chat: {
                connect: dto.chat ? { id: dto.chat } : undefined
            },
            executor: {
                connect: dto.executor ? { id: dto.executor } : undefined
            },
            type: dto.type,
        }
    });
    if (!chatActivity)
        throw new Error(`ChatActivity could not be created with data: ${dto}`);

    console.log(chatActivity)
    return chatActivity;
}

main()
    .then(async () => {
        await prisma.$disconnect()
    })
    .catch(async (e) => {
        console.error(e)
        await prisma.$disconnect()
        process.exit(1)
    })
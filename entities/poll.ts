export interface PollOption {
    id: number;
    option: string;
    votedBy: PollUser[];
    votes: number;
}

export interface Poll {
    question: string;
    options: PollOption[];
    closed: boolean;
    result_published: boolean;
    type: 'POLL';
}


export interface PollUser {
    avatar: string;
    userId: string;
    firstName: string;
    lastName: string;
}

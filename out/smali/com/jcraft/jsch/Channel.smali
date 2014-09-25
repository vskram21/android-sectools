.class public abstract Lcom/jcraft/jsch/Channel;
.super Ljava/lang/Object;
.source "Channel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jcraft/jsch/Channel$PassiveOutputStream;,
        Lcom/jcraft/jsch/Channel$PassiveInputStream;,
        Lcom/jcraft/jsch/Channel$MyPipedInputStream;
    }
.end annotation


# static fields
.field static final SSH_MSG_CHANNEL_OPEN_CONFIRMATION:I = 0x5b

.field static final SSH_MSG_CHANNEL_OPEN_FAILURE:I = 0x5c

.field static final SSH_MSG_CHANNEL_WINDOW_ADJUST:I = 0x5d

.field static final SSH_OPEN_ADMINISTRATIVELY_PROHIBITED:I = 0x1

.field static final SSH_OPEN_CONNECT_FAILED:I = 0x2

.field static final SSH_OPEN_RESOURCE_SHORTAGE:I = 0x4

.field static final SSH_OPEN_UNKNOWN_CHANNEL_TYPE:I = 0x3

.field static index:I

.field private static pool:Ljava/util/Vector;


# instance fields
.field volatile close:Z

.field volatile connectTimeout:I

.field volatile connected:Z

.field volatile eof_local:Z

.field volatile eof_remote:Z

.field volatile exitstatus:I

.field id:I

.field io:Lcom/jcraft/jsch/IO;

.field volatile lmpsize:I

.field volatile lwsize:I

.field volatile lwsize_max:I

.field notifyme:I

.field volatile open_confirmation:Z

.field volatile recipient:I

.field volatile reply:I

.field volatile rmpsize:I

.field volatile rwsize:J

.field private session:Lcom/jcraft/jsch/Session;

.field thread:Ljava/lang/Thread;

.field protected type:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 50
    const/4 v0, 0x0

    sput v0, Lcom/jcraft/jsch/Channel;->index:I

    .line 51
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    return-void
.end method

.method constructor <init>()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, -0x1

    const/4 v2, 0x0

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    iput v3, p0, Lcom/jcraft/jsch/Channel;->recipient:I

    .line 99
    const-string v0, "foo"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Channel;->type:[B

    .line 100
    const/high16 v0, 0x10

    iput v0, p0, Lcom/jcraft/jsch/Channel;->lwsize_max:I

    .line 101
    iget v0, p0, Lcom/jcraft/jsch/Channel;->lwsize_max:I

    iput v0, p0, Lcom/jcraft/jsch/Channel;->lwsize:I

    .line 102
    const/16 v0, 0x4000

    iput v0, p0, Lcom/jcraft/jsch/Channel;->lmpsize:I

    .line 104
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/jcraft/jsch/Channel;->rwsize:J

    .line 105
    iput v2, p0, Lcom/jcraft/jsch/Channel;->rmpsize:I

    .line 107
    iput-object v4, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    .line 108
    iput-object v4, p0, Lcom/jcraft/jsch/Channel;->thread:Ljava/lang/Thread;

    .line 110
    iput-boolean v2, p0, Lcom/jcraft/jsch/Channel;->eof_local:Z

    .line 111
    iput-boolean v2, p0, Lcom/jcraft/jsch/Channel;->eof_remote:Z

    .line 113
    iput-boolean v2, p0, Lcom/jcraft/jsch/Channel;->close:Z

    .line 114
    iput-boolean v2, p0, Lcom/jcraft/jsch/Channel;->connected:Z

    .line 115
    iput-boolean v2, p0, Lcom/jcraft/jsch/Channel;->open_confirmation:Z

    .line 117
    iput v3, p0, Lcom/jcraft/jsch/Channel;->exitstatus:I

    .line 119
    iput v2, p0, Lcom/jcraft/jsch/Channel;->reply:I

    .line 120
    iput v2, p0, Lcom/jcraft/jsch/Channel;->connectTimeout:I

    .line 124
    iput v2, p0, Lcom/jcraft/jsch/Channel;->notifyme:I

    .line 127
    sget-object v1, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    monitor-enter v1

    .line 128
    :try_start_0
    sget v0, Lcom/jcraft/jsch/Channel;->index:I

    add-int/lit8 v2, v0, 0x1

    sput v2, Lcom/jcraft/jsch/Channel;->index:I

    iput v0, p0, Lcom/jcraft/jsch/Channel;->id:I

    .line 129
    sget-object v0, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 130
    monitor-exit v1

    .line 131
    return-void

    .line 130
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method static del(Lcom/jcraft/jsch/Channel;)V
    .locals 2
    .parameter "c"

    .prologue
    .line 92
    sget-object v1, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    monitor-enter v1

    .line 93
    :try_start_0
    sget-object v0, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 94
    monitor-exit v1

    .line 95
    return-void

    .line 94
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method static disconnect(Lcom/jcraft/jsch/Session;)V
    .locals 8
    .parameter "session"

    .prologue
    .line 466
    const/4 v2, 0x0

    .line 467
    .local v2, channels:[Lcom/jcraft/jsch/Channel;
    const/4 v3, 0x0

    .line 468
    .local v3, count:I
    sget-object v7, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    monitor-enter v7

    .line 469
    :try_start_0
    sget-object v6, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v6

    new-array v2, v6, [Lcom/jcraft/jsch/Channel;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 470
    const/4 v5, 0x0

    .local v5, i:I
    move v4, v3

    .end local v3           #count:I
    .local v4, count:I
    :goto_0
    :try_start_1
    sget-object v6, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    invoke-virtual {v6}, Ljava/util/Vector;->size()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v6

    if-ge v5, v6, :cond_0

    .line 472
    :try_start_2
    sget-object v6, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    invoke-virtual {v6, v5}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/jcraft/jsch/Channel;

    move-object v0, v6

    check-cast v0, Lcom/jcraft/jsch/Channel;

    move-object v1, v0

    .line 473
    .local v1, c:Lcom/jcraft/jsch/Channel;
    iget-object v6, v1, Lcom/jcraft/jsch/Channel;->session:Lcom/jcraft/jsch/Session;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    if-ne v6, p0, :cond_2

    .line 474
    add-int/lit8 v3, v4, 0x1

    .end local v4           #count:I
    .restart local v3       #count:I
    :try_start_3
    aput-object v1, v2, v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 470
    .end local v1           #c:Lcom/jcraft/jsch/Channel;
    :goto_1
    add-int/lit8 v5, v5, 0x1

    move v4, v3

    .end local v3           #count:I
    .restart local v4       #count:I
    goto :goto_0

    .line 480
    :cond_0
    :try_start_4
    monitor-exit v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 481
    const/4 v5, 0x0

    :goto_2
    if-ge v5, v4, :cond_1

    .line 482
    aget-object v6, v2, v5

    invoke-virtual {v6}, Lcom/jcraft/jsch/Channel;->disconnect()V

    .line 481
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 480
    .end local v4           #count:I
    .end local v5           #i:I
    .restart local v3       #count:I
    :catchall_0
    move-exception v6

    :goto_3
    :try_start_5
    monitor-exit v7
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw v6

    .line 484
    .end local v3           #count:I
    .restart local v4       #count:I
    .restart local v5       #i:I
    :cond_1
    return-void

    .line 480
    :catchall_1
    move-exception v6

    move v3, v4

    .end local v4           #count:I
    .restart local v3       #count:I
    goto :goto_3

    .line 477
    .end local v3           #count:I
    .restart local v4       #count:I
    :catch_0
    move-exception v6

    move v3, v4

    .end local v4           #count:I
    .restart local v3       #count:I
    goto :goto_1

    .restart local v1       #c:Lcom/jcraft/jsch/Channel;
    :catch_1
    move-exception v6

    goto :goto_1

    .end local v3           #count:I
    .restart local v4       #count:I
    :cond_2
    move v3, v4

    .end local v4           #count:I
    .restart local v3       #count:I
    goto :goto_1
.end method

.method static getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;
    .locals 5
    .parameter "id"
    .parameter "session"

    .prologue
    .line 83
    sget-object v4, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    monitor-enter v4

    .line 84
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    :try_start_0
    sget-object v3, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 85
    sget-object v3, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    invoke-virtual {v3, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/jcraft/jsch/Channel;

    move-object v0, v3

    check-cast v0, Lcom/jcraft/jsch/Channel;

    move-object v1, v0

    .line 86
    .local v1, c:Lcom/jcraft/jsch/Channel;
    iget v3, v1, Lcom/jcraft/jsch/Channel;->id:I

    if-ne v3, p0, :cond_0

    iget-object v3, v1, Lcom/jcraft/jsch/Channel;->session:Lcom/jcraft/jsch/Session;

    if-ne v3, p1, :cond_0

    monitor-exit v4

    .line 89
    .end local v1           #c:Lcom/jcraft/jsch/Channel;
    :goto_1
    return-object v1

    .line 84
    .restart local v1       #c:Lcom/jcraft/jsch/Channel;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 88
    .end local v1           #c:Lcom/jcraft/jsch/Channel;
    :cond_1
    monitor-exit v4

    .line 89
    const/4 v1, 0x0

    goto :goto_1

    .line 88
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method static getChannel(Ljava/lang/String;)Lcom/jcraft/jsch/Channel;
    .locals 1
    .parameter "type"

    .prologue
    .line 53
    const-string v0, "session"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 54
    new-instance v0, Lcom/jcraft/jsch/ChannelSession;

    invoke-direct {v0}, Lcom/jcraft/jsch/ChannelSession;-><init>()V

    .line 80
    :goto_0
    return-object v0

    .line 56
    :cond_0
    const-string v0, "shell"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 57
    new-instance v0, Lcom/jcraft/jsch/ChannelShell;

    invoke-direct {v0}, Lcom/jcraft/jsch/ChannelShell;-><init>()V

    goto :goto_0

    .line 59
    :cond_1
    const-string v0, "exec"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 60
    new-instance v0, Lcom/jcraft/jsch/ChannelExec;

    invoke-direct {v0}, Lcom/jcraft/jsch/ChannelExec;-><init>()V

    goto :goto_0

    .line 62
    :cond_2
    const-string v0, "x11"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 63
    new-instance v0, Lcom/jcraft/jsch/ChannelX11;

    invoke-direct {v0}, Lcom/jcraft/jsch/ChannelX11;-><init>()V

    goto :goto_0

    .line 65
    :cond_3
    const-string v0, "auth-agent@openssh.com"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 66
    new-instance v0, Lcom/jcraft/jsch/ChannelAgentForwarding;

    invoke-direct {v0}, Lcom/jcraft/jsch/ChannelAgentForwarding;-><init>()V

    goto :goto_0

    .line 68
    :cond_4
    const-string v0, "direct-tcpip"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 69
    new-instance v0, Lcom/jcraft/jsch/ChannelDirectTCPIP;

    invoke-direct {v0}, Lcom/jcraft/jsch/ChannelDirectTCPIP;-><init>()V

    goto :goto_0

    .line 71
    :cond_5
    const-string v0, "forwarded-tcpip"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 72
    new-instance v0, Lcom/jcraft/jsch/ChannelForwardedTCPIP;

    invoke-direct {v0}, Lcom/jcraft/jsch/ChannelForwardedTCPIP;-><init>()V

    goto :goto_0

    .line 74
    :cond_6
    const-string v0, "sftp"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 75
    new-instance v0, Lcom/jcraft/jsch/ChannelSftp;

    invoke-direct {v0}, Lcom/jcraft/jsch/ChannelSftp;-><init>()V

    goto :goto_0

    .line 77
    :cond_7
    const-string v0, "subsystem"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 78
    new-instance v0, Lcom/jcraft/jsch/ChannelSubsystem;

    invoke-direct {v0}, Lcom/jcraft/jsch/ChannelSubsystem;-><init>()V

    goto :goto_0

    .line 80
    :cond_8
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method declared-synchronized addRemoteWindowSize(I)V
    .locals 4
    .parameter "foo"

    .prologue
    .line 352
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/jcraft/jsch/Channel;->rwsize:J

    int-to-long v2, p1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/jcraft/jsch/Channel;->rwsize:J

    .line 353
    iget v0, p0, Lcom/jcraft/jsch/Channel;->notifyme:I

    if-lez v0, :cond_0

    .line 354
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 355
    :cond_0
    monitor-exit p0

    return-void

    .line 352
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method close()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 444
    iget-boolean v2, p0, Lcom/jcraft/jsch/Channel;->close:Z

    if-eqz v2, :cond_0

    .line 461
    :goto_0
    return-void

    .line 445
    :cond_0
    iput-boolean v3, p0, Lcom/jcraft/jsch/Channel;->close:Z

    .line 446
    iput-boolean v3, p0, Lcom/jcraft/jsch/Channel;->eof_remote:Z

    iput-boolean v3, p0, Lcom/jcraft/jsch/Channel;->eof_local:Z

    .line 449
    :try_start_0
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    const/16 v2, 0x64

    invoke-direct {v0, v2}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    .line 450
    .local v0, buf:Lcom/jcraft/jsch/Buffer;
    new-instance v1, Lcom/jcraft/jsch/Packet;

    invoke-direct {v1, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 451
    .local v1, packet:Lcom/jcraft/jsch/Packet;
    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 452
    const/16 v2, 0x61

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 453
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 454
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 455
    :try_start_1
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 456
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 458
    .end local v0           #buf:Lcom/jcraft/jsch/Buffer;
    .end local v1           #packet:Lcom/jcraft/jsch/Packet;
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public connect()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 145
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/Channel;->connect(I)V

    .line 146
    return-void
.end method

.method public connect(I)V
    .locals 3
    .parameter "connectTimeout"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 149
    iput p1, p0, Lcom/jcraft/jsch/Channel;->connectTimeout:I

    .line 151
    :try_start_0
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->sendChannelOpen()V

    .line 152
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    return-void

    .line 154
    :catch_0
    move-exception v0

    .line 155
    .local v0, e:Ljava/lang/Exception;
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/jcraft/jsch/Channel;->connected:Z

    .line 156
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->disconnect()V

    .line 157
    instance-of v1, v0, Lcom/jcraft/jsch/JSchException;

    if-eqz v1, :cond_0

    .line 158
    check-cast v0, Lcom/jcraft/jsch/JSchException;

    .end local v0           #e:Ljava/lang/Exception;
    throw v0

    .line 159
    .restart local v0       #e:Ljava/lang/Exception;
    :cond_0
    new-instance v1, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public disconnect()V
    .locals 1

    .prologue
    .line 492
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 493
    :try_start_1
    iget-boolean v0, p0, Lcom/jcraft/jsch/Channel;->connected:Z

    if-nez v0, :cond_0

    .line 494
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 516
    invoke-static {p0}, Lcom/jcraft/jsch/Channel;->del(Lcom/jcraft/jsch/Channel;)V

    .line 518
    :goto_0
    return-void

    .line 496
    :cond_0
    const/4 v0, 0x0

    :try_start_2
    iput-boolean v0, p0, Lcom/jcraft/jsch/Channel;->connected:Z

    .line 497
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 499
    :try_start_3
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->close()V

    .line 501
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/jcraft/jsch/Channel;->eof_local:Z

    iput-boolean v0, p0, Lcom/jcraft/jsch/Channel;->eof_remote:Z

    .line 503
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/Channel;->thread:Ljava/lang/Thread;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 506
    :try_start_4
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    if-eqz v0, :cond_1

    .line 507
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v0}, Lcom/jcraft/jsch/IO;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 516
    :cond_1
    :goto_1
    invoke-static {p0}, Lcom/jcraft/jsch/Channel;->del(Lcom/jcraft/jsch/Channel;)V

    goto :goto_0

    .line 497
    :catchall_0
    move-exception v0

    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 516
    :catchall_1
    move-exception v0

    invoke-static {p0}, Lcom/jcraft/jsch/Channel;->del(Lcom/jcraft/jsch/Channel;)V

    throw v0

    .line 510
    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method eof()V
    .locals 3

    .prologue
    .line 384
    iget-boolean v2, p0, Lcom/jcraft/jsch/Channel;->eof_local:Z

    if-eqz v2, :cond_0

    .line 405
    :goto_0
    return-void

    .line 385
    :cond_0
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/jcraft/jsch/Channel;->eof_local:Z

    .line 388
    :try_start_0
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    const/16 v2, 0x64

    invoke-direct {v0, v2}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    .line 389
    .local v0, buf:Lcom/jcraft/jsch/Buffer;
    new-instance v1, Lcom/jcraft/jsch/Packet;

    invoke-direct {v1, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 390
    .local v1, packet:Lcom/jcraft/jsch/Packet;
    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 391
    const/16 v2, 0x60

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 392
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 393
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 394
    :try_start_1
    iget-boolean v2, p0, Lcom/jcraft/jsch/Channel;->close:Z

    if-nez v2, :cond_1

    .line 395
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 396
    :cond_1
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 398
    .end local v0           #buf:Lcom/jcraft/jsch/Buffer;
    .end local v1           #packet:Lcom/jcraft/jsch/Packet;
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method eof_remote()V
    .locals 1

    .prologue
    .line 376
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/jcraft/jsch/Channel;->eof_remote:Z

    .line 378
    :try_start_0
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v0}, Lcom/jcraft/jsch/IO;->out_close()V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 381
    :goto_0
    return-void

    .line 380
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method protected genChannelOpenPacket()Lcom/jcraft/jsch/Packet;
    .locals 3

    .prologue
    .line 614
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    const/16 v2, 0x64

    invoke-direct {v0, v2}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    .line 615
    .local v0, buf:Lcom/jcraft/jsch/Buffer;
    new-instance v1, Lcom/jcraft/jsch/Packet;

    invoke-direct {v1, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 621
    .local v1, packet:Lcom/jcraft/jsch/Packet;
    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 622
    const/16 v2, 0x5a

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 623
    iget-object v2, p0, Lcom/jcraft/jsch/Channel;->type:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 624
    iget v2, p0, Lcom/jcraft/jsch/Channel;->id:I

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 625
    iget v2, p0, Lcom/jcraft/jsch/Channel;->lwsize:I

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 626
    iget v2, p0, Lcom/jcraft/jsch/Channel;->lmpsize:I

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 627
    return-object v1
.end method

.method getData(Lcom/jcraft/jsch/Buffer;)V
    .locals 2
    .parameter "buf"

    .prologue
    .line 171
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/Channel;->setRecipient(I)V

    .line 172
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getUInt()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/jcraft/jsch/Channel;->setRemoteWindowSize(J)V

    .line 173
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/Channel;->setRemotePacketSize(I)V

    .line 174
    return-void
.end method

.method public getExitStatus()I
    .locals 1

    .prologue
    .line 570
    iget v0, p0, Lcom/jcraft/jsch/Channel;->exitstatus:I

    return v0
.end method

.method public getExtInputStream()Ljava/io/InputStream;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 203
    new-instance v0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    const v1, 0x8000

    invoke-direct {v0, p0, v1}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;-><init>(Lcom/jcraft/jsch/Channel;I)V

    .line 207
    .local v0, in:Ljava/io/PipedInputStream;
    iget-object v1, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    new-instance v2, Lcom/jcraft/jsch/Channel$PassiveOutputStream;

    invoke-direct {v2, p0, v0}, Lcom/jcraft/jsch/Channel$PassiveOutputStream;-><init>(Lcom/jcraft/jsch/Channel;Ljava/io/PipedInputStream;)V

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/jcraft/jsch/IO;->setExtOutputStream(Ljava/io/OutputStream;Z)V

    .line 208
    return-object v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 583
    iget v0, p0, Lcom/jcraft/jsch/Channel;->id:I

    return v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 195
    new-instance v0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    const v1, 0x8000

    invoke-direct {v0, p0, v1}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;-><init>(Lcom/jcraft/jsch/Channel;I)V

    .line 199
    .local v0, in:Ljava/io/PipedInputStream;
    iget-object v1, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    new-instance v2, Lcom/jcraft/jsch/Channel$PassiveOutputStream;

    invoke-direct {v2, p0, v0}, Lcom/jcraft/jsch/Channel$PassiveOutputStream;-><init>(Lcom/jcraft/jsch/Channel;Ljava/io/PipedInputStream;)V

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/jcraft/jsch/IO;->setOutputStream(Ljava/io/OutputStream;Z)V

    .line 200
    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 219
    move-object v0, p0

    .line 220
    .local v0, channel:Lcom/jcraft/jsch/Channel;
    new-instance v1, Lcom/jcraft/jsch/Channel$1;

    invoke-direct {v1, p0, v0}, Lcom/jcraft/jsch/Channel$1;-><init>(Lcom/jcraft/jsch/Channel;Lcom/jcraft/jsch/Channel;)V

    .line 316
    .local v1, out:Ljava/io/OutputStream;
    return-object v1
.end method

.method getRecipient()I
    .locals 1

    .prologue
    .line 138
    iget v0, p0, Lcom/jcraft/jsch/Channel;->recipient:I

    return v0
.end method

.method public getSession()Lcom/jcraft/jsch/Session;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 577
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->session:Lcom/jcraft/jsch/Session;

    .line 578
    .local v0, _session:Lcom/jcraft/jsch/Session;
    if-nez v0, :cond_0

    .line 579
    new-instance v1, Lcom/jcraft/jsch/JSchException;

    const-string v2, "session is not available"

    invoke-direct {v1, v2}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 581
    :cond_0
    return-object v0
.end method

.method init()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 142
    return-void
.end method

.method public isClosed()Z
    .locals 1

    .prologue
    .line 463
    iget-boolean v0, p0, Lcom/jcraft/jsch/Channel;->close:Z

    return v0
.end method

.method public isConnected()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 521
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->session:Lcom/jcraft/jsch/Session;

    .line 522
    .local v0, _session:Lcom/jcraft/jsch/Session;
    if-eqz v0, :cond_0

    .line 523
    invoke-virtual {v0}, Lcom/jcraft/jsch/Session;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/jcraft/jsch/Channel;->connected:Z

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    .line 525
    :cond_0
    return v1
.end method

.method public isEOF()Z
    .locals 1

    .prologue
    .line 168
    iget-boolean v0, p0, Lcom/jcraft/jsch/Channel;->eof_remote:Z

    return v0
.end method

.method public run()V
    .locals 0

    .prologue
    .line 359
    return-void
.end method

.method protected sendChannelOpen()V
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v14, 0x1

    const/4 v13, -0x1

    const-wide/16 v11, 0x0

    .line 631
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v0

    .line 632
    .local v0, _session:Lcom/jcraft/jsch/Session;
    invoke-virtual {v0}, Lcom/jcraft/jsch/Session;->isConnected()Z

    move-result v9

    if-nez v9, :cond_0

    .line 633
    new-instance v9, Lcom/jcraft/jsch/JSchException;

    const-string v10, "session is down"

    invoke-direct {v9, v10}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 636
    :cond_0
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->genChannelOpenPacket()Lcom/jcraft/jsch/Packet;

    move-result-object v1

    .line 637
    .local v1, packet:Lcom/jcraft/jsch/Packet;
    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 639
    const/16 v2, 0xa

    .line 640
    .local v2, retry:I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 641
    .local v3, start:J
    iget v9, p0, Lcom/jcraft/jsch/Channel;->connectTimeout:I

    int-to-long v7, v9

    .line 642
    .local v7, timeout:J
    cmp-long v9, v7, v11

    if-eqz v9, :cond_1

    const/4 v2, 0x1

    .line 643
    :cond_1
    monitor-enter p0

    .line 646
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v9

    if-ne v9, v13, :cond_4

    invoke-virtual {v0}, Lcom/jcraft/jsch/Session;->isConnected()Z

    move-result v9

    if-eqz v9, :cond_4

    if-lez v2, :cond_4

    .line 647
    cmp-long v9, v7, v11

    if-lez v9, :cond_2

    .line 648
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v9

    sub-long/2addr v9, v3

    cmp-long v9, v9, v7

    if-lez v9, :cond_2

    .line 649
    const/4 v2, 0x0

    .line 650
    goto :goto_0

    .line 654
    :cond_2
    cmp-long v9, v7, v11

    if-nez v9, :cond_3

    const-wide/16 v5, 0x1388

    .line 655
    .local v5, t:J
    :goto_1
    const/4 v9, 0x1

    :try_start_1
    iput v9, p0, Lcom/jcraft/jsch/Channel;->notifyme:I

    .line 656
    invoke-virtual {p0, v5, v6}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 661
    const/4 v9, 0x0

    :try_start_2
    iput v9, p0, Lcom/jcraft/jsch/Channel;->notifyme:I

    .line 663
    :goto_2
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .end local v5           #t:J
    :cond_3
    move-wide v5, v7

    .line 654
    goto :goto_1

    .line 658
    .restart local v5       #t:J
    :catch_0
    move-exception v9

    .line 661
    const/4 v9, 0x0

    iput v9, p0, Lcom/jcraft/jsch/Channel;->notifyme:I

    goto :goto_2

    .line 665
    .end local v5           #t:J
    :catchall_0
    move-exception v9

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v9

    .line 661
    .restart local v5       #t:J
    :catchall_1
    move-exception v9

    const/4 v10, 0x0

    :try_start_3
    iput v10, p0, Lcom/jcraft/jsch/Channel;->notifyme:I

    throw v9

    .line 665
    .end local v5           #t:J
    :cond_4
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 666
    invoke-virtual {v0}, Lcom/jcraft/jsch/Session;->isConnected()Z

    move-result v9

    if-nez v9, :cond_5

    .line 667
    new-instance v9, Lcom/jcraft/jsch/JSchException;

    const-string v10, "session is down"

    invoke-direct {v9, v10}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 669
    :cond_5
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v9

    if-ne v9, v13, :cond_6

    .line 670
    new-instance v9, Lcom/jcraft/jsch/JSchException;

    const-string v10, "channel is not opened."

    invoke-direct {v9, v10}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 672
    :cond_6
    iget-boolean v9, p0, Lcom/jcraft/jsch/Channel;->open_confirmation:Z

    if-nez v9, :cond_7

    .line 673
    new-instance v9, Lcom/jcraft/jsch/JSchException;

    const-string v10, "channel is not opened."

    invoke-direct {v9, v10}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 675
    :cond_7
    iput-boolean v14, p0, Lcom/jcraft/jsch/Channel;->connected:Z

    .line 676
    return-void
.end method

.method protected sendOpenConfirmation()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 586
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    const/16 v2, 0x64

    invoke-direct {v0, v2}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    .line 587
    .local v0, buf:Lcom/jcraft/jsch/Buffer;
    new-instance v1, Lcom/jcraft/jsch/Packet;

    invoke-direct {v1, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 588
    .local v1, packet:Lcom/jcraft/jsch/Packet;
    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 589
    const/16 v2, 0x5b

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 590
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 591
    iget v2, p0, Lcom/jcraft/jsch/Channel;->id:I

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 592
    iget v2, p0, Lcom/jcraft/jsch/Channel;->lwsize:I

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 593
    iget v2, p0, Lcom/jcraft/jsch/Channel;->lmpsize:I

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 594
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 595
    return-void
.end method

.method protected sendOpenFailure(I)V
    .locals 3
    .parameter "reasoncode"

    .prologue
    .line 599
    :try_start_0
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    const/16 v2, 0x64

    invoke-direct {v0, v2}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    .line 600
    .local v0, buf:Lcom/jcraft/jsch/Buffer;
    new-instance v1, Lcom/jcraft/jsch/Packet;

    invoke-direct {v1, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 601
    .local v1, packet:Lcom/jcraft/jsch/Packet;
    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 602
    const/16 v2, 0x5c

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 603
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 604
    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 605
    const-string v2, "open failed"

    invoke-static {v2}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 606
    sget-object v2, Lcom/jcraft/jsch/Util;->empty:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 607
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 611
    .end local v0           #buf:Lcom/jcraft/jsch/Buffer;
    .end local v1           #packet:Lcom/jcraft/jsch/Packet;
    :goto_0
    return-void

    .line 609
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public sendSignal(Ljava/lang/String;)V
    .locals 2
    .parameter "signal"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 529
    new-instance v0, Lcom/jcraft/jsch/RequestSignal;

    invoke-direct {v0}, Lcom/jcraft/jsch/RequestSignal;-><init>()V

    .line 530
    .local v0, request:Lcom/jcraft/jsch/RequestSignal;
    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/RequestSignal;->setSignal(Ljava/lang/String;)V

    .line 531
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Lcom/jcraft/jsch/RequestSignal;->request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;)V

    .line 532
    return-void
.end method

.method setExitStatus(I)V
    .locals 0
    .parameter "status"

    .prologue
    .line 569
    iput p1, p0, Lcom/jcraft/jsch/Channel;->exitstatus:I

    return-void
.end method

.method public setExtOutputStream(Ljava/io/OutputStream;)V
    .locals 2
    .parameter "out"

    .prologue
    .line 189
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/jcraft/jsch/IO;->setExtOutputStream(Ljava/io/OutputStream;Z)V

    .line 190
    return-void
.end method

.method public setExtOutputStream(Ljava/io/OutputStream;Z)V
    .locals 1
    .parameter "out"
    .parameter "dontclose"

    .prologue
    .line 192
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v0, p1, p2}, Lcom/jcraft/jsch/IO;->setExtOutputStream(Ljava/io/OutputStream;Z)V

    .line 193
    return-void
.end method

.method public setInputStream(Ljava/io/InputStream;)V
    .locals 2
    .parameter "in"

    .prologue
    .line 177
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/jcraft/jsch/IO;->setInputStream(Ljava/io/InputStream;Z)V

    .line 178
    return-void
.end method

.method public setInputStream(Ljava/io/InputStream;Z)V
    .locals 1
    .parameter "in"
    .parameter "dontclose"

    .prologue
    .line 180
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v0, p1, p2}, Lcom/jcraft/jsch/IO;->setInputStream(Ljava/io/InputStream;Z)V

    .line 181
    return-void
.end method

.method setLocalPacketSize(I)V
    .locals 0
    .parameter "foo"

    .prologue
    .line 349
    iput p1, p0, Lcom/jcraft/jsch/Channel;->lmpsize:I

    return-void
.end method

.method setLocalWindowSize(I)V
    .locals 0
    .parameter "foo"

    .prologue
    .line 348
    iput p1, p0, Lcom/jcraft/jsch/Channel;->lwsize:I

    return-void
.end method

.method setLocalWindowSizeMax(I)V
    .locals 0
    .parameter "foo"

    .prologue
    .line 347
    iput p1, p0, Lcom/jcraft/jsch/Channel;->lwsize_max:I

    return-void
.end method

.method public setOutputStream(Ljava/io/OutputStream;)V
    .locals 2
    .parameter "out"

    .prologue
    .line 183
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/jcraft/jsch/IO;->setOutputStream(Ljava/io/OutputStream;Z)V

    .line 184
    return-void
.end method

.method public setOutputStream(Ljava/io/OutputStream;Z)V
    .locals 1
    .parameter "out"
    .parameter "dontclose"

    .prologue
    .line 186
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v0, p1, p2}, Lcom/jcraft/jsch/IO;->setOutputStream(Ljava/io/OutputStream;Z)V

    .line 187
    return-void
.end method

.method declared-synchronized setRecipient(I)V
    .locals 1
    .parameter "foo"

    .prologue
    .line 133
    monitor-enter p0

    :try_start_0
    iput p1, p0, Lcom/jcraft/jsch/Channel;->recipient:I

    .line 134
    iget v0, p0, Lcom/jcraft/jsch/Channel;->notifyme:I

    if-lez v0, :cond_0

    .line 135
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 136
    :cond_0
    monitor-exit p0

    return-void

    .line 133
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method setRemotePacketSize(I)V
    .locals 0
    .parameter "foo"

    .prologue
    .line 356
    iput p1, p0, Lcom/jcraft/jsch/Channel;->rmpsize:I

    return-void
.end method

.method declared-synchronized setRemoteWindowSize(J)V
    .locals 1
    .parameter "foo"

    .prologue
    .line 350
    monitor-enter p0

    :try_start_0
    iput-wide p1, p0, Lcom/jcraft/jsch/Channel;->rwsize:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method setSession(Lcom/jcraft/jsch/Session;)V
    .locals 0
    .parameter "session"

    .prologue
    .line 573
    iput-object p1, p0, Lcom/jcraft/jsch/Channel;->session:Lcom/jcraft/jsch/Session;

    .line 574
    return-void
.end method

.method public setXForwarding(Z)V
    .locals 0
    .parameter "foo"

    .prologue
    .line 164
    return-void
.end method

.method public start()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 166
    return-void
.end method

.method write([B)V
    .locals 2
    .parameter "foo"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 362
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/jcraft/jsch/Channel;->write([BII)V

    .line 363
    return-void
.end method

.method write([BII)V
    .locals 1
    .parameter "foo"
    .parameter "s"
    .parameter "l"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 366
    :try_start_0
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v0, p1, p2, p3}, Lcom/jcraft/jsch/IO;->put([BII)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 368
    :goto_0
    return-void

    .line 367
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method write_ext([BII)V
    .locals 1
    .parameter "foo"
    .parameter "s"
    .parameter "l"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 371
    :try_start_0
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v0, p1, p2, p3}, Lcom/jcraft/jsch/IO;->put_ext([BII)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 373
    :goto_0
    return-void

    .line 372
    :catch_0
    move-exception v0

    goto :goto_0
.end method

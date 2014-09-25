.class Lcom/jcraft/jsch/UserAuthNone;
.super Lcom/jcraft/jsch/UserAuth;
.source "UserAuthNone.java"


# static fields
.field private static final SSH_MSG_SERVICE_ACCEPT:I = 0x6


# instance fields
.field private methods:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/jcraft/jsch/UserAuth;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/UserAuthNone;->methods:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method getMethods()Ljava/lang/String;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lcom/jcraft/jsch/UserAuthNone;->methods:Ljava/lang/String;

    return-object v0
.end method

.method public start(Lcom/jcraft/jsch/Session;)Z
    .locals 12
    .parameter "session"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 37
    invoke-super {p0, p1}, Lcom/jcraft/jsch/UserAuth;->start(Lcom/jcraft/jsch/Session;)Z

    .line 43
    iget-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v10}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 44
    iget-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->buf:Lcom/jcraft/jsch/Buffer;

    const/4 v11, 0x5

    invoke-virtual {v10, v11}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 45
    iget-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->buf:Lcom/jcraft/jsch/Buffer;

    const-string v11, "ssh-userauth"

    invoke-static {v11}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 46
    iget-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {p1, v10}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 48
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v10

    invoke-interface {v10, v8}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 49
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v10

    const-string v11, "SSH_MSG_SERVICE_REQUEST sent"

    invoke-interface {v10, v8, v11}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 56
    :cond_0
    iget-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {p1, v10}, Lcom/jcraft/jsch/Session;->read(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/Buffer;

    move-result-object v10

    iput-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->buf:Lcom/jcraft/jsch/Buffer;

    .line 57
    iget-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v10}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v2

    .line 59
    .local v2, command:I
    const/4 v10, 0x6

    if-ne v2, v10, :cond_2

    move v7, v8

    .line 61
    .local v7, result:Z
    :goto_0
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v10

    invoke-interface {v10, v8}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 62
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v10

    const-string v11, "SSH_MSG_SERVICE_ACCEPT received"

    invoke-interface {v10, v8, v11}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 65
    :cond_1
    if-nez v7, :cond_3

    .line 124
    :goto_1
    return v9

    .end local v7           #result:Z
    :cond_2
    move v7, v9

    .line 59
    goto :goto_0

    .line 68
    .restart local v7       #result:Z
    :cond_3
    const/4 v1, 0x0

    .line 69
    .local v1, _username:[B
    iget-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->username:Ljava/lang/String;

    invoke-static {v10}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v1

    .line 76
    iget-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v10}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 77
    iget-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->buf:Lcom/jcraft/jsch/Buffer;

    const/16 v11, 0x32

    invoke-virtual {v10, v11}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 78
    iget-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v10, v1}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 79
    iget-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->buf:Lcom/jcraft/jsch/Buffer;

    const-string v11, "ssh-connection"

    invoke-static {v11}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 80
    iget-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->buf:Lcom/jcraft/jsch/Buffer;

    const-string v11, "none"

    invoke-static {v11}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 81
    iget-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {p1, v10}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 85
    :cond_4
    :goto_2
    iget-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {p1, v10}, Lcom/jcraft/jsch/Session;->read(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/Buffer;

    move-result-object v10

    iput-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->buf:Lcom/jcraft/jsch/Buffer;

    .line 86
    iget-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v10}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v10

    and-int/lit16 v2, v10, 0xff

    .line 88
    const/16 v10, 0x34

    if-ne v2, v10, :cond_5

    move v9, v8

    .line 89
    goto :goto_1

    .line 91
    :cond_5
    const/16 v10, 0x35

    if-ne v2, v10, :cond_6

    .line 92
    iget-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v10}, Lcom/jcraft/jsch/Buffer;->getInt()I

    iget-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v10}, Lcom/jcraft/jsch/Buffer;->getByte()I

    iget-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v10}, Lcom/jcraft/jsch/Buffer;->getByte()I

    .line 93
    iget-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v10}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v0

    .line 94
    .local v0, _message:[B
    iget-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v10}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v4

    .line 95
    .local v4, lang:[B
    invoke-static {v0}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v5

    .line 96
    .local v5, message:Ljava/lang/String;
    iget-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->userinfo:Lcom/jcraft/jsch/UserInfo;

    if-eqz v10, :cond_4

    .line 98
    :try_start_0
    iget-object v10, p0, Lcom/jcraft/jsch/UserAuthNone;->userinfo:Lcom/jcraft/jsch/UserInfo;

    invoke-interface {v10, v5}, Lcom/jcraft/jsch/UserInfo;->showMessage(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 100
    :catch_0
    move-exception v10

    goto :goto_2

    .line 105
    .end local v0           #_message:[B
    .end local v4           #lang:[B
    .end local v5           #message:Ljava/lang/String;
    :cond_6
    const/16 v8, 0x33

    if-ne v2, v8, :cond_7

    .line 106
    iget-object v8, p0, Lcom/jcraft/jsch/UserAuthNone;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v8}, Lcom/jcraft/jsch/Buffer;->getInt()I

    iget-object v8, p0, Lcom/jcraft/jsch/UserAuthNone;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v8}, Lcom/jcraft/jsch/Buffer;->getByte()I

    iget-object v8, p0, Lcom/jcraft/jsch/UserAuthNone;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v8}, Lcom/jcraft/jsch/Buffer;->getByte()I

    .line 107
    iget-object v8, p0, Lcom/jcraft/jsch/UserAuthNone;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v8}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v3

    .line 108
    .local v3, foo:[B
    iget-object v8, p0, Lcom/jcraft/jsch/UserAuthNone;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v8}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v6

    .line 109
    .local v6, partial_success:I
    invoke-static {v3}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/jcraft/jsch/UserAuthNone;->methods:Ljava/lang/String;

    goto/16 :goto_1

    .line 120
    .end local v3           #foo:[B
    .end local v6           #partial_success:I
    :cond_7
    new-instance v8, Lcom/jcraft/jsch/JSchException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "USERAUTH fail ("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ")"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v8
.end method

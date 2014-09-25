.class Lcom/jcraft/jsch/UserAuthPassword;
.super Lcom/jcraft/jsch/UserAuth;
.source "UserAuthPassword.java"


# instance fields
.field private final SSH_MSG_USERAUTH_PASSWD_CHANGEREQ:I


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/jcraft/jsch/UserAuth;-><init>()V

    .line 33
    const/16 v0, 0x3c

    iput v0, p0, Lcom/jcraft/jsch/UserAuthPassword;->SSH_MSG_USERAUTH_PASSWD_CHANGEREQ:I

    return-void
.end method


# virtual methods
.method public start(Lcom/jcraft/jsch/Session;)Z
    .locals 22
    .parameter "session"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 36
    invoke-super/range {p0 .. p1}, Lcom/jcraft/jsch/UserAuth;->start(Lcom/jcraft/jsch/Session;)Z

    .line 38
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->password:[B

    move-object/from16 v17, v0

    .line 39
    .local v17, password:[B
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPassword;->username:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v20, "@"

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 40
    .local v2, dest:Ljava/lang/String;
    move-object/from16 v0, p1

    iget v4, v0, Lcom/jcraft/jsch/Session;->port:I

    const/16 v20, 0x16

    move/from16 v0, v20

    if-eq v4, v0, :cond_0

    .line 41
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v20, ":"

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p1

    iget v0, v0, Lcom/jcraft/jsch/Session;->port:I

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 48
    :cond_0
    :goto_0
    :try_start_0
    move-object/from16 v0, p1

    iget v4, v0, Lcom/jcraft/jsch/Session;->auth_failures:I

    move-object/from16 v0, p1

    iget v0, v0, Lcom/jcraft/jsch/Session;->max_auth_tries:I

    move/from16 v20, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move/from16 v0, v20

    if-lt v4, v0, :cond_2

    .line 49
    const/4 v4, 0x0

    .line 184
    if-eqz v17, :cond_1

    .line 185
    invoke-static/range {v17 .. v17}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 186
    const/16 v17, 0x0

    :cond_1
    :goto_1
    return v4

    .line 52
    :cond_2
    if-nez v17, :cond_7

    .line 53
    :try_start_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->userinfo:Lcom/jcraft/jsch/UserInfo;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v4, :cond_3

    .line 55
    const/4 v4, 0x0

    .line 184
    if-eqz v17, :cond_1

    .line 185
    invoke-static/range {v17 .. v17}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 186
    const/16 v17, 0x0

    goto :goto_1

    .line 57
    :cond_3
    :try_start_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->userinfo:Lcom/jcraft/jsch/UserInfo;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Password for "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v4, v0}, Lcom/jcraft/jsch/UserInfo;->promptPassword(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 58
    new-instance v4, Lcom/jcraft/jsch/JSchAuthCancelException;

    const-string v20, "password"

    move-object/from16 v0, v20

    invoke-direct {v4, v0}, Lcom/jcraft/jsch/JSchAuthCancelException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 184
    :catchall_0
    move-exception v4

    if-eqz v17, :cond_4

    .line 185
    invoke-static/range {v17 .. v17}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 186
    const/16 v17, 0x0

    :cond_4
    throw v4

    .line 62
    :cond_5
    :try_start_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->userinfo:Lcom/jcraft/jsch/UserInfo;

    invoke-interface {v4}, Lcom/jcraft/jsch/UserInfo;->getPassword()Ljava/lang/String;

    move-result-object v8

    .line 63
    .local v8, _password:Ljava/lang/String;
    if-nez v8, :cond_6

    .line 64
    new-instance v4, Lcom/jcraft/jsch/JSchAuthCancelException;

    const-string v20, "password"

    move-object/from16 v0, v20

    invoke-direct {v4, v0}, Lcom/jcraft/jsch/JSchAuthCancelException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 67
    :cond_6
    invoke-static {v8}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v17

    .line 70
    .end local v8           #_password:Ljava/lang/String;
    :cond_7
    const/4 v9, 0x0

    .line 71
    .local v9, _username:[B
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->username:Ljava/lang/String;

    invoke-static {v4}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v9

    .line 80
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v4}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 81
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    const/16 v20, 0x32

    move/from16 v0, v20

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 82
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v4, v9}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 83
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    const-string v20, "ssh-connection"

    invoke-static/range {v20 .. v20}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 84
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    const-string v20, "password"

    invoke-static/range {v20 .. v20}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 85
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 86
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 87
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->packet:Lcom/jcraft/jsch/Packet;

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 91
    :cond_8
    :goto_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/jcraft/jsch/Session;->read(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/Buffer;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    .line 92
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getCommand()B
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v4

    and-int/lit16 v10, v4, 0xff

    .line 94
    .local v10, command:I
    const/16 v4, 0x34

    if-ne v10, v4, :cond_9

    .line 95
    const/4 v4, 0x1

    .line 184
    if-eqz v17, :cond_1

    .line 185
    invoke-static/range {v17 .. v17}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 186
    const/16 v17, 0x0

    goto/16 :goto_1

    .line 97
    :cond_9
    const/16 v4, 0x35

    if-ne v10, v4, :cond_a

    .line 98
    :try_start_4
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getByte()I

    .line 99
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v7

    .line 100
    .local v7, _message:[B
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v13

    .line 101
    .local v13, lang:[B
    invoke-static {v7}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v14

    .line 102
    .local v14, message:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->userinfo:Lcom/jcraft/jsch/UserInfo;

    if-eqz v4, :cond_8

    .line 103
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->userinfo:Lcom/jcraft/jsch/UserInfo;

    invoke-interface {v4, v14}, Lcom/jcraft/jsch/UserInfo;->showMessage(Ljava/lang/String;)V

    goto :goto_2

    .line 107
    .end local v7           #_message:[B
    .end local v13           #lang:[B
    .end local v14           #message:Ljava/lang/String;
    :cond_a
    const/16 v4, 0x3c

    if-ne v10, v4, :cond_f

    .line 108
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getByte()I

    .line 109
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v12

    .line 110
    .local v12, instruction:[B
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v19

    .line 111
    .local v19, tag:[B
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->userinfo:Lcom/jcraft/jsch/UserInfo;

    if-eqz v4, :cond_b

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->userinfo:Lcom/jcraft/jsch/UserInfo;

    instance-of v4, v4, Lcom/jcraft/jsch/UIKeyboardInteractive;

    if-nez v4, :cond_d

    .line 113
    :cond_b
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->userinfo:Lcom/jcraft/jsch/UserInfo;

    if-eqz v4, :cond_c

    .line 114
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->userinfo:Lcom/jcraft/jsch/UserInfo;

    const-string v20, "Password must be changed."

    move-object/from16 v0, v20

    invoke-interface {v4, v0}, Lcom/jcraft/jsch/UserInfo;->showMessage(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 116
    :cond_c
    const/4 v4, 0x0

    .line 184
    if-eqz v17, :cond_1

    .line 185
    invoke-static/range {v17 .. v17}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 186
    const/16 v17, 0x0

    goto/16 :goto_1

    .line 119
    :cond_d
    :try_start_5
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/jcraft/jsch/UserAuthPassword;->userinfo:Lcom/jcraft/jsch/UserInfo;

    check-cast v1, Lcom/jcraft/jsch/UIKeyboardInteractive;

    .line 121
    .local v1, kbi:Lcom/jcraft/jsch/UIKeyboardInteractive;
    const-string v3, "Password Change Required"

    .line 122
    .local v3, name:Ljava/lang/String;
    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v20, "New Password: "

    aput-object v20, v5, v4

    .line 123
    .local v5, prompt:[Ljava/lang/String;
    const/4 v4, 0x1

    new-array v6, v4, [Z

    const/4 v4, 0x0

    const/16 v20, 0x0

    aput-boolean v20, v6, v4

    .line 124
    .local v6, echo:[Z
    invoke-static {v12}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v4

    invoke-interface/range {v1 .. v6}, Lcom/jcraft/jsch/UIKeyboardInteractive;->promptKeyboardInteractive(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Z)[Ljava/lang/String;

    move-result-object v18

    .line 129
    .local v18, response:[Ljava/lang/String;
    if-nez v18, :cond_e

    .line 130
    new-instance v4, Lcom/jcraft/jsch/JSchAuthCancelException;

    const-string v20, "password"

    move-object/from16 v0, v20

    invoke-direct {v4, v0}, Lcom/jcraft/jsch/JSchAuthCancelException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 133
    :cond_e
    const/4 v4, 0x0

    aget-object v4, v18, v4

    invoke-static {v4}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v15

    .line 143
    .local v15, newpassword:[B
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v4}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 144
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    const/16 v20, 0x32

    move/from16 v0, v20

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 145
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v4, v9}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 146
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    const-string v20, "ssh-connection"

    invoke-static/range {v20 .. v20}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 147
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    const-string v20, "password"

    invoke-static/range {v20 .. v20}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 148
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    const/16 v20, 0x1

    move/from16 v0, v20

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 149
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 150
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v4, v15}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 151
    invoke-static {v15}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 152
    const/16 v18, 0x0

    .line 153
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->packet:Lcom/jcraft/jsch/Packet;

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    goto/16 :goto_2

    .line 156
    .end local v1           #kbi:Lcom/jcraft/jsch/UIKeyboardInteractive;
    .end local v3           #name:Ljava/lang/String;
    .end local v5           #prompt:[Ljava/lang/String;
    .end local v6           #echo:[Z
    .end local v12           #instruction:[B
    .end local v15           #newpassword:[B
    .end local v18           #response:[Ljava/lang/String;
    .end local v19           #tag:[B
    :cond_f
    const/16 v4, 0x33

    if-ne v10, v4, :cond_11

    .line 157
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getByte()I

    .line 158
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v11

    .line 159
    .local v11, foo:[B
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/UserAuthPassword;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v16

    .line 162
    .local v16, partial_success:I
    if-eqz v16, :cond_10

    .line 163
    new-instance v4, Lcom/jcraft/jsch/JSchPartialAuthException;

    invoke-static {v11}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-direct {v4, v0}, Lcom/jcraft/jsch/JSchPartialAuthException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 165
    :cond_10
    move-object/from16 v0, p1

    iget v4, v0, Lcom/jcraft/jsch/Session;->auth_failures:I

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p1

    iput v4, v0, Lcom/jcraft/jsch/Session;->auth_failures:I

    .line 175
    if-eqz v17, :cond_0

    .line 176
    invoke-static/range {v17 .. v17}, Lcom/jcraft/jsch/Util;->bzero([B)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 177
    const/16 v17, 0x0

    goto/16 :goto_0

    .line 171
    .end local v11           #foo:[B
    .end local v16           #partial_success:I
    :cond_11
    const/4 v4, 0x0

    .line 184
    if-eqz v17, :cond_1

    .line 185
    invoke-static/range {v17 .. v17}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 186
    const/16 v17, 0x0

    goto/16 :goto_1
.end method

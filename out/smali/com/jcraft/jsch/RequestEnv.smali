.class Lcom/jcraft/jsch/RequestEnv;
.super Lcom/jcraft/jsch/Request;
.source "RequestEnv.java"


# instance fields
.field name:[B

.field value:[B


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 32
    invoke-direct {p0}, Lcom/jcraft/jsch/Request;-><init>()V

    .line 33
    new-array v0, v1, [B

    iput-object v0, p0, Lcom/jcraft/jsch/RequestEnv;->name:[B

    .line 34
    new-array v0, v1, [B

    iput-object v0, p0, Lcom/jcraft/jsch/RequestEnv;->value:[B

    return-void
.end method


# virtual methods
.method public request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;)V
    .locals 3
    .parameter "session"
    .parameter "channel"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 40
    invoke-super {p0, p1, p2}, Lcom/jcraft/jsch/Request;->request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;)V

    .line 42
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v0}, Lcom/jcraft/jsch/Buffer;-><init>()V

    .line 43
    .local v0, buf:Lcom/jcraft/jsch/Buffer;
    new-instance v1, Lcom/jcraft/jsch/Packet;

    invoke-direct {v1, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 45
    .local v1, packet:Lcom/jcraft/jsch/Packet;
    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 46
    const/16 v2, 0x62

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 47
    invoke-virtual {p2}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 48
    const-string v2, "env"

    invoke-static {v2}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 49
    invoke-virtual {p0}, Lcom/jcraft/jsch/RequestEnv;->waitForReply()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    int-to-byte v2, v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 50
    iget-object v2, p0, Lcom/jcraft/jsch/RequestEnv;->name:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 51
    iget-object v2, p0, Lcom/jcraft/jsch/RequestEnv;->value:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 52
    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/RequestEnv;->write(Lcom/jcraft/jsch/Packet;)V

    .line 53
    return-void

    .line 49
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method setEnv([B[B)V
    .locals 0
    .parameter "name"
    .parameter "value"

    .prologue
    .line 36
    iput-object p1, p0, Lcom/jcraft/jsch/RequestEnv;->name:[B

    .line 37
    iput-object p2, p0, Lcom/jcraft/jsch/RequestEnv;->value:[B

    .line 38
    return-void
.end method

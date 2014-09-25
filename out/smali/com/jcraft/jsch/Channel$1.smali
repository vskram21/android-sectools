.class Lcom/jcraft/jsch/Channel$1;
.super Ljava/io/OutputStream;
.source "Channel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jcraft/jsch/Channel;->getOutputStream()Ljava/io/OutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field b:[B

.field private buffer:Lcom/jcraft/jsch/Buffer;

.field private closed:Z

.field private dataLen:I

.field private packet:Lcom/jcraft/jsch/Packet;

.field final synthetic this$0:Lcom/jcraft/jsch/Channel;

.field final synthetic val$channel:Lcom/jcraft/jsch/Channel;


# direct methods
.method constructor <init>(Lcom/jcraft/jsch/Channel;Lcom/jcraft/jsch/Channel;)V
    .locals 2
    .parameter
    .parameter

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 220
    iput-object p1, p0, Lcom/jcraft/jsch/Channel$1;->this$0:Lcom/jcraft/jsch/Channel;

    iput-object p2, p0, Lcom/jcraft/jsch/Channel$1;->val$channel:Lcom/jcraft/jsch/Channel;

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 221
    iput v0, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    .line 222
    iput-object v1, p0, Lcom/jcraft/jsch/Channel$1;->buffer:Lcom/jcraft/jsch/Buffer;

    .line 223
    iput-object v1, p0, Lcom/jcraft/jsch/Channel$1;->packet:Lcom/jcraft/jsch/Packet;

    .line 224
    iput-boolean v0, p0, Lcom/jcraft/jsch/Channel$1;->closed:Z

    .line 237
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/Channel$1;->b:[B

    return-void
.end method

.method private declared-synchronized init()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 226
    monitor-enter p0

    :try_start_0
    new-instance v1, Lcom/jcraft/jsch/Buffer;

    iget-object v2, p0, Lcom/jcraft/jsch/Channel$1;->this$0:Lcom/jcraft/jsch/Channel;

    iget v2, v2, Lcom/jcraft/jsch/Channel;->rmpsize:I

    invoke-direct {v1, v2}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    iput-object v1, p0, Lcom/jcraft/jsch/Channel$1;->buffer:Lcom/jcraft/jsch/Buffer;

    .line 227
    new-instance v1, Lcom/jcraft/jsch/Packet;

    iget-object v2, p0, Lcom/jcraft/jsch/Channel$1;->buffer:Lcom/jcraft/jsch/Buffer;

    invoke-direct {v1, v2}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    iput-object v1, p0, Lcom/jcraft/jsch/Channel$1;->packet:Lcom/jcraft/jsch/Packet;

    .line 229
    iget-object v1, p0, Lcom/jcraft/jsch/Channel$1;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .line 230
    .local v0, _buf:[B
    array-length v1, v0

    add-int/lit8 v1, v1, -0xe

    add-int/lit8 v1, v1, -0x54

    if-gtz v1, :cond_0

    .line 231
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/jcraft/jsch/Channel$1;->buffer:Lcom/jcraft/jsch/Buffer;

    .line 232
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/jcraft/jsch/Channel$1;->packet:Lcom/jcraft/jsch/Packet;

    .line 233
    new-instance v1, Ljava/io/IOException;

    const-string v2, "failed to initialize the channel."

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 226
    .end local v0           #_buf:[B
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 236
    .restart local v0       #_buf:[B
    :cond_0
    monitor-exit p0

    return-void
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 297
    iget-object v1, p0, Lcom/jcraft/jsch/Channel$1;->packet:Lcom/jcraft/jsch/Packet;

    if-nez v1, :cond_0

    .line 299
    :try_start_0
    invoke-direct {p0}, Lcom/jcraft/jsch/Channel$1;->init()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 306
    :cond_0
    iget-boolean v1, p0, Lcom/jcraft/jsch/Channel$1;->closed:Z

    if-eqz v1, :cond_1

    .line 314
    :goto_0
    return-void

    .line 301
    :catch_0
    move-exception v0

    .line 303
    .local v0, e:Ljava/io/IOException;
    goto :goto_0

    .line 309
    .end local v0           #e:Ljava/io/IOException;
    :cond_1
    iget v1, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    if-lez v1, :cond_2

    .line 310
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel$1;->flush()V

    .line 312
    :cond_2
    iget-object v1, p0, Lcom/jcraft/jsch/Channel$1;->val$channel:Lcom/jcraft/jsch/Channel;

    invoke-virtual {v1}, Lcom/jcraft/jsch/Channel;->eof()V

    .line 313
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/jcraft/jsch/Channel$1;->closed:Z

    goto :goto_0
.end method

.method public flush()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 272
    iget-boolean v2, p0, Lcom/jcraft/jsch/Channel$1;->closed:Z

    if-eqz v2, :cond_0

    .line 273
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Already closed"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 275
    :cond_0
    iget v2, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    if-nez v2, :cond_1

    .line 295
    :goto_0
    return-void

    .line 277
    :cond_1
    iget-object v2, p0, Lcom/jcraft/jsch/Channel$1;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v2}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 278
    iget-object v2, p0, Lcom/jcraft/jsch/Channel$1;->buffer:Lcom/jcraft/jsch/Buffer;

    const/16 v3, 0x5e

    invoke-virtual {v2, v3}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 279
    iget-object v2, p0, Lcom/jcraft/jsch/Channel$1;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v3, p0, Lcom/jcraft/jsch/Channel$1;->this$0:Lcom/jcraft/jsch/Channel;

    iget v3, v3, Lcom/jcraft/jsch/Channel;->recipient:I

    invoke-virtual {v2, v3}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 280
    iget-object v2, p0, Lcom/jcraft/jsch/Channel$1;->buffer:Lcom/jcraft/jsch/Buffer;

    iget v3, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    invoke-virtual {v2, v3}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 281
    iget-object v2, p0, Lcom/jcraft/jsch/Channel$1;->buffer:Lcom/jcraft/jsch/Buffer;

    iget v3, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    invoke-virtual {v2, v3}, Lcom/jcraft/jsch/Buffer;->skip(I)V

    .line 283
    :try_start_0
    iget v1, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    .line 284
    .local v1, foo:I
    const/4 v2, 0x0

    iput v2, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    .line 285
    iget-object v3, p0, Lcom/jcraft/jsch/Channel$1;->val$channel:Lcom/jcraft/jsch/Channel;

    monitor-enter v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 286
    :try_start_1
    iget-object v2, p0, Lcom/jcraft/jsch/Channel$1;->val$channel:Lcom/jcraft/jsch/Channel;

    iget-boolean v2, v2, Lcom/jcraft/jsch/Channel;->close:Z

    if-nez v2, :cond_2

    .line 287
    iget-object v2, p0, Lcom/jcraft/jsch/Channel$1;->this$0:Lcom/jcraft/jsch/Channel;

    invoke-virtual {v2}, Lcom/jcraft/jsch/Channel;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v2

    iget-object v4, p0, Lcom/jcraft/jsch/Channel$1;->packet:Lcom/jcraft/jsch/Packet;

    iget-object v5, p0, Lcom/jcraft/jsch/Channel$1;->val$channel:Lcom/jcraft/jsch/Channel;

    invoke-virtual {v2, v4, v5, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V

    .line 288
    :cond_2
    monitor-exit v3

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 290
    .end local v1           #foo:I
    :catch_0
    move-exception v0

    .line 291
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel$1;->close()V

    .line 292
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public write(I)V
    .locals 3
    .parameter "w"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 239
    iget-object v0, p0, Lcom/jcraft/jsch/Channel$1;->b:[B

    int-to-byte v1, p1

    aput-byte v1, v0, v2

    .line 240
    iget-object v0, p0, Lcom/jcraft/jsch/Channel$1;->b:[B

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v2, v1}, Lcom/jcraft/jsch/Channel$1;->write([BII)V

    .line 241
    return-void
.end method

.method public write([BII)V
    .locals 5
    .parameter "buf"
    .parameter "s"
    .parameter "l"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 243
    iget-object v3, p0, Lcom/jcraft/jsch/Channel$1;->packet:Lcom/jcraft/jsch/Packet;

    if-nez v3, :cond_0

    .line 244
    invoke-direct {p0}, Lcom/jcraft/jsch/Channel$1;->init()V

    .line 247
    :cond_0
    iget-boolean v3, p0, Lcom/jcraft/jsch/Channel$1;->closed:Z

    if-eqz v3, :cond_1

    .line 248
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Already closed"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 251
    :cond_1
    iget-object v3, p0, Lcom/jcraft/jsch/Channel$1;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v3, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .line 252
    .local v0, _buf:[B
    array-length v1, v0

    .line 253
    .local v1, _bufl:I
    :goto_0
    if-lez p3, :cond_4

    .line 254
    move v2, p3

    .line 255
    .local v2, _l:I
    iget v3, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    add-int/lit8 v3, v3, 0xe

    sub-int v3, v1, v3

    add-int/lit8 v3, v3, -0x54

    if-le p3, v3, :cond_2

    .line 256
    iget v3, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    add-int/lit8 v3, v3, 0xe

    sub-int v3, v1, v3

    add-int/lit8 v2, v3, -0x54

    .line 259
    :cond_2
    if-gtz v2, :cond_3

    .line 260
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel$1;->flush()V

    goto :goto_0

    .line 264
    :cond_3
    iget v3, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    add-int/lit8 v3, v3, 0xe

    invoke-static {p1, p2, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 265
    iget v3, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    add-int/2addr v3, v2

    iput v3, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    .line 266
    add-int/2addr p2, v2

    .line 267
    sub-int/2addr p3, v2

    .line 268
    goto :goto_0

    .line 269
    .end local v2           #_l:I
    :cond_4
    return-void
.end method

.class Lcom/jcraft/jsch/ChannelSftp$2;
.super Ljava/io/InputStream;
.source "ChannelSftp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jcraft/jsch/ChannelSftp;->get(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;J)Ljava/io/InputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field _data:[B

.field closed:Z

.field header:Lcom/jcraft/jsch/ChannelSftp$Header;

.field offset:J

.field request_max:I

.field request_offset:J

.field rest_byte:[B

.field rest_length:I

.field final synthetic this$0:Lcom/jcraft/jsch/ChannelSftp;

.field final synthetic val$handle:[B

.field final synthetic val$monitor:Lcom/jcraft/jsch/SftpProgressMonitor;

.field final synthetic val$skip:J


# direct methods
.method constructor <init>(Lcom/jcraft/jsch/ChannelSftp;JLcom/jcraft/jsch/SftpProgressMonitor;[B)V
    .locals 4
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1321
    iput-object p1, p0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    iput-wide p2, p0, Lcom/jcraft/jsch/ChannelSftp$2;->val$skip:J

    iput-object p4, p0, Lcom/jcraft/jsch/ChannelSftp$2;->val$monitor:Lcom/jcraft/jsch/SftpProgressMonitor;

    iput-object p5, p0, Lcom/jcraft/jsch/ChannelSftp$2;->val$handle:[B

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 1322
    iget-wide v0, p0, Lcom/jcraft/jsch/ChannelSftp$2;->val$skip:J

    iput-wide v0, p0, Lcom/jcraft/jsch/ChannelSftp$2;->offset:J

    .line 1323
    iput-boolean v2, p0, Lcom/jcraft/jsch/ChannelSftp$2;->closed:Z

    .line 1324
    iput v2, p0, Lcom/jcraft/jsch/ChannelSftp$2;->rest_length:I

    .line 1325
    new-array v0, v3, [B

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$2;->_data:[B

    .line 1326
    const/16 v0, 0x400

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$2;->rest_byte:[B

    .line 1327
    new-instance v0, Lcom/jcraft/jsch/ChannelSftp$Header;

    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$2;->header:Lcom/jcraft/jsch/ChannelSftp$Header;

    .line 1328
    iput v3, p0, Lcom/jcraft/jsch/ChannelSftp$2;->request_max:I

    .line 1329
    iget-wide v0, p0, Lcom/jcraft/jsch/ChannelSftp$2;->offset:J

    iput-wide v0, p0, Lcom/jcraft/jsch/ChannelSftp$2;->request_offset:J

    return-void
.end method


# virtual methods
.method public close()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1501
    iget-boolean v1, p0, Lcom/jcraft/jsch/ChannelSftp$2;->closed:Z

    if-eqz v1, :cond_0

    .line 1507
    :goto_0
    return-void

    .line 1502
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/jcraft/jsch/ChannelSftp$2;->closed:Z

    .line 1503
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$2;->val$monitor:Lcom/jcraft/jsch/SftpProgressMonitor;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$2;->val$monitor:Lcom/jcraft/jsch/SftpProgressMonitor;

    invoke-interface {v1}, Lcom/jcraft/jsch/SftpProgressMonitor;->end()V

    .line 1504
    :cond_1
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;
    invoke-static {v1}, Lcom/jcraft/jsch/ChannelSftp;->access$900(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    move-result-object v1

    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp$2;->header:Lcom/jcraft/jsch/ChannelSftp$Header;

    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;
    invoke-static {v3}, Lcom/jcraft/jsch/ChannelSftp;->access$700(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/Buffer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->cancel(Lcom/jcraft/jsch/ChannelSftp$Header;Lcom/jcraft/jsch/Buffer;)V

    .line 1505
    :try_start_0
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp$2;->val$handle:[B

    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSftp$2;->header:Lcom/jcraft/jsch/ChannelSftp$Header;

    #calls: Lcom/jcraft/jsch/ChannelSftp;->_sendCLOSE([BLcom/jcraft/jsch/ChannelSftp$Header;)Z
    invoke-static {v1, v2, v3}, Lcom/jcraft/jsch/ChannelSftp;->access$400(Lcom/jcraft/jsch/ChannelSftp;[BLcom/jcraft/jsch/ChannelSftp$Header;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1506
    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    new-instance v1, Ljava/io/IOException;

    const-string v2, "error"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public read()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v1, -0x1

    .line 1332
    iget-boolean v2, p0, Lcom/jcraft/jsch/ChannelSftp$2;->closed:Z

    if-eqz v2, :cond_1

    .line 1336
    :cond_0
    :goto_0
    return v1

    .line 1333
    :cond_1
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp$2;->_data:[B

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v4, v3}, Lcom/jcraft/jsch/ChannelSftp$2;->read([BII)I

    move-result v0

    .line 1334
    .local v0, i:I
    if-eq v0, v1, :cond_0

    .line 1336
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$2;->_data:[B

    aget-byte v1, v1, v4

    and-int/lit16 v1, v1, 0xff

    goto :goto_0
.end method

.method public read([B)I
    .locals 2
    .parameter "d"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1340
    iget-boolean v0, p0, Lcom/jcraft/jsch/ChannelSftp$2;->closed:Z

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    .line 1341
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/jcraft/jsch/ChannelSftp$2;->read([BII)I

    move-result v0

    goto :goto_0
.end method

.method public read([BII)I
    .locals 26
    .parameter "d"
    .parameter "s"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1344
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->closed:Z

    if-eqz v3, :cond_0

    const/16 v18, -0x1

    .line 1498
    :goto_0
    return v18

    .line 1345
    :cond_0
    if-nez p1, :cond_1

    new-instance v3, Ljava/lang/NullPointerException;

    invoke-direct {v3}, Ljava/lang/NullPointerException;-><init>()V

    throw v3

    .line 1346
    :cond_1
    if-ltz p2, :cond_2

    if-ltz p3, :cond_2

    add-int v3, p2, p3

    move-object/from16 v0, p1

    array-length v4, v0

    if-le v3, v4, :cond_3

    .line 1347
    :cond_2
    new-instance v3, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v3}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v3

    .line 1349
    :cond_3
    if-nez p3, :cond_4

    const/16 v18, 0x0

    goto :goto_0

    .line 1351
    :cond_4
    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->rest_length:I

    if-lez v3, :cond_8

    .line 1352
    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp$2;->rest_length:I

    move/from16 v18, v0

    .line 1353
    .local v18, foo:I
    move/from16 v0, v18

    move/from16 v1, p3

    if-le v0, v1, :cond_5

    move/from16 v18, p3

    .line 1354
    :cond_5
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->rest_byte:[B

    const/4 v4, 0x0

    move-object/from16 v0, p1

    move/from16 v1, p2

    move/from16 v2, v18

    invoke-static {v3, v4, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1355
    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->rest_length:I

    move/from16 v0, v18

    if-eq v0, v3, :cond_6

    .line 1356
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->rest_byte:[B

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/ChannelSftp$2;->rest_byte:[B

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget v6, v0, Lcom/jcraft/jsch/ChannelSftp$2;->rest_length:I

    sub-int v6, v6, v18

    move/from16 v0, v18

    invoke-static {v3, v0, v4, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1360
    :cond_6
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->val$monitor:Lcom/jcraft/jsch/SftpProgressMonitor;

    if-eqz v3, :cond_7

    .line 1361
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->val$monitor:Lcom/jcraft/jsch/SftpProgressMonitor;

    move/from16 v0, v18

    int-to-long v4, v0

    invoke-interface {v3, v4, v5}, Lcom/jcraft/jsch/SftpProgressMonitor;->count(J)Z

    move-result v3

    if-nez v3, :cond_7

    .line 1362
    invoke-virtual/range {p0 .. p0}, Lcom/jcraft/jsch/ChannelSftp$2;->close()V

    .line 1363
    const/16 v18, -0x1

    goto :goto_0

    .line 1367
    :cond_7
    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->rest_length:I

    sub-int v3, v3, v18

    move-object/from16 v0, p0

    iput v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->rest_length:I

    goto :goto_0

    .line 1371
    .end local v18           #foo:I
    :cond_8
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;
    invoke-static {v3}, Lcom/jcraft/jsch/ChannelSftp;->access$700(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/Buffer;

    move-result-object v3

    iget-object v3, v3, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v3, v3

    add-int/lit8 v3, v3, -0xd

    move/from16 v0, p3

    if-ge v3, v0, :cond_9

    .line 1372
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;
    invoke-static {v3}, Lcom/jcraft/jsch/ChannelSftp;->access$700(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/Buffer;

    move-result-object v3

    iget-object v3, v3, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v3, v3

    add-int/lit8 p3, v3, -0xd

    .line 1374
    :cond_9
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->server_version:I
    invoke-static {v3}, Lcom/jcraft/jsch/ChannelSftp;->access$800(Lcom/jcraft/jsch/ChannelSftp;)I

    move-result v3

    if-nez v3, :cond_a

    const/16 v3, 0x400

    move/from16 v0, p3

    if-le v0, v3, :cond_a

    .line 1375
    const/16 p3, 0x400

    .line 1378
    :cond_a
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;
    invoke-static {v3}, Lcom/jcraft/jsch/ChannelSftp;->access$900(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    move-result-object v3

    invoke-virtual {v3}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->count()I

    move-result v3

    if-nez v3, :cond_c

    .line 1379
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;
    invoke-static {v3}, Lcom/jcraft/jsch/ChannelSftp;->access$700(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/Buffer;

    move-result-object v3

    iget-object v3, v3, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v3, v3

    add-int/lit8 v7, v3, -0xd

    .line 1380
    .local v7, request_len:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->server_version:I
    invoke-static {v3}, Lcom/jcraft/jsch/ChannelSftp;->access$800(Lcom/jcraft/jsch/ChannelSftp;)I

    move-result v3

    if-nez v3, :cond_b

    const/16 v7, 0x400

    .line 1382
    :cond_b
    :goto_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;
    invoke-static {v3}, Lcom/jcraft/jsch/ChannelSftp;->access$900(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    move-result-object v3

    invoke-virtual {v3}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->count()I

    move-result v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/jcraft/jsch/ChannelSftp$2;->request_max:I

    if-ge v3, v4, :cond_c

    .line 1384
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/ChannelSftp$2;->val$handle:[B

    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/jcraft/jsch/ChannelSftp$2;->request_offset:J

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;
    invoke-static {v8}, Lcom/jcraft/jsch/ChannelSftp;->access$900(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    move-result-object v8

    #calls: Lcom/jcraft/jsch/ChannelSftp;->sendREAD([BJILcom/jcraft/jsch/ChannelSftp$RequestQueue;)V
    invoke-static/range {v3 .. v8}, Lcom/jcraft/jsch/ChannelSftp;->access$1000(Lcom/jcraft/jsch/ChannelSftp;[BJILcom/jcraft/jsch/ChannelSftp$RequestQueue;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1387
    move-object/from16 v0, p0

    iget-wide v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->request_offset:J

    int-to-long v5, v7

    add-long/2addr v3, v5

    move-object/from16 v0, p0

    iput-wide v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->request_offset:J

    goto :goto_1

    .line 1386
    :catch_0
    move-exception v17

    .local v17, e:Ljava/lang/Exception;
    new-instance v3, Ljava/io/IOException;

    const-string v4, "error"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1391
    .end local v7           #request_len:I
    .end local v17           #e:Ljava/lang/Exception;
    :cond_c
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;
    invoke-static {v4}, Lcom/jcraft/jsch/ChannelSftp;->access$700(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/Buffer;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jcraft/jsch/ChannelSftp$2;->header:Lcom/jcraft/jsch/ChannelSftp$Header;

    #calls: Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;
    invoke-static {v3, v4, v5}, Lcom/jcraft/jsch/ChannelSftp;->access$500(Lcom/jcraft/jsch/ChannelSftp;Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->header:Lcom/jcraft/jsch/ChannelSftp$Header;

    .line 1392
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->header:Lcom/jcraft/jsch/ChannelSftp$Header;

    iget v3, v3, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->rest_length:I

    .line 1393
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->header:Lcom/jcraft/jsch/ChannelSftp$Header;

    iget v0, v3, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    move/from16 v25, v0

    .line 1394
    .local v25, type:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->header:Lcom/jcraft/jsch/ChannelSftp$Header;

    iget v0, v3, Lcom/jcraft/jsch/ChannelSftp$Header;->rid:I

    move/from16 v20, v0

    .line 1396
    .local v20, id:I
    const/16 v24, 0x0

    .line 1398
    .local v24, rr:Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;
    invoke-static {v3}, Lcom/jcraft/jsch/ChannelSftp;->access$900(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/ChannelSftp$2;->header:Lcom/jcraft/jsch/ChannelSftp$Header;

    iget v4, v4, Lcom/jcraft/jsch/ChannelSftp$Header;->rid:I

    invoke-virtual {v3, v4}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->get(I)Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;
    :try_end_1
    .catch Lcom/jcraft/jsch/ChannelSftp$RequestQueue$OutOfOrderException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v24

    .line 1410
    const/16 v3, 0x65

    move/from16 v0, v25

    if-eq v0, v3, :cond_d

    const/16 v3, 0x67

    move/from16 v0, v25

    if-eq v0, v3, :cond_d

    .line 1411
    new-instance v3, Ljava/io/IOException;

    const-string v4, "error"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1400
    :catch_1
    move-exception v17

    .line 1401
    .local v17, e:Lcom/jcraft/jsch/ChannelSftp$RequestQueue$OutOfOrderException;
    move-object/from16 v0, v17

    iget-wide v3, v0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$OutOfOrderException;->offset:J

    move-object/from16 v0, p0

    iput-wide v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->request_offset:J

    .line 1402
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->header:Lcom/jcraft/jsch/ChannelSftp$Header;

    iget v3, v3, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    int-to-long v3, v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4}, Lcom/jcraft/jsch/ChannelSftp$2;->skip(J)J

    .line 1403
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;
    invoke-static {v3}, Lcom/jcraft/jsch/ChannelSftp;->access$900(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/ChannelSftp$2;->header:Lcom/jcraft/jsch/ChannelSftp$Header;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;
    invoke-static {v5}, Lcom/jcraft/jsch/ChannelSftp;->access$700(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/Buffer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->cancel(Lcom/jcraft/jsch/ChannelSftp$Header;Lcom/jcraft/jsch/Buffer;)V

    .line 1404
    const/16 v18, 0x0

    goto/16 :goto_0

    .line 1406
    .end local v17           #e:Lcom/jcraft/jsch/ChannelSftp$RequestQueue$OutOfOrderException;
    :catch_2
    move-exception v17

    .line 1407
    .local v17, e:Lcom/jcraft/jsch/SftpException;
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "error: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v17 .. v17}, Lcom/jcraft/jsch/SftpException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1413
    .end local v17           #e:Lcom/jcraft/jsch/SftpException;
    :cond_d
    const/16 v3, 0x65

    move/from16 v0, v25

    if-ne v0, v3, :cond_f

    .line 1414
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;
    invoke-static {v4}, Lcom/jcraft/jsch/ChannelSftp;->access$700(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/Buffer;

    move-result-object v4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/jcraft/jsch/ChannelSftp$2;->rest_length:I

    #calls: Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V
    invoke-static {v3, v4, v5}, Lcom/jcraft/jsch/ChannelSftp;->access$1100(Lcom/jcraft/jsch/ChannelSftp;Lcom/jcraft/jsch/Buffer;I)V

    .line 1415
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;
    invoke-static {v3}, Lcom/jcraft/jsch/ChannelSftp;->access$700(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/Buffer;

    move-result-object v3

    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v19

    .line 1416
    .local v19, i:I
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->rest_length:I

    .line 1417
    const/4 v3, 0x1

    move/from16 v0, v19

    if-ne v0, v3, :cond_e

    .line 1418
    invoke-virtual/range {p0 .. p0}, Lcom/jcraft/jsch/ChannelSftp$2;->close()V

    .line 1419
    const/16 v18, -0x1

    goto/16 :goto_0

    .line 1422
    :cond_e
    new-instance v3, Ljava/io/IOException;

    const-string v4, "error"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1425
    .end local v19           #i:I
    :cond_f
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;
    invoke-static {v3}, Lcom/jcraft/jsch/ChannelSftp;->access$700(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/Buffer;

    move-result-object v3

    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->rewind()V

    .line 1426
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;
    invoke-static {v4}, Lcom/jcraft/jsch/ChannelSftp;->access$700(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/Buffer;

    move-result-object v4

    iget-object v4, v4, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v5, 0x0

    const/4 v6, 0x4

    #calls: Lcom/jcraft/jsch/ChannelSftp;->fill([BII)I
    invoke-static {v3, v4, v5, v6}, Lcom/jcraft/jsch/ChannelSftp;->access$1200(Lcom/jcraft/jsch/ChannelSftp;[BII)I

    .line 1427
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;
    invoke-static {v3}, Lcom/jcraft/jsch/ChannelSftp;->access$700(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/Buffer;

    move-result-object v3

    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v22

    .local v22, length_of_data:I
    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->rest_length:I

    add-int/lit8 v3, v3, -0x4

    move-object/from16 v0, p0

    iput v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->rest_length:I

    .line 1439
    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->rest_length:I

    sub-int v23, v3, v22

    .line 1441
    .local v23, optional_data:I
    move-object/from16 v0, p0

    iget-wide v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->offset:J

    move/from16 v0, v22

    int-to-long v5, v0

    add-long/2addr v3, v5

    move-object/from16 v0, p0

    iput-wide v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->offset:J

    .line 1442
    move/from16 v18, v22

    .line 1443
    .restart local v18       #foo:I
    if-lez v18, :cond_19

    .line 1444
    move/from16 v16, v18

    .line 1445
    .local v16, bar:I
    move/from16 v0, v16

    move/from16 v1, p3

    if-le v0, v1, :cond_10

    .line 1446
    move/from16 v16, p3

    .line 1448
    :cond_10
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;
    invoke-static {v3}, Lcom/jcraft/jsch/ChannelSftp;->access$200(Lcom/jcraft/jsch/ChannelSftp;)Ljava/io/InputStream;

    move-result-object v3

    move-object/from16 v0, p1

    move/from16 v1, p2

    move/from16 v2, v16

    invoke-virtual {v3, v0, v1, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v19

    .line 1449
    .restart local v19       #i:I
    if-gez v19, :cond_11

    .line 1450
    const/16 v18, -0x1

    goto/16 :goto_0

    .line 1452
    :cond_11
    sub-int v18, v18, v19

    .line 1453
    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lcom/jcraft/jsch/ChannelSftp$2;->rest_length:I

    .line 1455
    if-lez v18, :cond_13

    .line 1456
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->rest_byte:[B

    array-length v3, v3

    move/from16 v0, v18

    if-ge v3, v0, :cond_12

    .line 1457
    move/from16 v0, v18

    new-array v3, v0, [B

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->rest_byte:[B

    .line 1459
    :cond_12
    const/4 v15, 0x0

    .line 1460
    .local v15, _s:I
    move/from16 v14, v18

    .line 1462
    .local v14, _len:I
    :goto_2
    if-lez v14, :cond_13

    .line 1463
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;
    invoke-static {v3}, Lcom/jcraft/jsch/ChannelSftp;->access$200(Lcom/jcraft/jsch/ChannelSftp;)Ljava/io/InputStream;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/ChannelSftp$2;->rest_byte:[B

    invoke-virtual {v3, v4, v15, v14}, Ljava/io/InputStream;->read([BII)I

    move-result v21

    .line 1464
    .local v21, j:I
    if-gtz v21, :cond_17

    .line 1470
    .end local v14           #_len:I
    .end local v15           #_s:I
    .end local v21           #j:I
    :cond_13
    if-lez v23, :cond_14

    .line 1471
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;
    invoke-static {v3}, Lcom/jcraft/jsch/ChannelSftp;->access$200(Lcom/jcraft/jsch/ChannelSftp;)Ljava/io/InputStream;

    move-result-object v3

    move/from16 v0, v23

    int-to-long v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/io/InputStream;->skip(J)J

    .line 1474
    :cond_14
    move/from16 v0, v22

    int-to-long v3, v0

    move-object/from16 v0, v24

    iget-wide v5, v0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->length:J

    cmp-long v3, v3, v5

    if-gez v3, :cond_15

    .line 1475
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;
    invoke-static {v3}, Lcom/jcraft/jsch/ChannelSftp;->access$900(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/ChannelSftp$2;->header:Lcom/jcraft/jsch/ChannelSftp$Header;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;
    invoke-static {v5}, Lcom/jcraft/jsch/ChannelSftp;->access$700(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/Buffer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->cancel(Lcom/jcraft/jsch/ChannelSftp$Header;Lcom/jcraft/jsch/Buffer;)V

    .line 1477
    :try_start_2
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/jcraft/jsch/ChannelSftp$2;->val$handle:[B

    move-object/from16 v0, v24

    iget-wide v3, v0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->offset:J

    move/from16 v0, v22

    int-to-long v5, v0

    add-long v10, v3, v5

    move-object/from16 v0, v24

    iget-wide v3, v0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->length:J

    move/from16 v0, v22

    int-to-long v5, v0

    sub-long/2addr v3, v5

    long-to-int v12, v3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;
    invoke-static {v3}, Lcom/jcraft/jsch/ChannelSftp;->access$900(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    move-result-object v13

    #calls: Lcom/jcraft/jsch/ChannelSftp;->sendREAD([BJILcom/jcraft/jsch/ChannelSftp$RequestQueue;)V
    invoke-static/range {v8 .. v13}, Lcom/jcraft/jsch/ChannelSftp;->access$1000(Lcom/jcraft/jsch/ChannelSftp;[BJILcom/jcraft/jsch/ChannelSftp$RequestQueue;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .line 1482
    move-object/from16 v0, v24

    iget-wide v3, v0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->offset:J

    move-object/from16 v0, v24

    iget-wide v5, v0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->length:J

    add-long/2addr v3, v5

    move-object/from16 v0, p0

    iput-wide v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->request_offset:J

    .line 1485
    :cond_15
    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->request_max:I

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/ChannelSftp$2;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    #getter for: Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;
    invoke-static {v4}, Lcom/jcraft/jsch/ChannelSftp;->access$900(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    move-result-object v4

    invoke-virtual {v4}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->size()I

    move-result v4

    if-ge v3, v4, :cond_16

    .line 1486
    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->request_max:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->request_max:I

    .line 1489
    :cond_16
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->val$monitor:Lcom/jcraft/jsch/SftpProgressMonitor;

    if-eqz v3, :cond_18

    .line 1490
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp$2;->val$monitor:Lcom/jcraft/jsch/SftpProgressMonitor;

    move/from16 v0, v19

    int-to-long v4, v0

    invoke-interface {v3, v4, v5}, Lcom/jcraft/jsch/SftpProgressMonitor;->count(J)Z

    move-result v3

    if-nez v3, :cond_18

    .line 1491
    invoke-virtual/range {p0 .. p0}, Lcom/jcraft/jsch/ChannelSftp$2;->close()V

    .line 1492
    const/16 v18, -0x1

    goto/16 :goto_0

    .line 1465
    .restart local v14       #_len:I
    .restart local v15       #_s:I
    .restart local v21       #j:I
    :cond_17
    add-int v15, v15, v21

    .line 1466
    sub-int v14, v14, v21

    goto/16 :goto_2

    .line 1481
    .end local v14           #_len:I
    .end local v15           #_s:I
    .end local v21           #j:I
    :catch_3
    move-exception v17

    .local v17, e:Ljava/lang/Exception;
    new-instance v3, Ljava/io/IOException;

    const-string v4, "error"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .end local v17           #e:Ljava/lang/Exception;
    :cond_18
    move/from16 v18, v19

    .line 1496
    goto/16 :goto_0

    .line 1498
    .end local v16           #bar:I
    .end local v19           #i:I
    :cond_19
    const/16 v18, 0x0

    goto/16 :goto_0
.end method

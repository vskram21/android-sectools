.class public Lcom/jcraft/jsch/jcraft/Compression;
.super Ljava/lang/Object;
.source "Compression.java"

# interfaces
.implements Lcom/jcraft/jsch/Compression;


# static fields
.field private static final BUF_SIZE:I = 0x1000


# instance fields
.field private final buffer_margin:I

.field private inflated_buf:[B

.field private stream:Lcom/jcraft/jzlib/ZStream;

.field private tmpbuf:[B

.field private type:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const/16 v0, 0x34

    iput v0, p0, Lcom/jcraft/jsch/jcraft/Compression;->buffer_margin:I

    .line 39
    const/16 v0, 0x1000

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/jcraft/Compression;->tmpbuf:[B

    .line 42
    new-instance v0, Lcom/jcraft/jzlib/ZStream;

    invoke-direct {v0}, Lcom/jcraft/jzlib/ZStream;-><init>()V

    iput-object v0, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    .line 43
    return-void
.end method


# virtual methods
.method public compress([BI[I)[B
    .locals 9
    .parameter "buf"
    .parameter "start"
    .parameter "len"

    .prologue
    const/4 v8, 0x0

    .line 60
    iget-object v5, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    iput-object p1, v5, Lcom/jcraft/jzlib/ZStream;->next_in:[B

    .line 61
    iget-object v5, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    iput p2, v5, Lcom/jcraft/jzlib/ZStream;->next_in_index:I

    .line 62
    iget-object v5, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    aget v6, p3, v8

    sub-int/2addr v6, p2

    iput v6, v5, Lcom/jcraft/jzlib/ZStream;->avail_in:I

    .line 64
    move v2, p2

    .line 65
    .local v2, outputlen:I
    move-object v1, p1

    .line 66
    .local v1, outputbuf:[B
    const/4 v4, 0x0

    .line 69
    .local v4, tmp:I
    :cond_0
    iget-object v5, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    iget-object v6, p0, Lcom/jcraft/jsch/jcraft/Compression;->tmpbuf:[B

    iput-object v6, v5, Lcom/jcraft/jzlib/ZStream;->next_out:[B

    .line 70
    iget-object v5, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    iput v8, v5, Lcom/jcraft/jzlib/ZStream;->next_out_index:I

    .line 71
    iget-object v5, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    const/16 v6, 0x1000

    iput v6, v5, Lcom/jcraft/jzlib/ZStream;->avail_out:I

    .line 72
    iget-object v5, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Lcom/jcraft/jzlib/ZStream;->deflate(I)I

    move-result v3

    .line 73
    .local v3, status:I
    packed-switch v3, :pswitch_data_0

    .line 85
    sget-object v5, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "compress: deflate returnd "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 88
    :goto_0
    iget-object v5, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    iget v5, v5, Lcom/jcraft/jzlib/ZStream;->avail_out:I

    if-eqz v5, :cond_0

    .line 90
    aput v2, p3, v8

    .line 91
    return-object v1

    .line 75
    :pswitch_0
    iget-object v5, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    iget v5, v5, Lcom/jcraft/jzlib/ZStream;->avail_out:I

    rsub-int v4, v5, 0x1000

    .line 76
    array-length v5, v1

    add-int v6, v2, v4

    add-int/lit8 v6, v6, 0x34

    if-ge v5, v6, :cond_1

    .line 77
    add-int v5, v2, v4

    add-int/lit8 v5, v5, 0x34

    mul-int/lit8 v5, v5, 0x2

    new-array v0, v5, [B

    .line 78
    .local v0, foo:[B
    array-length v5, v1

    invoke-static {v1, v8, v0, v8, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 79
    move-object v1, v0

    .line 81
    .end local v0           #foo:[B
    :cond_1
    iget-object v5, p0, Lcom/jcraft/jsch/jcraft/Compression;->tmpbuf:[B

    invoke-static {v5, v8, v1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 82
    add-int/2addr v2, v4

    .line 83
    goto :goto_0

    .line 73
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public init(II)V
    .locals 2
    .parameter "type"
    .parameter "level"

    .prologue
    const/4 v1, 0x1

    .line 46
    if-ne p1, v1, :cond_1

    .line 47
    iget-object v0, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    invoke-virtual {v0, p2}, Lcom/jcraft/jzlib/ZStream;->deflateInit(I)I

    .line 48
    iput v1, p0, Lcom/jcraft/jsch/jcraft/Compression;->type:I

    .line 55
    :cond_0
    :goto_0
    return-void

    .line 50
    :cond_1
    if-nez p1, :cond_0

    .line 51
    iget-object v0, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    invoke-virtual {v0}, Lcom/jcraft/jzlib/ZStream;->inflateInit()I

    .line 52
    const/16 v0, 0x1000

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/jcraft/Compression;->inflated_buf:[B

    .line 53
    const/4 v0, 0x0

    iput v0, p0, Lcom/jcraft/jsch/jcraft/Compression;->type:I

    goto :goto_0
.end method

.method public uncompress([BI[I)[B
    .locals 8
    .parameter "buffer"
    .parameter "start"
    .parameter "length"

    .prologue
    const/4 v7, 0x0

    .line 95
    const/4 v1, 0x0

    .line 97
    .local v1, inflated_end:I
    iget-object v4, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    iput-object p1, v4, Lcom/jcraft/jzlib/ZStream;->next_in:[B

    .line 98
    iget-object v4, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    iput p2, v4, Lcom/jcraft/jzlib/ZStream;->next_in_index:I

    .line 99
    iget-object v4, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    aget v5, p3, v7

    iput v5, v4, Lcom/jcraft/jzlib/ZStream;->avail_in:I

    .line 102
    :goto_0
    iget-object v4, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    iget-object v5, p0, Lcom/jcraft/jsch/jcraft/Compression;->tmpbuf:[B

    iput-object v5, v4, Lcom/jcraft/jzlib/ZStream;->next_out:[B

    .line 103
    iget-object v4, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    iput v7, v4, Lcom/jcraft/jzlib/ZStream;->next_out_index:I

    .line 104
    iget-object v4, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    const/16 v5, 0x1000

    iput v5, v4, Lcom/jcraft/jzlib/ZStream;->avail_out:I

    .line 105
    iget-object v4, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lcom/jcraft/jzlib/ZStream;->inflate(I)I

    move-result v3

    .line 106
    .local v3, status:I
    sparse-switch v3, :sswitch_data_0

    .line 135
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "uncompress: inflate returnd "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 136
    const/4 v4, 0x0

    :goto_1
    return-object v4

    .line 108
    :sswitch_0
    iget-object v4, p0, Lcom/jcraft/jsch/jcraft/Compression;->inflated_buf:[B

    array-length v4, v4

    add-int/lit16 v5, v1, 0x1000

    iget-object v6, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    iget v6, v6, Lcom/jcraft/jzlib/ZStream;->avail_out:I

    sub-int/2addr v5, v6

    if-ge v4, v5, :cond_1

    .line 109
    iget-object v4, p0, Lcom/jcraft/jsch/jcraft/Compression;->inflated_buf:[B

    array-length v4, v4

    mul-int/lit8 v2, v4, 0x2

    .line 110
    .local v2, len:I
    add-int/lit16 v4, v1, 0x1000

    iget-object v5, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    iget v5, v5, Lcom/jcraft/jzlib/ZStream;->avail_out:I

    sub-int/2addr v4, v5

    if-ge v2, v4, :cond_0

    .line 111
    add-int/lit16 v4, v1, 0x1000

    iget-object v5, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    iget v5, v5, Lcom/jcraft/jzlib/ZStream;->avail_out:I

    sub-int v2, v4, v5

    .line 112
    :cond_0
    new-array v0, v2, [B

    .line 113
    .local v0, foo:[B
    iget-object v4, p0, Lcom/jcraft/jsch/jcraft/Compression;->inflated_buf:[B

    invoke-static {v4, v7, v0, v7, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 114
    iput-object v0, p0, Lcom/jcraft/jsch/jcraft/Compression;->inflated_buf:[B

    .line 116
    .end local v0           #foo:[B
    .end local v2           #len:I
    :cond_1
    iget-object v4, p0, Lcom/jcraft/jsch/jcraft/Compression;->tmpbuf:[B

    iget-object v5, p0, Lcom/jcraft/jsch/jcraft/Compression;->inflated_buf:[B

    iget-object v6, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    iget v6, v6, Lcom/jcraft/jzlib/ZStream;->avail_out:I

    rsub-int v6, v6, 0x1000

    invoke-static {v4, v7, v5, v1, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 119
    iget-object v4, p0, Lcom/jcraft/jsch/jcraft/Compression;->stream:Lcom/jcraft/jzlib/ZStream;

    iget v4, v4, Lcom/jcraft/jzlib/ZStream;->avail_out:I

    rsub-int v4, v4, 0x1000

    add-int/2addr v1, v4

    .line 120
    aput v1, p3, v7

    goto :goto_0

    .line 123
    :sswitch_1
    array-length v4, p1

    sub-int/2addr v4, p2

    if-le v1, v4, :cond_2

    .line 124
    add-int v4, v1, p2

    new-array v0, v4, [B

    .line 125
    .restart local v0       #foo:[B
    invoke-static {p1, v7, v0, v7, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 126
    iget-object v4, p0, Lcom/jcraft/jsch/jcraft/Compression;->inflated_buf:[B

    invoke-static {v4, v7, v0, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 127
    move-object p1, v0

    .line 132
    .end local v0           #foo:[B
    :goto_2
    aput v1, p3, v7

    move-object v4, p1

    .line 133
    goto :goto_1

    .line 130
    :cond_2
    iget-object v4, p0, Lcom/jcraft/jsch/jcraft/Compression;->inflated_buf:[B

    invoke-static {v4, v7, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2

    .line 106
    nop

    :sswitch_data_0
    .sparse-switch
        -0x5 -> :sswitch_1
        0x0 -> :sswitch_0
    .end sparse-switch
.end method

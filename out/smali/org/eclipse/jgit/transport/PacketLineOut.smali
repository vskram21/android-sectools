.class public Lorg/eclipse/jgit/transport/PacketLineOut;
.super Ljava/lang/Object;
.source "PacketLineOut.java"


# static fields
.field private static final hexchar:[B


# instance fields
.field private flushOnEnd:Z

.field private final lenbuffer:[B

.field private final out:Ljava/io/OutputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 155
    const/16 v0, 0x10

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/eclipse/jgit/transport/PacketLineOut;->hexchar:[B

    return-void

    :array_0
    .array-data 0x1
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
    .end array-data
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .parameter "outputStream"

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    iput-object p1, p0, Lorg/eclipse/jgit/transport/PacketLineOut;->out:Ljava/io/OutputStream;

    .line 78
    const/4 v0, 0x5

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/transport/PacketLineOut;->lenbuffer:[B

    .line 79
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/PacketLineOut;->flushOnEnd:Z

    .line 80
    return-void
.end method

.method private formatLength(I)V
    .locals 1
    .parameter "w"

    .prologue
    .line 159
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PacketLineOut;->lenbuffer:[B

    invoke-static {v0, p1}, Lorg/eclipse/jgit/transport/PacketLineOut;->formatLength([BI)V

    .line 160
    return-void
.end method

.method static formatLength([BI)V
    .locals 4
    .parameter "lenbuffer"
    .parameter "w"

    .prologue
    .line 163
    const/4 v0, 0x3

    .local v0, o:I
    move v1, v0

    .line 164
    .end local v0           #o:I
    .local v1, o:I
    :goto_0
    if-ltz v1, :cond_0

    if-eqz p1, :cond_0

    .line 165
    add-int/lit8 v0, v1, -0x1

    .end local v1           #o:I
    .restart local v0       #o:I
    sget-object v2, Lorg/eclipse/jgit/transport/PacketLineOut;->hexchar:[B

    and-int/lit8 v3, p1, 0xf

    aget-byte v2, v2, v3

    aput-byte v2, p0, v1

    .line 166
    ushr-int/lit8 p1, p1, 0x4

    move v1, v0

    .end local v0           #o:I
    .restart local v1       #o:I
    goto :goto_0

    .line 168
    :cond_0
    :goto_1
    if-ltz v1, :cond_1

    .line 169
    add-int/lit8 v0, v1, -0x1

    .end local v1           #o:I
    .restart local v0       #o:I
    const/16 v2, 0x30

    aput-byte v2, p0, v1

    move v1, v0

    .end local v0           #o:I
    .restart local v1       #o:I
    goto :goto_1

    .line 170
    :cond_1
    return-void
.end method


# virtual methods
.method public end()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 136
    invoke-direct {p0, v3}, Lorg/eclipse/jgit/transport/PacketLineOut;->formatLength(I)V

    .line 137
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PacketLineOut;->out:Ljava/io/OutputStream;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/PacketLineOut;->lenbuffer:[B

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 138
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/PacketLineOut;->flushOnEnd:Z

    if-eqz v0, :cond_0

    .line 139
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/PacketLineOut;->flush()V

    .line 140
    :cond_0
    return-void
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 152
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PacketLineOut;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 153
    return-void
.end method

.method public setFlushOnEnd(Z)V
    .locals 0
    .parameter "flushOnEnd"

    .prologue
    .line 90
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/PacketLineOut;->flushOnEnd:Z

    .line 91
    return-void
.end method

.method public writePacket([B)V
    .locals 4
    .parameter "packet"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 117
    array-length v0, p1

    add-int/lit8 v0, v0, 0x4

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/PacketLineOut;->formatLength(I)V

    .line 118
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PacketLineOut;->out:Ljava/io/OutputStream;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/PacketLineOut;->lenbuffer:[B

    const/4 v2, 0x0

    const/4 v3, 0x4

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 119
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PacketLineOut;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 120
    return-void
.end method

.method public writeString(Ljava/lang/String;)V
    .locals 1
    .parameter "s"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    invoke-static {p1}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/PacketLineOut;->writePacket([B)V

    .line 104
    return-void
.end method

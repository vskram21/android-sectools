.class public Lorg/eclipse/jgit/util/io/MessageWriter;
.super Ljava/io/Writer;
.source "MessageWriter.java"


# instance fields
.field private final buf:Ljava/io/ByteArrayOutputStream;

.field private final enc:Ljava/io/OutputStreamWriter;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    .line 79
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/util/io/MessageWriter;->buf:Ljava/io/ByteArrayOutputStream;

    .line 80
    new-instance v0, Ljava/io/OutputStreamWriter;

    invoke-virtual {p0}, Lorg/eclipse/jgit/util/io/MessageWriter;->getRawStream()Ljava/io/OutputStream;

    move-result-object v1

    sget-object v2, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {v0, v1, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    iput-object v0, p0, Lorg/eclipse/jgit/util/io/MessageWriter;->enc:Ljava/io/OutputStreamWriter;

    .line 81
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    return-void
.end method

.method public flush()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    return-void
.end method

.method public getRawStream()Ljava/io/OutputStream;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/MessageWriter;->buf:Ljava/io/ByteArrayOutputStream;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/MessageWriter;->buf:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public write([CII)V
    .locals 2
    .parameter "cbuf"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    iget-object v1, p0, Lorg/eclipse/jgit/util/io/MessageWriter;->buf:Ljava/io/ByteArrayOutputStream;

    monitor-enter v1

    .line 86
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/MessageWriter;->enc:Ljava/io/OutputStreamWriter;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStreamWriter;->write([CII)V

    .line 87
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/MessageWriter;->enc:Ljava/io/OutputStreamWriter;

    invoke-virtual {v0}, Ljava/io/OutputStreamWriter;->flush()V

    .line 88
    monitor-exit v1

    .line 89
    return-void

    .line 88
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

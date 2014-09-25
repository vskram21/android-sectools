.class public Lorg/eclipse/jgit/lib/ObjectStream$Filter;
.super Lorg/eclipse/jgit/lib/ObjectStream;
.source "ObjectStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/ObjectStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Filter"
.end annotation


# instance fields
.field private final in:Ljava/io/InputStream;

.field private final size:J

.field private final type:I


# direct methods
.method public constructor <init>(IJLjava/io/InputStream;)V
    .locals 0
    .parameter "type"
    .parameter "size"
    .parameter "in"

    .prologue
    .line 176
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ObjectStream;-><init>()V

    .line 177
    iput p1, p0, Lorg/eclipse/jgit/lib/ObjectStream$Filter;->type:I

    .line 178
    iput-wide p2, p0, Lorg/eclipse/jgit/lib/ObjectStream$Filter;->size:J

    .line 179
    iput-object p4, p0, Lorg/eclipse/jgit/lib/ObjectStream$Filter;->in:Ljava/io/InputStream;

    .line 180
    return-void
.end method


# virtual methods
.method public available()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 194
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectStream$Filter;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    return v0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 229
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectStream$Filter;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 230
    return-void
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 189
    iget-wide v0, p0, Lorg/eclipse/jgit/lib/ObjectStream$Filter;->size:J

    return-wide v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 184
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectStream$Filter;->type:I

    return v0
.end method

.method public mark(I)V
    .locals 1
    .parameter "readlimit"

    .prologue
    .line 219
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectStream$Filter;->in:Ljava/io/InputStream;

    invoke-virtual {v0, p1}, Ljava/io/InputStream;->mark(I)V

    .line 220
    return-void
.end method

.method public markSupported()Z
    .locals 1

    .prologue
    .line 214
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectStream$Filter;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->markSupported()Z

    move-result v0

    return v0
.end method

.method public read()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 204
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectStream$Filter;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 1
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 209
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectStream$Filter;->in:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public reset()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 224
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectStream$Filter;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->reset()V

    .line 225
    return-void
.end method

.method public skip(J)J
    .locals 2
    .parameter "n"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 199
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectStream$Filter;->in:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    return-wide v0
.end method

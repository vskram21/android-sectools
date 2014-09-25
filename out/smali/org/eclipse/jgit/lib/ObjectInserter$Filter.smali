.class public abstract Lorg/eclipse/jgit/lib/ObjectInserter$Filter;
.super Lorg/eclipse/jgit/lib/ObjectInserter;
.source "ObjectInserter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/ObjectInserter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Filter"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 95
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ObjectInserter;-><init>()V

    return-void
.end method


# virtual methods
.method protected buffer()[B
    .locals 1

    .prologue
    .line 101
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectInserter$Filter;->delegate()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectInserter;->buffer()[B

    move-result-object v0

    return-object v0
.end method

.method protected abstract delegate()Lorg/eclipse/jgit/lib/ObjectInserter;
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 140
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectInserter$Filter;->delegate()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectInserter;->flush()V

    .line 141
    return-void
.end method

.method public idFor(IJLjava/io/InputStream;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .parameter "objectType"
    .parameter "length"
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 114
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectInserter$Filter;->delegate()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/eclipse/jgit/lib/ObjectInserter;->idFor(IJLjava/io/InputStream;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public idFor(I[B)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .parameter "type"
    .parameter "data"

    .prologue
    .line 105
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectInserter$Filter;->delegate()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/lib/ObjectInserter;->idFor(I[B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public idFor(I[BII)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .parameter "type"
    .parameter "data"
    .parameter "off"
    .parameter "len"

    .prologue
    .line 109
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectInserter$Filter;->delegate()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/eclipse/jgit/lib/ObjectInserter;->idFor(I[BII)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public idFor(Lorg/eclipse/jgit/lib/TreeFormatter;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .parameter "formatter"

    .prologue
    .line 118
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectInserter$Filter;->delegate()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/lib/ObjectInserter;->idFor(Lorg/eclipse/jgit/lib/TreeFormatter;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public insert(IJLjava/io/InputStream;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .parameter "objectType"
    .parameter "length"
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectInserter$Filter;->delegate()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(IJLjava/io/InputStream;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public insert(I[B)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .parameter "type"
    .parameter "data"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 122
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectInserter$Filter;->delegate()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(I[B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public insert(I[BII)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .parameter "type"
    .parameter "data"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectInserter$Filter;->delegate()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(I[BII)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public newPackParser(Ljava/io/InputStream;)Lorg/eclipse/jgit/transport/PackParser;
    .locals 1
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 136
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectInserter$Filter;->delegate()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/lib/ObjectInserter;->newPackParser(Ljava/io/InputStream;)Lorg/eclipse/jgit/transport/PackParser;

    move-result-object v0

    return-object v0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 144
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectInserter$Filter;->delegate()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    .line 145
    return-void
.end method
